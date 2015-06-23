require 'twilio-ruby'
require './.env.rb'

class Notifier

  MESSAGE = "Your order will arrive at {time}"

  attr_accessor :message, :via, :client, :to, :via, :from

  def initialize opts = {}
    @message = opts[ :message ] || 'MESSAGE'
    @from    = opts[ :from    ] || '+441622523155'
    @to      = opts[ :to      ] || '+4407761960879'
    @via     = opts[ :via     ] || Twilio::REST::Client.new( ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN'] )
  end

  def self.call( *args )
    new(*args).send_message  
  end

  def send_message 
    via.messages.create( {
                            from: from,
                            to:   to,
                            body: message
    } ) 
  end

  private

  def time
    ( Time.now + 3600 ).strftime "%R"
  end

end
