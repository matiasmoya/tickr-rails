class Api::V1::TicketsController < Api::V1::BaseController
  def index
    render json: current_user.tickets, status: :ok
  end

  def show
    @ticket = current_user.tickets.find(params[:id])
    render json: @ticket
  end

  def create
    ticket = current_user.tickets.build(ticket_params)

    if ticket.save
      render json: ticket, status: :ok
    else
      render json: { errors: ticket.errors.full_messages }, status: :unprocessable_entity
    end
  end

protected
  def ticket_params
    params.require(:ticket).permit(:subject, :content)
  end
end
