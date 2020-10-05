class Board < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :name, uniqueness: true
  
  validates :description, presence: true
end
