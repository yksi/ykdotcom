class Post < ActiveRecord::Base
  acts_as_commentable

  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  validates :content, presence: true
end
