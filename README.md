# README

git clone https://github.com/finile/ticket_exchange_platform.git
cd ticket_exchange_platform
bundle install
rails db:migrate
rails dev:fake_ticket
rails dev:fake_user

admin:
account: root@example.com
password: 12345678