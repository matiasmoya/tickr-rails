class Api::V1::TicketMessagesController < Api::V1::BaseController
  def create
    ticket_message = current_user.ticket_messages.build(message_params)

    if ticket_message.save
      render json: ticket_message
    else
      render json: ticket_message, status: :unprocessable_entity
    end
  end

protected
  def message_params
    params.require(:ticket_message).permit(:ticket_id, :content)
  end
end