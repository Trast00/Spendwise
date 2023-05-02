class Categorie < ApplicationRecord
  belongs_to :user
  has_many :payments, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true

  def self.total_amount(list_categories)
    list_categories.reduce(0) { |sum, category| sum + category.total_amount }
  end

  def total_amount
    payments.sum(:amount)
  end
end
