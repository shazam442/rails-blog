class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }

    belongs_to :user
    has_many :comments, dependent: :destroy

    has_many :comment_notifications, through: :comments, source: :notifications, class_name: "Noticed::Notification"
end
