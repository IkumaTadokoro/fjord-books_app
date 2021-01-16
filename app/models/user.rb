# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[github]

  has_one_attached :avatar

  has_many :relationships_as_follower, class_name: 'Relationship', foreign_key: :follower_id, dependent: :destroy, inverse_of: :follower
  has_many :followings, through: :relationships_as_follower
  has_many :relationships_as_following, class_name: 'Relationship', foreign_key: :following_id, dependent: :destroy, inverse_of: :following
  has_many :followers, through: :relationships_as_following

  validates :uid, uniqueness: { scope: :provider }, if: -> { uid.present? }

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
    end
  end

  def follow(user)
    relationships_as_follower.create!(following_id: user.id)
  end

  def unfollow(user)
    relationships_as_follower.find_by(following_id: user.id).destroy!
  end

  def following?(user)
    relationships_as_follower.where(following_id: user.id).exists?
  end

  def followed?(user)
    relationships_as_following.where(follower_id: user.id).exists?
  end
end
