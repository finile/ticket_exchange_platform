class UserMailer < ApplicationMailer
  default from: "Ticket Exchange Platform <ticket.exchange.p@gmail.com>"

    def notify_buyer(board)
      @board = board
      @content = "Here are someone offering the ticket you want!"

      mail to: board.user.email,
      subject: "Ticket Exchange Platform | 你徵求的機票已經有賣家提供了"
    end



    def weekly_email(recipients)
      @recipients = recipients
      mail(
        to: recipients.map(&:email).uniq,
        subject: "Weekly new ticket newsletter of Ticket Exchange Platform"
      )
    end

end
