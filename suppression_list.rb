require './requester'
require 'pry'
class SuppressionList
  extend Requester
  TYPES = ['bounces', 'unsubscribes', 'complaints']

  def self.call
    TYPES.map do |type|
      struct = self.get_email_blacklist(type)
      hsh = JSON.parse(struct)
      hsh["items"].map{|x| x["address"]}
    end.flatten.uniq #a single email could be in several lists
  end

  def self.include?(email)
    call.include?(email)
  end

end
