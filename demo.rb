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

