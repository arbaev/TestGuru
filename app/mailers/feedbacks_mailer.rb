class FeedbacksMailer < ApplicationMailer
  def new_feedback(feedback)
    @feedback = feedback

    mail to: admin_email, subject: "Testguru feedback message from #{@feedback.name}"
  end

  private

  def admin_email
    User.find_by(type: 'Admin').email
  end
end
