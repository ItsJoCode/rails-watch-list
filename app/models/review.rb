class Review < ApplicationRecord
  RATING = (0..5)
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :comment, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: RATING }
  validates :rating, numericality: { only_integer: true }
end
