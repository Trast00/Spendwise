class Categorie < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :icon, presence: true
end
