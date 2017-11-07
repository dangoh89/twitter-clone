class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :twits
  has_many :friendships
  has_many :followers, through: :friendships

  has_attached_file :image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def not_followers_with?(follower_id)
    friendships.where(follower_id: follower_id).count < 1
  end

  def except_current_user(users)
    users.reject { |user| user.id == self.id }
  end

  def self.username_matches(param)
    matches('username', param)
  end

  def self.email_matches(param)
    matches('email', param)
  end

  def self.search(param)
    return User.none if param.blank?

    param.strip!
    param.downcase!
    (username_matches(param) + email_matches(param)).uniq
  end

  def self.matches(field_name, param)
    where("lower(#{field_name}) like ?", "%#{param}%")
  end
end
