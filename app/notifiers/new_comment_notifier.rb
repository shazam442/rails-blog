# To deliver this notification:
#
# NewCommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class NewCommentNotifier < ApplicationNotifier
  alias_method :comment, :record

  has_one :post, through: :record
  # Add your delivery methods
  #
  # deliver_by :email do |config|
  #   config.mailer = "UserMailer"
  #   config.method = "new_post"
  # end
  #
  # bulk_deliver_by :slack do |config|
  #   config.url = -> { Rails.application.credentials.slack_webhook_url }
  # end
  #
  # deliver_by :custom do |config|
  #   config.class = "MyDeliveryMethod"
  # end

  validates :record, presence: true
  validate :validate_record_type

  # Add required params
  #
  # required_param :message

  def message
    "#{comment.user.name} commented on #{post.title.truncate(20)}"
  end

  def path
    post_path(comment.post || "")
  end

  def post
    comment.post
  end

  private


  def validate_record_type
    errors.add(:record_type, "must be a Comment") unless record.is_a? Comment
  end
end
