#!/usr/bin/env ruby
require 'flowroute_numbers_and_messaging'
require 'pp'
print("Number/Route Management v2 & Messaging v2.1 Demo")

# Set up your api credentials and test mobile number for outbound SMS or MMS
basic_auth_user_name = ENV['FR_ACCESS_KEY'] # The username to use with basic authentication
basic_auth_password = ENV['FR_SECRET_KEY'] # The password to use with basic authentication
mobile_number = "YOUR_MOBILE_NUMBER"


# Instantiate API client and create controllers for Numbers, Messages, and Routes
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
pp(result)

print("--List Available Exchange Codes")
limit = 3
offset = nil
max_setup_cost = nil
areacode = 347
result = numbers_controller.list_available_exchange_codes(limit, offset, max_setup_cost, areacode)
pp(result)

print("--Search for Purchasable Phone Numbers")
starts_with = 646
contains = 3
ends_with = 7
limit = 3
offset = nil
rate_center = nil
state = nil
result = numbers_controller.search_for_purchasable_phone_numbers(starts_with, contains, ends_with, limit, offset, rate_center, state)
pp(result)

print("--Purchase a Phone Number")
purchasable_number = result['data'][0]['id']
#result = numbers_controller.purchase_a_phone_number(purchasable_number)
#pp(result)

print("--List Account Phone Numbers")
starts_with = 201
ends_with = nil
contains = nil
limit = 3
offset = nil
result = numbers_controller.list_account_phone_numbers(starts_with, ends_with, contains, limit, offset)
pp(result)


print("--List Phone Number Details")
number_id = result['data'][0]['id']
result = numbers_controller.list_phone_number_details(number_id)
pp(result)

