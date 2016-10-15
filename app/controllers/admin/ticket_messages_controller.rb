class Admin::TicketMessagesController < Admin::BaseController
  def create
    current_ticket = current_admin.tickets.find(params[:ticket_id])
    ticket_message = current_admin.ticket_messages.build(message_params)
    ticket_message.ticket = current_ticket

    if ticket_message.save
      redirect_to admin_ticket_path(current_ticket)
    else
      redirect_to edit_admin_ticket_path(admin_ticket)
    end
  end

protected
  def message_params
    params.require(:ticket_message).permit(:content)
  end
end
