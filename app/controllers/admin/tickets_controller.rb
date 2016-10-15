class Admin::TicketsController < Admin::BaseController
  before_action :set_claimed_ticket, only: [:edit, :update]

  def index
    @unclaimed_tickets = Ticket.unclaimed
    @my_tickets = current_admin.tickets

    respond_to do |format|
      format.html
      format.pdf do
        render :pdf         => "file_name",
               :template    => 'admin/tickets/index.pdf.erb',
               :page_size   => "A4",
               :encoding    =>  'utf-8'
        end
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
    @ticket_message = @ticket.ticket_messages.build
  end

  def edit
    @ticket_message = @ticket.ticket_messages.build
  end

  def update
    if @ticket.switch_closed_status
      redirect_to admin_tickets_path, notice: "The ticket has been updated"
    else
      render :edit
    end
  end

protected
  def set_claimed_ticket
    @ticket = current_admin.tickets.find(params[:id])
  end
end
