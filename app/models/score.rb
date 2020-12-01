class Score < ApplicationRecord
  has_many :pages, dependent: :destroy
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: :user

  belongs_to :collection
  belongs_to :composer

  delegate :user, to: :collection

  has_one_attached :file
  has_one_attached :cover

  GENRES = ["Rock", "Classique", "R&B", "Pirate Metal", "Reggae", "Opera", "k-pop"]

  def push_pages_to_cloudinary
    ImportScorePagesJob.perform_later(self)
  end

  def shared?
    collaborations.any?
  end
end
