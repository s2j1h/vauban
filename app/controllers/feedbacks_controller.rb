class FeedbacksController < ApplicationController
  layout false
  
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?
      Notifier.deliver_feedback(@feedback)
      render :status => :created, :text => 'Thank you for your feedback!'
    else
      render :status => 500, :text => 'Sorry, an error occurs sending your feedback'
    end
    
    
  end
  
end
