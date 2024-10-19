class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_rich_text :body

  after_save_commit :notify_user

  has_many :noticed_events, as: :record, dependent: :destroy, class_name: "Noticed::Event"
  has_many :notifications, through: :noticed_events, class_name: "Noticed::Notification"

  private

  def notify_user
    NewCommentNotifier.with(record: self).deliver(post.user) unless user == post.user
  end
end
