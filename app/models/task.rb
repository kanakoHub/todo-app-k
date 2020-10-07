class Task < ApplicationRecord
  belongs_to :user
  belongs_to :board
  has_one_attached :eyecatch

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :description, presence: true
end
