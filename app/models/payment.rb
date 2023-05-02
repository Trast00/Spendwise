class Payment < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_or_equal_to: 0 }
end
