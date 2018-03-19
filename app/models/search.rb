class Search < ApplicationRecord


  def tickets
    @tickets ||= find_tickets
  end

  def coupons
    @coupons ||= find_coupons
  end

private
  
  def find_tickets
    tickets = Ticket.order(:flight_date)
    tickets = tickets.where("airline like ?", "%#{airline}%") if airline.present?
    tickets = tickets.where("flight_no like ?", "%#{flight_no}%") if flight_no.present?
    tickets = tickets.where("destination like ?", "%#{destination}%") if destination.present?
    tickets = tickets.where("flight_date >= ?", date_from) if date_from.present?
    tickets = tickets.where("flight_date <= ?", date_to) if date_to.present?
    tickets = tickets.where("price >= ?", min_price) if min_price.present?
    tickets = tickets.where("price <= ?", max_price) if max_price.present?
    tickets
  end

  def find_coupons
    coupons = Coupon
    coupons = coupons.where("airline like ?", "%#{airline}%") if airline.present?
    coupons = coupons.where("destination like ?", "%#{destination}%") if destination.present?
    coupons = coupons.where("flight_date_from >= ?", date_from ) if date_from.present?
    coupons = coupons.where("flight_date_to<= ?", date_to ) if date_to.present?
    coupons
  end

end

