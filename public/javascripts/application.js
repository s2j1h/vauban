//FEEDBACK FORM
        var url;     
        $(document).ready(function(){

                var subject = $("#subject_feedback"),
                    email = $("#email_feedback"),
                    comment = $("#comment_feedback"),
                    allFields = $([]).add(subject).add(email).add(comment),
                    tips = $(".validateTips");

                function updateTips(t) {
                    tips
                        .text(t)
                        .addClass('ui-state-highlight');
                    setTimeout(function() {
                        tips.removeClass('ui-state-highlight', 1500);
                    }, 500);
                }

                function checkLength(o,n,min,max) {

                    if ( o.val().length > max || o.val().length < min ) {
                        o.addClass('ui-state-error');
                        updateTips("Length of " + n + " must be between "+min+" and "+max+".");
                        return false;
                    } else {
                        return true;
                    }

                }

                function checkRegexp(o,regexp,n) {

                    if ( !( regexp.test( o.val() ) ) ) {
                        o.addClass('ui-state-error');
                        updateTips(n);
                        return false;
                    } else {
                        return true;
                    }
                }

            $("a.feedback").click(function(event){
                event.preventDefault();
                $("#dialog-feedback-form").dialog('open');
                $("#subject:last").focus();
            });
            $('#dialog-feedback-form').find('input').keypress(function(e) {
                    if ((e.which && e.which == 13) || (e.keyCode && e.keyCode == 13)) {
                            $(this).parent().parent().parent().parent().find('.ui-dialog-buttonpane').find('button:first').click(); /* Assuming the first one is the action button */
                            return false;
                    }
            });
            
            $("#dialog-feedback-ajax").dialog({
                autoOpen:false,
                modal: true,
                resizable: false,
                buttons: {
                    Ok: function() {
                        $(this).dialog('close');
                    }
                }
            });
            $("#dialog-feedback-form").dialog({
                autoOpen: false,
                modal: true,
                closeOnEscape: false,
                resizable: false,
                buttons: {
                    'Feedback': function() {
                    var bValid = true;
                    allFields.removeClass('ui-state-error');

                    bValid = bValid && checkLength(subject,"subject",3,50);
                    bValid = bValid && checkLength(email,"email",6,80);
                    bValid = bValid && checkLength(comment,"comment",10,2000);

                    bValid = bValid && checkRegexp(email,/^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i,"Wrong email format. eg. ui@jquery.com");
                    
                    if (bValid) {
                        $(this).dialog('close');
                        $.ajax({
                           type: "POST",
                           url: "/feedbacks",
                           data: ({"feedback[subject]" :subject.val() ,"feedback[email]" : email.val(),"feedback[comment]" : comment.val(), "authenticity_token" : AUTH_TOKEN} ),
                           success: function(msg){
                               $("<span id='dialog-feedback-ajax-span'>"+msg+"</span>").replaceAll("#dialog-feedback-ajax-span");
                               $("#dialog-feedback-ajax").dialog('open');
  
                           },
                           error: function(msg){
                               $("<span id='dialog-feedback-ajax-span'>"+msg+"</span>").replaceAll("#dialog-feedback-ajax-span");
                               $("#dialog-feedback-ajax").dialog('open'); 
                           } 
                         });
 
                        return false;
                    }
                    },
                    'Cancel': function() {              
                        $(this).dialog('close');
                        return false;
                    }
                },
                Cancel: function() {
                    $(this).dialog('close');
                    return false;
                }
            });         

            // focus on the first text input field in the first field on the page
            $("input[type='text']:first", document.forms[0]).focus();

        });

