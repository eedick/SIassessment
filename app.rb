require 'sinatra'
require 'twilio-ruby'

post '/receive-sms' do
	content_type 'text/xml'

	response = Twilio::TwiML::response.now do |r|
		r.Message "Thanks for signing up!"
	end

	response.to_xml
end


post '/send_sms' do
	to = params["to"]
	message = params["body"]

	client = Twilio::REST::Client.new(
			ENV["TWILIO_ACCOUNT_SID"]
			ENV["TWILIO_AUTH_TOKEN"]
		)

	client.messages.creat(
		to: to,
		from: "+13472464495",
		body: "Thanks for signing up!"
		)
end