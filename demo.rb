#!/usr/bin/env ruby
require 'flowroute_numbers_and_messaging'
require 'pp'
puts("Number/Route Management v2 & Messaging v2.1 Demo")

# Set up your api credentials and test mobile number for outbound SMS or MMS
basic_auth_user_name = ENV['FR_ACCESS_KEY'] # Your Flowroute Access Key
basic_auth_password = ENV['FR_SECRET_KEY'] # Your Flowroute Secret Key
mobile_number = "YOUR_MOBILE_NUMBER" # Your mobile number; to receive messages sent from your Flowroute account 


# Instantiate API client and create controllers for Numbers, Messages, and Routes
client = FlowrouteNumbersAndMessaging::FlowrouteNumbersAndMessagingClient.new(
        basic_auth_user_name: basic_auth_user_name,
        basic_auth_password: basic_auth_password
)
numbers_controller = client.numbers
routes_controller = client.routes
messages_controller = client.messages

puts("--List Available Area Codes")
max_setup_cost = 3.25
limit = 3
offset = nil
result = numbers_controller.list_available_area_codes(limit, offset, max_setup_cost)
pp(result)

puts("--List Available Exchange Codes")
limit = 3
offset = nil
max_setup_cost = nil
areacode = 347
result = numbers_controller.list_available_exchange_codes(limit, offset, max_setup_cost, areacode)
pp(result)

puts("--Search for Purchasable Phone Numbers")
starts_with = 646
contains = 3
ends_with = 7
limit = 3
offset = nil
rate_center = nil
state = nil
result = numbers_controller.search_for_purchasable_phone_numbers(starts_with, contains, ends_with, limit, offset, rate_center, state)
pp(result)

puts("--Purchase a Phone Number")
purchasable_number = result['data'][0]['id']
#result = numbers_controller.purchase_a_phone_number(purchasable_number)
#pp(result)

puts("--List Account Phone Numbers")
starts_with = 201
ends_with = nil
contains = nil
limit = 3
offset = nil
result = numbers_controller.list_account_phone_numbers(starts_with, ends_with, contains, limit, offset)
pp(result)

puts("--List Phone Number Details")
number_id = result['data'][0]['id']
result = numbers_controller.list_phone_number_details(number_id)
pp(result)

puts("---Create an Inbound Route")
# Function to generate six-charac random string
genstring = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
new_route = (0...6).map { genstring[rand(genstring.length)] }.join + '.sonsofodin.com'
range = ((48..57).to_a+(65..90).to_a).map{ |i| i.chr }
route_alias = Array.new(6){ range.sample }.join
request_body = '{ 
  "data": { 
    "type": "route", 
    "attributes": { 
      "route_type": "host", 
      "value": "' + new_route.to_s + '", 
      "alias": "' + route_alias.to_s + '" 
    } 
  } 
}'
result = routes_controller.create_an_inbound_route(request_body)
pp(result)

puts ("---List Inbound Routes")
limit = 3
result = routes_controller.list_inbound_routes(limit)
pp(result)


prirouteid = result['data'][1]['id']
secrouteid = result['data'][2]['id']
request_body = '{ 
  "data": { 
    "type": "route", 
    "id": "' + prirouteid +'" 
  } 
}'

puts("---Update Primary Voice Route")
priroute_result = routes_controller.update_primary_voice_route(number_id, request_body)
puts priroute_result
if priroute_result.nil?
        puts "204: No Content"
else
        puts priroute_result
end

request_body = '{ 
  "data": { 
    "type": "route", 
    "id": "' + secrouteid +'" 
  } 
}'

puts("---Update Failover Voice Route")
secroute_result = routes_controller.update_failover_voice_route(number_id, request_body)
if secroute_result.nil?
        puts "204: No Content"
else
        puts secroute_result
end

#Compact JSON format for outbound MMS
request_body = '{ 
      "to": "' + mobile_number.to_s + '", 
      "from": "' + number_id.to_s + '",
      "body": "hello there", 
      "is_mms": "true", 
      "media_urls": ["https://s3-us-west-2.amazonaws.com/mms-testing/01f2c5551bc24c91b22a084081211eb0.png"] 
}'

puts("---Send An MMS")
#result = messages_controller.send_a_message(request_body)
#pp(result)

#Compact JSON format for outbound SMS with a callback URL
request_body = '{ 
      "to": "' + mobile_number.to_s + '", 
      "from": "' + number_id.to_s + '",
      "body": "test SMS", 
      "dlr_callback": "https://ycx56aoy9j.execute-api.us-west-2.amazonaws.com/dev/message_to_slack"
}'
puts request_body

puts("---Send An SMS with Callback")
#result = messages_controller.send_a_message(request_body)
#pp(result)

puts("---Look Up A Set Of Messages")
start_date = "2017-12-01"
end_date = "2018-01-08"
limit = 2
result = messages_controller.look_up_a_set_of_messages(start_date, end_date, limit)
pp(result)

puts ("---Look Up A Message Detail Record")
message_id = result['data'][0]['id']
result = messages_controller.look_up_a_message_detail_record(message_id)
pp(result)
