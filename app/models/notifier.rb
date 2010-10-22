class Notifier < ActionMailer::Base
 default_url_options[:host] = "vauban.heroku.com"  
 
 def password_reset_instructions(user)
    @subject      = "Password Reset Instructions for Vauban"
    @from         = "vauban@zeneffy.fr"
    @recipients   = user.email
    @content_type = "text/html"
    @sent_on      = Time.now
    @body[:edit_password_reset_url] = edit_password_reset_url(user.perishable_token)
  end

 def feedback(feedback)
    @recipients  = 'vauban@zeneffy.fr'
    @from        = 'vauban@zeneffy.fr'
    @subject     = "[Feedback for Vauban.zeneffy.fr] #{feedback.subject}"
    @content_type="text/html"
    @sent_on     = Time.now
    @body[:feedback] = feedback    
  end 

 def new_user(user)
    @recipients  = 'vauban@zeneffy.fr'
    @from        = 'vauban@zeneffy.fr'
    @subject     = "[Vauban.zeneffy.fr] New user!"
    @content_type="text/html"
    @sent_on     = Time.now
    @body[:user] = user
  end
  
  def connection(user)
    @recipients  = user.email
    @from        = 'vauban@zeneffy.fr'
    @subject     = "Connection to your Vauban account"
    @content_type="text/html"
    @sent_on     = Time.now
    @body[:user] = user
  end
  
  
end
