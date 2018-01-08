#!/usr/bin/env ruby
require 'flowroute_numbers_and_messaging'
require 'pp'
print("Number/Route Management v2 & Messaging v2.1 Demo")

# Set up your api credentials
basic_auth_user_name = ENV['FR_ACCESS_KEY'] # The username to use with basic authentication
basic_auth_password = ENV['FR_SECRET_KEY'] # The password to use with basic authentication

client = FlowrouteNumbersAndMessaging::FlowrouteNumbersAndMessagingClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)
numbers_controller = client.numbers
routes_controller = client.routes
messages_controller = client.messages

print("--List Available Area Codes")
max_setup_cost = 3.25
limit = 3
offset = nil
result = numbers_controller.list_available_area_codes(limit, offset, max_setup_cost)
puts result
exit 0

print("--List Available Exchange Codes")
limit = 3
offset = None
max_setup_cost = None
areacode = 347
result = numbers_controller.list_available_exchange_codes(limit, offset, max_setup_cost, areacode)
pprint.pprint(result)

print("--Search for Purchasable Phone Numbers")
starts_with = 646
contains = 3
ends_with = 7
limit = 3
offset = None
rate_center = None
state = None
result = numbers_controller.search_for_purchasable_phone_numbers(starts_with, contains, ends_with, limit, offset, rate_center, state)
pprint.pprint(result)

print("--Purchase a Phone Number")
number_id = result['data'][0]['id']
result = numbers_controller.purchase_a_phone_number(number_id)


print("--List Phone Number Details")
result = numbers_controller.list_phone_number_details(number_id)
pprint.pprint(result)


print("--List Account Phone Numbers")
starts_with = 201
ends_with = None
contains = None
limit = 3
offset = None
result = numbers_controller.list_account_phone_numbers(starts_with, ends_with, contains, limit, offset)
pprint.pprint(result)


print ("---Create an Inbound Route")
request_body = '{ \
  "data": { \
    "type": "route", \
    "attributes": { \
      "route_type": "host", \
      "value": "' + str(number_id) +'", \
      "alias": "new_route_id" \
    } \
  } \
}'

result = routes_controller.create_an_inbound_route(request_body)
pprint.pprint(result)

print ("---List Inbound Routes")
result = routes_controller.list_inbound_routes()
pprint.pprint(result)

request_body = '{ \
  "data": { \
    "type": "route", \
    "id": "87050" \
  } \
}'

print ("---Update Primary Voice Route")
routeid = result['data'][1]['id']
result = routes_controller.update_primary_voice_route(number_id, request_body)
pprint.pprint(result)

request_body = '{ \
  "data": { \
    "type": "route", \
    "id": "87051" \
  } \
}'

print ("---Update Failover Voice Route")
routeid = result['data'][2]['id']
result = routes_controller.update_failover_voice_route(number_id, request_body)
pprint.pprint(result)

request_body = '{ \
  "data": { \
    "type": "message", \
    "attributes": { \
      "to": "12067392634", \
      "from": "' + str(testnumber) + '", \
      "body": "hello there", \
      "is_mms": "true", \
      "media_urls": ["http://s3.amazonaws.com/barkpost-assets/50+GIFs/37.gif"] \
    } \
  } \
}'

print ("---Send A Message")
result = messages_controller.send_a_message(request_body)
pprint.pprint(result)

print ("---Look Up A Message Detail Record")
message_id = "mdr2-ca82be46e6ba11e79d08862d092cf73d"
result = messages_controller.look_up_a_message_detail_record(message_id)
pprint.pprint(result)

print ("---Look Up A Set Of Messages")
result = messages_controller.look_up_a_set_of_messages('2017-12-31')
pprint.pprint(result)
