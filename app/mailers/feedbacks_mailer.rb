class FeedbacksMailer < ApplicationMailer
  default to: :admin_email

  def new_feedback(feedback)
    @feedback = feedback

    mail subject: "Testguru feedback message from #{@feedback.name}"
  end

  private

  def admin_email
    User.find_by(type: 'Admin').email
  end
end
