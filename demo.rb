#!/usr/bin/env ruby
require 'flowroute_numbers_and_messaging'
require 'pp'

puts("Number/Route Management v2 & Messaging v2.1 Demo")
# Set up your api credentials and test mobile number for outbound SMS or MMS
basic_auth_user_name = FlowrouteNumbersAndMessaging::Configuration.basic_auth_user_name  # Your Flowroute Access Key
basic_auth_password = FlowrouteNumbersAndMessaging::Configuration.basic_auth_password # Your Flowroute Secret Key
mobile_number = "YOUR MOBILE NUMBER HERE" # Your mobile number; to receive messages sent from your Flowroute account 

# Instantiate API client and create controllers for Numbers, Messages, and Routes
client = FlowrouteNumbersAndMessaging::FlowrouteNumbersAndMessagingClient.new(
    basic_auth_user_name: basic_auth_user_name,
    basic_auth_password: basic_auth_password
)

# Setup our controllers
numbers_controller = client.numbers
routes_controller = client.routes
messages_controller = client.messages
e911_controller = client.e911
cnam_controller = client.cnam
porting_controller = client.porting

puts("======================== Phone Numbers ----------------------")
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
starts_with = nil
ends_with = nil
contains = nil
limit = 10
offset = 0
result = numbers_controller.list_account_phone_numbers(starts_with, ends_with, contains, limit, offset)
#pp(result)

puts("--List Phone Number Details")
number_id = result['data'][0]['id']
result = numbers_controller.list_phone_number_details(number_id)
#pp(result)

# puts("--Set SMS Callback for a Specific DID")
# result = numbers_controller.set_didsms_callback(number_id, 'http://www.example.com/callbacks/dlr')
# pp(result)

puts("--Set Number Alias")
result = numbers_controller.set_did_alias(number_id, "Flowroute")
pp(result)

puts("---------------------- Routes -------------------------")
puts("---Create an Inbound Route")
# Function to generate six-charac random string
genstring = [('a'..'z'), ('A'..'Z')].map(&:to_a).flatten
new_route = (0...6).map {genstring[rand(genstring.length)]}.join + '.sonsofodin.com'
range = ((48..57).to_a + (65..90).to_a).map {|i| i.chr}
route_alias = Array.new(6) {range.sample}.join

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
route_list = routes_controller.list_inbound_routes(limit)
pp(result)

puts("---List available Edge Strategies")
result = routes_controller.list_edge_strategies()
pp(result)

puts("---Update Primary Voice Route")
prirouteid = route_list['data'][1]['id']
secrouteid = route_list['data'][2]['id']

request_body = '{ 
  "data": { 
    "type": "route", 
    "id": "' + prirouteid.to_s + '"
  } 
}'

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
    "id": "' + secrouteid.to_s + '"
  } 
}'

puts("---Update Failover Voice Route")
secroute_result = routes_controller.update_failover_voice_route(number_id, request_body)
if secroute_result.nil?
  puts "204: No Content"
else
  puts secroute_result
end

puts("------------------------ Messaging ------------------")
#Compact JSON format for outbound MMS
request_body = '{ 
      "to": "' + mobile_number.to_s + '", 
      "from": "' + number_id.to_s + '",
      "body": "hello there", 
      "is_mms": "true", 
      "media_urls": ["https://s3-us-west-2.amazonaws.com/mms-testing/01f2c5551bc24c91b22a084081211eb0.png"] 
}'

puts("---Send An MMS")
result = messages_controller.send_a_message(request_body)
pp(result)
#Compact JSON format for outbound SMS with a callback URL
request_body = '{ 
      "to": "' + mobile_number.to_s + '", 
      "from": "' + number_id.to_s + '",
      "body": "test SMS", 
      "dlr_callback": "https://ycx56aoy9j.execute-api.us-west-2.amazonaws.com/dev/message_to_slack"
}'
puts request_body

puts("---Send An SMS with Callback")
result = messages_controller.send_a_message(request_body)
pp(result)

puts("---Set the Account level SMS Callback URL")
result = messages_controller.set_account_level_callback("sms_callback", "http://www.example.com/sms")
pp(result)

puts("---Set the Account level MMS Callback URL")
result = messages_controller.set_account_level_callback("mms_callback", "http://www.example.com/mms")
pp(result)

puts("---Set the Account level DLR Callback URL")
result = messages_controller.set_account_level_callback("dlr_callback", "http://www.example.com/dlr")
pp(result)

puts("---Look Up A Set Of Messages")
start_date = "2018-01-01"
end_date = "2018-06-08"
limit = 10
result = messages_controller.look_up_a_set_of_messages(start_date, end_date, limit)
pp(result)

puts ("---Look Up A Message Detail Record")
message_id = result['data'][0]['id']
result = messages_controller.look_up_a_message_detail_record(message_id)
pp(result)

puts("---List E911 Records")
result = e911_controller.list_e911s(10, 0)
pp(result)

puts("---Show E911 Detail")
e911_id = result['data'][0]['id']
result = e911_controller.e911_details(e911_id)
pp(result)

puts("---Validate an E911 Address")
e911_record = FlowrouteNumbersAndMessaging::E911.new('N Vassault', '3910', nil, nil, 'Tacoma', 'WA', '98407', 'US', 'Janet', 'Doe', 'Home')
result = e911_controller.validate(e911_record.to_json())
pp(result)

puts("---Create an E911 Address")
e911_record = FlowrouteNumbersAndMessaging::E911.new('N Vassault', '3910', 'SUITE', '200', 'Tacoma', 'WA', '98407', 'US', 'Janet', 'Doe', 'Home')
result = e911_controller.create(e911_record.to_json())

puts("---Update an E911 Record")
e911_id = result['data']['id']
e911_record = FlowrouteNumbersAndMessaging::E911.from_hash(result)
result = e911_controller.update(e911_id, e911_record.to_json())
pp(result)

puts("---Associate an E911 Address with a DID")
result = e911_controller.associate(number_id, e911_id)
pp(result)

puts("---List All DIDs Associated with an E911 Record")
result = e911_controller.list_associations(e911_id)
pp(result)

puts("---Un-associate an E911 Record from a DID")
result = e911_controller.unassociate(number_id)
pp(result)

puts("---Delete an E911 Record")
result = e911_controller.delete_record(e911_id)
pp(result)

puts("---List all CNAM Records")
result = cnam_controller.list_cnams()
cnam_id = result['data'][0]['id']
pp(result)

puts("---List Approved CNAM Records")
result = cnam_controller.list_cnams(10, 0, 'true')
cnam_id = result['data'][0]['id']
pp(result)

puts("---Get Details for a CNAM Record")
cnam_id = result['data'][0]['id']
result = cnam_controller.cnam_details(cnam_id)
pp(result)

puts("---Create a CNAM Record " + route_alias.to_s)
result = cnam_controller.create(route_alias.to_s)
new_cnam_id = result['data']['id']
pp(result)

puts("---Associate a CNAM Record with a DID " + number_id + " with " + cnam_id)
result = cnam_controller.associate(number_id, cnam_id)
pp(result)

puts("---Un-associate a CNAM Record from a DID " + number_id)
result = cnam_controller.unassociate(number_id)
pp(result)

puts("---Delete a CNAM Record " + new_cnam_id)
result = cnam_controller.delete_record(new_cnam_id)
pp(result)

puts("---Check Number Portability")
numbers_to_check = ['+14254664444', '+18827833439', '+12125551212']
result = porting_controller.check_portability(numbers_to_check)
pp(result)
