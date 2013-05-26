$.rails.allowAction = (element) ->
  # The message is something like "Are you sure?"
  message = element.data('confirm')
  # If there's no message, there's no data-confirm attribute,
  # which means there's nothing to confirm
  return true unless message
  # Clone the clicked element (probably a delete link) so we can use it in the dialog box.
  $link = element.clone()
  # We don't necessarily want the same styling as the original link/button.
    .removeAttr('class')
  # We don't want to pop up another confirmation (recursion)
    .removeAttr('data-confirm')
  # We want a button
    .addClass('btn').addClass('btn-danger')
  # We want it to sound confirmy
    .html("Yes, I'm positively certain.")

  # Create the modal box with the message
  modal_html = """
               <div class="modal" id="confirmModal">
               <div class="modal-header">
               <a class="close" href="#" data-dismiss="modal"><i class="icon-remove-circle" style="margin-right:-5px;"></i></a>
               <h3>#{message}</h3>
               </div>
               <div class="modal-body">
               <p>This action is irreversible. Be certain, sonny.</p>
               </div>
               <div class="modal-footer">
               <a data-dismiss="modal" class="btn">Cancel</a>
               </div>
               </div>
               """
  $modal_html = $(modal_html)
  # Add the new button to the modal box
  $modal_html.find('.modal-footer').append($link)
  # Pop it up
  $modal_html.modal({keyboard: true })
  # Prevent the original link from working
  return false