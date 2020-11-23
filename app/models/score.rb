class Score < ApplicationRecord
  has_many :pages
  belongs_to :collection
end
