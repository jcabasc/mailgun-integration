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
        :'recipient' => recipient
      }
  end

  def get_email_blacklist(type)
    RestClient.get "https://api:#{Requester::API_KEY}"\
      "@api.mailgun.net/v3/#{Requester::DOMAIN}/#{type}"
  end
end
