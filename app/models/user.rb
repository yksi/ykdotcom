class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :avatar, AvatarUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :created_posts, class_name: 'Post', foreign_key: 'sender_id'
  has_many :recieved_posts, class_name: 'Post', foreign_key: 'recipient_id'

  has_many :sent_messages, class_name: 'Message', foreign_key: 'sender_id'
  has_many :recieved_messages, class_name: 'Message', foreign_key: 'recipient_id'

  acts_as_follower
  acts_as_followable

  def fullname
    [first_name, last_name].join(' ') || first_name
  end

  def name
    if fullname.present?
      fullname
    else
      email
    end
  end

  def online?
    updated_at > 10.minutes.ago
  end

  def unread_messages_count
    count = 0
    self.recieved_messages.each do |m|
      if !m.read
        count += 1
      end
    end
    count
  end
end
