class SubscribeJob < ApplicationJob
  
  include SuckerPunch::Job
  queue_as :defaul

  def perform(id)
    ActiveRecord::Base.connection_pool.with_connection do
      user = User.find(id)
      mailchimp_list_id = Rails.application.secrets.mailchimp_list_id
      email = email.email

      begin
        g = Gibbon::API.new
        g.lists.subscribe({ id: mailchimp_list_id, email:  {email: email}})

        SubscribeMailer.confirmation_email(user).deliver
      rescue Gibbon::MailChimpError => mce
        SuckerPunch.logger.error("subscribe failed: due to #{mce.message}")
        raise mce
      rescue Exception => e
        SuckerPunch.logger.error("subscribe failed: due to #{e.message}")
        raise e
      end
    end
  end

  def perform(user)
    gb = Gibbon::API.new
    gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => user.email}, :merge_vars => {:FNAME => user.first_name, :LNAME => user.last_name}, :double_optin => false})
  end

end
