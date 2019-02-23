class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)

    if @feedback.valid?
      FeedbacksMailer.new_feedback(@feedback).deliver_now
      redirect_to new_feedback_path
      flash[:notice] = t('.notice')
    else
      flash[:alert] = t('.alert')
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:name, :email, :message)
  end
end
