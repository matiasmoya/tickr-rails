class Admin::TicketClaimsController < Admin::BaseController

  def create
    ticket = Ticket.find(params[:ticket_id])

    if ticket.update_attributes(admin: current_admin)
      redirect_to admin_ticket_path(ticket)
    else
      redirect_to admin_tickets_path
    end
  end

end
