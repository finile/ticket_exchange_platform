class Search < ApplicationRecord

  def tickets
    @tickets ||= find_tickets
  end

private
  
  def find_tickets
    tickets = Ticket.order(:flight_date)
    tickets = tickets.where("airline like ?", "%#{airline}%") if airline.present?
    tickets = tickets.where("flight_no like ?", "%#{flight_no}%") if flight_no.present?
    tickets = tickets.where("Date >= ?", date_from) if date_from.present?
    tickets = tickets.where("Date <= ?", date_to) if date_to.present?
    tickets = tickets.where("price >= ?", min_price) if min_price.present?
    tickets = tickets.where("price <= ?", max_price) if max_price.present?
    tickets
  end

end

