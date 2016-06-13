require 'mailgun'
require 'pry'
module Requester

  API_KEY = "key-2688a747e654a09456a9a8151f09ceee"
  DOMAIN = "sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org"
  DEFAULT_SENDER = "Jonathan <jonathan.cabas@sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org>"

  def send_message
    send unless SuppressionList.include?(receiver)
  end

  def send
    RestClient.post "https://api:#{Requester::API_KEY}"\
      "@api.mailgun.net/v3/#{Requester::DOMAIN}/messages",
      :from => sender,
      :to => receiver,
      :subject => subject,
      :text => text,
      "o:campaign" => campaign_id
  end

  def search_for_emails_sent_to(recipient)
    RestClient.get "https://api:#{Requester::API_KEY}"\
      "@api.mailgun.net/v3/#{Requester::DOMAIN}/events",
      :params => {
        :'recipient' => recipient,
        :'event' => 'delivered'
      }
  end

  def list_of_emails_sent_to(recipient)
    events = search_for_emails_sent_to(recipient)
    events_hsh = JSON.parse(events)
    return {} if events_hsh["items"].empty?
    {}.tap do |hsh|
      hsh[recipient] = events_hsh["items"].map do |event|
        {
          message_id: event["message"]["headers"]["message-id"],
          subject: event["message"]["headers"]["subject"]
        }
      end
    end
  end

  def get_email_blacklist(type)
    RestClient.get "https://api:#{Requester::API_KEY}"\
      "@api.mailgun.net/v3/#{Requester::DOMAIN}/#{type}"
  end
end
