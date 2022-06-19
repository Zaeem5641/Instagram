# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts , dependent: :destroy

  has_one_attached :image
  has_many :likes , dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :stories , dependent: :destroy

  has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
  has_many :followees, through: :followed_users
  has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
  has_many :followers, through: :following_users

  private

  def self.search(query)
    if query
      User.where('full_name like ?', "%#{query}%")
    else
      nil
    end
  end

end
