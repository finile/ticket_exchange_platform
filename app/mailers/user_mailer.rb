class UserMailer < ApplicationMailer

  default from: "New Relaese Hold Ticket Exchange Platform <ticket.exchange.p@gmail.com>"

    def notify_buyer(comment)
      @comment = comment
      @content = "Here are someone offering the ticket you want!"

      mail to:  comment.user.email,   #comboard.user.email
      subject: "New Relaese Hold Ticket Exchange Platform | 你徵求的機票已經有賣家提供了"
    end



    def weekly_email(recipients)
      @recipients = recipients
      mail(
        to: recipients.map(&:email).uniq,
        subject: "Weekly new ticket newsletter of New Release Hold Ticket Exchange Platform"
      )
    end

end
