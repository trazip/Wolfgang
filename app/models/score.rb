class Score < ApplicationRecord
  has_many :pages, dependent: :destroy
  has_many :collaborations
  belongs_to :collection
  belongs_to :composer
  has_one_attached :file
  has_one_attached :cover

  after_create_commit :push_pages_to_cloudinary

  GENRES = ["Rock", "Classique", "R&B", "Pirate Metal", "Reggae", "Opera", "k-pop"]

  private

  def push_pages_to_cloudinary
    ImportScorePagesJob.perform_later(self)
  end
end
