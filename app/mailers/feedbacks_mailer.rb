class FeedbacksMailer < ApplicationMailer
  default to: -> { Admin.pluck(:email) }

  def new_feedback(feedback)
    @feedback = feedback

    mail subject: "Testguru feedback message from #{@feedback.name}"
  end
end
