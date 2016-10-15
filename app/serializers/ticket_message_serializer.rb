class TicketMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :from

  def from
    return "Admin" if object.admin.present?
    return "You" if object.user == scope
  end
end
