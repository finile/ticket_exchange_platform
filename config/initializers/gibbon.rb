# Gibbon::API.api_key = Rails.application.secrets.mailchimp_api_key
# Gibbon::API.timeout = 15
# Gibbon::API.throws_exceptions = true
# puts "MailChimp API key: #{Gibbon::API.api_key}" # temporary
# if Rails.env.test?
#   Gibbon::Export.api_key = "fake"
#   Gibbon::Export.throws_exceptions = false
# end
#
# Rails.configuration.mailchimp = Gibbon::API.new(ENV['MAILCHIMP_KEY'])

# Gibbon::Request.api_key = ENV["MAILCHIMP_API_KEY"]
Gibbon::Request.api_key = Rails.application.secrets.mailchimp_api_key
Gibbon::Request.timeout = 15
Gibbon::Request.throws_exceptions = false
