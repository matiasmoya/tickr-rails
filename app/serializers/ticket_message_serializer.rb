class TicketMessageSerializer < ActiveModel::Serializer
  attributes :id, :content, :from

  def from
    "Admin" if object.admin.present?
    "You" if object.user == scope
  end
end
