require 'twilio-ruby'
require 'faker'

class CallController < ApplicationController
  protect_from_forgery :except => [:voice]

  # def call
  #   @post = Post.find(params[:id])
  #   client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
  #   c = client.calls.create(
  #     from: ENV["TWILIO_PHONE_NUMBER"],
  #     to: @post.tel,
  #     url: 'http://demo.twilio.com/docs/voice.xml',
  #     #url: "http://localhost:3000/posts/message",
  #   )
  #   redirect_to action: :index
  # end


  def token
    # Create a random username for the client
    identity = Faker::Internet.user_name.gsub(/[^0-9a-z_]/i, '')

    capability = Twilio::JWT::ClientCapability.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
    # allow outgoing calls to an application
    outgoing_scope = Twilio::JWT::ClientCapability::OutgoingClientScope.new ENV['TWILIO_TWIML_APP_SID']
    capability.add_scope(outgoing_scope)

    # allow incoming calls to 'andrew'
    incoming_scope = Twilio::JWT::ClientCapability::IncomingClientScope.new identity
    capability.add_scope(incoming_scope)

    # generate the token string
    token = capability.to_s
    # Generate the token and send to client
    result = {:identity => identity, :token => token}
    render :json => result
  end

  def voice
    twiml = Twilio::TwiML::VoiceResponse.new do |r|#Twilio::TwiML::Response.new do |r|
      #r.enqueue(name: "queue_01")
      if params['To'] and params['To'] != ''
        #params['To'].gsub!("\+", " ") if params['To'].start_with?("+")
        r.dial(caller_id: ENV['TWILIO_CALLER_ID']) do |d|
        #r.Dial callerId: ENV['TWILIO_CALLER_ID'] do |d|
          if params['To'] =~ /^[\d\+\-\(\) ]+$/
            d.number params['To']
          else
            d.client params['To']
          end
        end
      else
        r.say("Thanks for calling!")
      end
    end
    logger.debug(twiml.to_s)
    render xml: twiml.to_s
  end

end
