module ApplicationHelper
  def switch_status(ticket)
    ticket.closed? ? 'Re-Open Ticket' : 'Close Ticket'
  end

  def status_label(ticket)
    ticket.closed? ? 'Closed' : 'Open'
  end

  def status_class(ticket)
    ticket.closed? ? 'btn btn-danger' : 'btn btn-info'
  end
end
