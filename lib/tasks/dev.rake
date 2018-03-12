namespace :dev do
  task fake_ticket: :environment do
    Ticket.destroy_all

    #from creating rand time of ticket
    now = Time.now
    a_day_ago = now - 60*60*24

    #create 25 fack tickets information
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
        quantity: rand(1..5),
        image: FFaker::Avatar.image,
        others:FFaker::Lorem::sentence(15)
      )
    end
    puts "have created fake tickets"
    puts "now you have #{Ticket.count} tickets data"
  end

  task fake_user: :environment do 
    User.destroy_all

    10.times do |i|
      name = FFaker::Name::first_name
      user = User.new(
        name: name,
        email: "#{name}@example.co",
        password: "12345678",
      )
      user.save!
      puts user.name
    end

    User.create(
      email: "root@example.com",
      password: 12345678,
      name: "Admin",
      role: "admin"
      )
    puts "admin has been created"

  end

end
