namespace :dev do

  task fake_ticket: :environment do
    Ticket.destroy_all

    #from creating rand time of ticket
    now = Time.now
    a_day_ago = now - 60*60*24
    #create 25 fack tickets information
    User.all.each do |user|
      rand(5).times do
        user.tickets.create(
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
    end
    puts "have created fake tickets by users"
    puts "now you have #{Ticket.count} tickets data"
  end

  task fake_railticket: :environment do
    Railticket.destroy_all

    #from creating rand time of ticket
    now = Time.now
    a_day_ago = now - 60*60*24
    arrive_time = a_day_ago + 60*3

    #create 25 fake tickets information
  25.times do |i|
    Railticket.create!(

      train_no: rand(100..1500),
      train_date: FFaker::Time.date,
      departure_time: rand(a_day_ago..now),
      arrive_time: rand(arrive_time..now),
      departure: FFaker::Address.city,
      destination: FFaker::Address.city,
      name: FFaker::Name.name.upcase,
      price: rand(900..2000),
      image: FFaker::Avatar.image,
      others:FFaker::Lorem::sentence(15)
    )
  end
  puts "have created fake railtickets"
  puts "now you have #{Railticket.count} railtickets data"
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


  task fake_coupon: :environment do
    Coupon.destroy_all
    #create 25 fack tickets information
    User.all.each do |user|
      rand(5).times do
        user.coupons.create(
          airline: FFaker::Airline.name,
          destination: FFaker::Address.city,
          coupon_expiry_date: FFaker::Time.date,
          flight_date_from: FFaker::Time.date,
          flight_date_to: FFaker::Time.date,
          tax: FFaker::Lorem::word,
          image: FFaker::Avatar.image,
          others:FFaker::Lorem::sentence(15)
        )
      end
    end
    puts "have created fake coupons by users"
    puts "now you have #{Coupon.count} coupons data"
  end

  task fake_comment: :environment do
    Comment.destroy_all

    Ticket.all.each do |ticket|
      3.times do |i|
        ticket.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake comments"
    puts "now you have #{Comment.count} comment data"


  Railticket.all.each do |railticket|
    3.times do |i|
      railticket.comments.create!(
        content: FFaker::Lorem.sentence,
        user: User.all.sample
      )
    end
  end
  puts "have created fake railticket comments"
  puts "now you have #{Comment.count} railticket comment data"

 end

 task fake_favorite: :environment do
   Favorite.destroy_all

   20.times do |i|

     Favorite.create!(
       user_id: User.all.sample.id,
       ticket_id: Ticket.all.sample.id,
       railticket_id: Railticket.all.sample.id,
     )

     puts "have created fake favorite"
     puts "now you have 20 favorite data"
   end
 end

end
