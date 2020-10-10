class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates :nickname, presence: true

  def avatar_image
    if self&.avatar&.attached?
      self.avatar
    else
      'default-avatar.png'
    end
  end

  def display_name
    self&.nickname || email
  end
end
