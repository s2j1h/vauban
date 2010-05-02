class FeedbackMailer < ActionMailer::Base
  
  def feedback(feedback)
    @recipients  = 'julien.raigneau+gmail@gmail.com'
    @from        = 'vauban@zeneffy.fr'
    @subject     = "[Feedback for Vauban.zeneffy.fr] #{feedback.subject}"
    @sent_on     = Time.now
    @body[:feedback] = feedback    
  end

end
