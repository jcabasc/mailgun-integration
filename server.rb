require 'sinatra'
require 'json'
require 'pry'

post '/payload' do
  params = request.params
  puts "####################"
  puts "Event type: #{params.delete('event').upcase}"
  puts "--------------------"
  props=["city","domain","device-type","client-type","region","client-name","recipient"]
  props.each{|prop| puts prop.upcase + ": " + params[prop] }
  puts "####################"
end
