class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }

    belongs_to :user

    has_rich_text :body

    has_many :comments, dependent: :destroy
    has_many :comment_notifications, through: :comments, source: :notifications, class_name: "Noticed::Notification"

    private

    def self.ransackable_attributes(auth_object = nil)
        [ "title", "body" ]
    end

    def self.ransackable_associations(auth_object = nil)
        [ "user" ]
    end
end
