require 'mailgun'
require 'pry'
module Requester

  #if not provide, this is the dev API key for my account
  API_KEY = "key-2688a747e654a09456a9a8151f09ceee"
  #if not provide, this is the sandbox domain for my account
  DOMAIN = "sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org"
  DEFAULT_SENDER = "Jonathan <jonathan.cabas@sandbox5b33d3b7058543a29bac9432fcdb9756.mailgun.org>"


  #Like to preserve all calls to the API in a single file
  #Assume that Mailgun API v3 is stable and won't change in the near future
  def send_message
    send unless SuppressionList.include?(receiver)
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

  private

  def data
    {}.tap do |hsh|
      hsh[:from] = sender
      hsh[:to] = receiver
      hsh[:subject] = subject
      hsh[:text] = "Testing some Mailgun awesomness!"
      hsh[:html] = "<html>#{text}<br><br>Sent via #{link}</html>"
      hsh["o:campaign"] = campaign_id
      hsh["o:tracking"] = true
    end
  end
  #html is necessary in order to track the opened and clicked event

  def link
    "<a href='http://www.mailgun.com/'>Mailgun</a>"
  end

  def send
    RestClient.post "https://api:#{Requester::API_KEY}"\
      "@api.mailgun.net/v3/#{Requester::DOMAIN}/messages", data
  end
end
