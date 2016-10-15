class Api::V1::TicketsController < Api::V1::BaseController
  def index
    render json: {data: Ticket.all}, status: :ok
  end
end
