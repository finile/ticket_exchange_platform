namespace :dev do
  task fake_ticket: :environment do
    Ticket.destroy_all

    now = Time.now
    a_day_ago = now - 60*60*24

    25.times do |i|
      Ticket.create!(
        airline: FFaker::Airline.name,
        flight_no: FFaker::Airline.flight_number,
        flight_date: FFaker::Time.date,
        flight_time: rand(a_day_ago..now),
        departure: FFaker::Address.city,
        destination: FFaker::Address.city,
        name: FFaker::Name.name.upcase, 
        price: rand(1000..10000),
        image: FFaker::Avatar.image,
        others:FFaker::Lorem::sentence(15)
      )
    end
    puts "have created fake tickets"
    puts "now you have #{Ticket.count} tickets data"
  end


end
