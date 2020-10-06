class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board

  validates :name, presence: true 
  validates :description, presence: true
end
