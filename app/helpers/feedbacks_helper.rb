module FeedbacksHelper 
  
  
  
  def feedback_init(options = {})
    options = {
      "position" => "null"
    }.merge(options.stringify_keys)
    
    options['position'] = "'#{options['position']}'" unless options['position'].blank? || options['position'] == 'null'
    content_tag 'script', :type => "text/javascript" do
      "$(document).ready(function() { $('.feedback_link').feedback({tabPosition: #{options["position"]}}); });"
    end  
    
  end
  
  def feedback_includes()
    stylesheet_link_tag('feedback') +
    javascript_include_tag('jquery.feedback.js')
  end
  
  def feedback_tab(options = {})
    feedback_init({'position' => 'top'}.merge(options.stringify_keys))
  end
  
  def feedback_form()
   html = ""
   html << "<div id='dialog-feedback-form' title='Give feedback' style='display:none'><p>Please leave us feedback, it's really appreciated.</p><p class='validateTips'>All form fields are required.</p><form id='feedback-form'><p>"
   html <<  label_tag('subject')
   html << ":<br/>" 
   html <<  select_tag('subject_feedback', '<option selected="selected">Problem</option><option>Question</option><option>Suggestion</option><option>Other</option>' , :class => 'text ui-widget-content')
   html <<  "</p> <p>"
   html <<  label_tag('email')
   html <<  ":<br/>"
   if current_user
    html << text_field_tag('email_feedback', current_user.email,:class => 'text ui-widget-content')
   else
    html << text_field_tag('email_feedback', nil,:class => 'text ui-widget-content')
   end
   html <<  "</p><p>"
   html <<  label_tag('comment')
   html << ":<br />"
   html <<  text_area_tag('comment_feedback', nil, :cols => 35, :rows => 7,  :class => 'text ui-widget-content')
   html <<  "</p>  </form> </div>"
   
   html << "<div id='dialog-feedback-ajax' title='Give feedback' style='display:none'><span id='dialog-feedback-ajax-span'></span></div>"
  end
  

  
  def feedback_link(text, options = {})
    link_to text, '#', :class => "feedback_link"
  end
  
end
