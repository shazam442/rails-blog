# To deliver this notification:
#
# NewCommentNotifier.with(record: @post, message: "New post").deliver(User.all)

class NewCommentNotifier < ApplicationNotifier
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

  private
  
  def validate_record_type
    errors.add(:record_type, "must be a Comment") unless record_type == "Comment"
  end
end