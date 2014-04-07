class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_posts, class_name: 'Post', foreign_key: 'sender_id'
  has_many :recieved_posts, class_name: 'Post', foreign_key: 'recipient_id'

  def fullname
    [first_name, last_name].join(' ') || first_name
  end

  def name
    email || fullname
  end
end
