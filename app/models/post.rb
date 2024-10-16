class Post < ApplicationRecord
    validates :title, presence: true, length: { minimum: 5, maximum: 50 }
    validates :body, presence: true, length: { minimum: 10, maximum: 1000 }

    has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
    has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"
    
    belongs_to :user
    has_many :comments, dependent: :destroy
end
