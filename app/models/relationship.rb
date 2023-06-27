class Relationship < ApplicationRecord
  belongs_to :user
  belongs_to :follower, class_name: 'User'

  validates :user_id, presence: true,uniqueness: { scope: :follower_id }
  validates :follower_id, presence: true,uniqueness: { scope: :user_id }
end
