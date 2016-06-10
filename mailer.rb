require "pry"
require './requester'
class Mailer
  include Requester
  attr_reader :sender, :receiver, :subject, :text, :campaign_id

  def initialize(receiver, subject, text, campaign_id = "nxagd", sender = DEFAULT_SENDER)
    @sender = sender
    @receiver = receiver
    @subject = subject
    @text = text
    @campaign_id = campaign_id
  end
end
