class Page < ApplicationRecord
  belongs_to :score
  has_one :annotation, dependent: :destroy
  has_one_attached :file

  def is_first?
    score.pages.first == self
  end

  def is_last?
    score.pages.last == self
  end

  def next
    score.pages[score.pages.find_index(self) + 1]
  end

  def previous
    score.pages[score.pages.find_index(self) - 1]
  end
end
