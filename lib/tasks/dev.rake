namespace :dev do
  task fake: [:fake_user, :fake_ticket, :fake_railticket, :fake_coupon, :fake_comboard, :fake_comment, :fake_favorite]

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


  task fake_ticket: :environment do
    Ticket.destroy_all
    file = File.open("#{Rails.root}/public/images/370x232.png")
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
          image: file,
          others:FFaker::Lorem::sentence(15)
        )
      end
    end
    puts "have created fake tickets by users"
    puts "now you have #{Ticket.count} tickets data"
  end

  task fake_railticket: :environment do
    Railticket.destroy_all
    file = File.open("#{Rails.root}/public/images/370x232.png")
    #from creating rand time of ticket
    now = Time.now
    a_day_ago = now - 60*60*24
    arrive_time = a_day_ago + 60*3

    #create 25 fake tickets information
    User.all.each do |user|
      rand(5).times do
        user.railtickets.create(
        train_no: rand(100..1500),
        train_date: FFaker::Time.date,
        departure_time: rand(a_day_ago..now),
        arrive_time: rand(arrive_time..now),
        departure: FFaker::Address.city,
        destination: FFaker::Address.city,
        name: FFaker::Name.name.upcase,
        price: rand(900..2000),
        discount: rand(65..90),
        image: file,
        others:FFaker::Lorem::sentence(15),
        quantity: rand(1..5)
      )
      end
    end

    puts "have created fake railtickets"
    puts "now you have #{Railticket.count} railtickets data"
  end


  task fake_coupon: :environment do
    Coupon.destroy_all
    #create 25 fake coupons information
    file = File.open("#{Rails.root}/public/images/370x232.png")
    User.all.each do |user|
      rand(5).times do
        user.coupons.create(
          airline: FFaker::Airline.name,
          destination: FFaker::Address.city,
          departure: FFaker::Address.city, 
          coupon_expiry_date: FFaker::Time.date,
          flight_date_from: FFaker::Time.date,
          flight_date_to: FFaker::Time.date,
          tax: FFaker::Lorem::word,
          image: file,
          others:FFaker::Lorem::sentence(15),
          quantity: rand(1..5),
          price: rand(1000..10000)
        )
      end
    end
    puts "have created fake coupons by users"
    puts "now you have #{Coupon.count} coupons data"
  end

  task fake_comboard: :environment do
    Comboard.destroy_all
    #create 25 fake comboards information
    User.all.each do |user|
      rand(5).times do
        user.comboards.create(
          departure: FFaker::Address.city,
          destination: FFaker::Address.city,
          flight_date_from: FFaker::Time.date,
          flight_date_to: FFaker::Time.date,
          price: rand(1000..10000),
          content:FFaker::Lorem::sentence(15)
        )
      end
    end
    puts "have created fake comboards by users"
    puts "now you have #{Comboard.count} comboards data"
  end

  task fake_favorite: :environment do
   Favorite.destroy_all
   50.times do |i|
     Favorite.create!(
       user_id: User.all.sample.id,
       ticket_id: Ticket.all.sample.id,
       railticket_id: Railticket.all.sample.id,
     )
    end
    puts "have created fake favorite"
    puts "now you have 50 favorite data"
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

    Coupon.all.each do |coupon|
      3.times do |i|
        coupon.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake coupon comments"
    puts "now you have #{Comment.count} coupon comment data"

    Comboard.all.each do |comboard|
      3.times do |i|
        comboard.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample
        )
      end
    end
    puts "have created fake comboard comments"
    puts "now you have #{Comment.count} comboard comment data"
  end

end
