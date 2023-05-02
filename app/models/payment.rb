class Payment < ApplicationRecord
  belongs_to :user
  has_many :categories, dependent: :destroy

  validates :user, presence: true
  validates :name, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
