# Getting started

The Flowroute APIs are organized around REST. Our APIs have resource-oriented URLs, support HTTP Verbs, and respond with HTTP Status Codes. All API requests and responses, including errors, will be represented as JSON objects. You can use the Flowroute APIs to manage your Flowroute phone numbers including setting primary and failover routes for inbound calls, and sending text messages (SMS and MMS) using long-code or toll-free numbers in your account.

## How to Build

This client library is a Ruby gem which can be compiled and used in your Ruby and Ruby on Rails project. This library requires a few gems from the RubyGems repository.

1. Open the command line interface or the terminal and navigate to the folder containing the source code.
2. Run ``` gem build flowroute_numbers_and_messaging.gemspec ``` to build the gem.
3. Once built, the gem can be installed on the current work environment using ``` gem install flowroute_numbers_and_messaging-3.0.0.gem ```

![Building Gem](https://apidocs.io/illustration/ruby?step=buildSDK&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=Flowroute%20Numbers%20and%20Messaging-Ruby&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

## How to Use

The following section explains how to use the FlowrouteNumbersAndMessaging Ruby Gem in a new Rails project using RubyMine&trade;. The basic workflow presented here is also applicable if you prefer using a different editor or IDE.

### 1. Starting a new project

Close any existing projects in RubyMine&trade; by selecting ``` File -> Close Project ```. Next, click on ``` Create New Project ``` to create a new project from scratch.

![Create a new project in RubyMine](https://apidocs.io/illustration/ruby?step=createNewProject0&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

Next, provide ``` TestApp ``` as the project name, choose ``` Rails Application ``` as the project type, and click ``` OK ```.

![Create a new Rails Application in RubyMine - step 1](https://apidocs.io/illustration/ruby?step=createNewProject1&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

In the next dialog make sure that correct *Ruby SDK* is being used (minimum 2.0.0) and click ``` OK ```.

![Create a new Rails Application in RubyMine - step 2](https://apidocs.io/illustration/ruby?step=createNewProject2&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

This will create a new Rails Application project with an existing set of files and folder.

### 2. Add reference of the gem

In order to use the FlowrouteNumbersAndMessaging gem in the new project we must add a gem reference. Locate the ```Gemfile``` in the *Project Explorer* window under the ``` TestApp ``` project node. The file contains references to all gems being used in the project. Here, add the reference to the library gem by adding the following line: ``` gem 'flowroute_numbers_and_messaging', '~> 3.0.0' ```

![Add references of the Gemfile](https://apidocs.io/illustration/ruby?step=addReference&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

### 3. Adding a new Rails Controller

Once the ``` TestApp ``` project is created, a folder named ``` controllers ``` will be visible in the *Project Explorer* under the following path: ``` TestApp > app > controllers ```. Right click on this folder and select ``` New -> Run Rails Generator... ```.

![Run Rails Generator on Controllers Folder](https://apidocs.io/illustration/ruby?step=addCode0&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

Selecting the said option will popup a small window where the generator names are displayed. Here, select the ``` controller ``` template.

![Create a new Controller](https://apidocs.io/illustration/ruby?step=addCode1&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

Next, a popup window will ask you for a Controller name and included Actions. For controller name provide ``` Hello ``` and include an action named ``` Index ``` and click ``` OK ```.

![Add a new Controller](https://apidocs.io/illustration/ruby?step=addCode2&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

A new controller class anmed ``` HelloController ``` will be created in a file named ``` hello_controller.rb ``` containing a method named ``` Index ```. In this method, add code for initialization and a sample for its usage.

![Initialize the library](https://apidocs.io/illustration/ruby?step=addCode3&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0)

## How to Test

You can test the generated SDK and the server with automatically generated test
cases as follows:

  1. From terminal/cmd navigate to the root directory of the SDK.
  2. Invoke: `bundle exec rake`

## Initialization

### Authentication
In order to setup authentication and initialization of the API client, you need the following information.

| Parameter | Description |
|-----------|-------------|
| basic_auth_user_name | The username to use with basic authentication |
| basic_auth_password | The password to use with basic authentication |



API client can be initialized as following.

```ruby
# Configuration parameters and credentials
basic_auth_user_name = 'basic_auth_user_name' # The username to use with basic authentication
basic_auth_password = 'basic_auth_password' # The password to use with basic authentication

client = FlowrouteNumbersAndMessaging::FlowrouteNumbersAndMessagingClient.new(
  basic_auth_user_name: basic_auth_user_name,
  basic_auth_password: basic_auth_password
)
```

The added initlization code can be debugged by putting a breakpoint in the ``` Index ``` method and running the project in debug mode by selecting ``` Run -> Debug 'Development: TestApp' ```.

![Debug the TestApp](https://apidocs.io/illustration/ruby?step=addCode4&workspaceFolder=Flowroute%20Numbers%20and%20Messaging-Ruby&workspaceName=FlowrouteNumbersAndMessaging&projectName=flowroute_numbers_and_messaging&gemName=flowroute_numbers_and_messaging&gemVer=3.0.0&initLine=client%2520%253D%2520FlowrouteNumbersAndMessagingClient.new%2528%2527basic_auth_user_name%2527%252C%2520%2527basic_auth_password%2527%2529)



# Class Reference

## <a name="list_of_controllers"></a>List of Controllers

* [MessagesController](#messages_controller)
* [NumbersController](#numbers_controller)
* [RoutesController](#routes_controller)

## <a name="messages_controller"></a>![Class: ](https://apidocs.io/img/class.png ".MessagesController") MessagesController

### Get singleton instance

The singleton instance of the ``` MessagesController ``` class can be accessed from the API Client.

```ruby
messages_controller = client.messages
```

### <a name="get_look_up_a_set_of_messages"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.get_look_up_a_set_of_messages") get_look_up_a_set_of_messages

> Retrieves a list of Message Detail Records (MDRs) within a specified date range. Date and time is based on Coordinated Universal Time (UTC).


```ruby
def get_look_up_a_set_of_messages(start_date,
                                      end_date = nil,
                                      limit = nil,
                                      offset = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| start_date |  ``` Required ```  | The beginning date and time, in UTC, on which to perform an MDR search. The DateTime can be formatted as YYYY-MM-DDor YYYY-MM-DDTHH:mm:ss.SSZ. |
| end_date |  ``` Optional ```  | The ending date and time, in UTC, on which to perform an MDR search. The DateTime can be formatted as YYYY-MM-DD or YYYY-MM-DDTHH:mm:ss.SSZ. |
| limit |  ``` Optional ```  | The number of MDRs to retrieve at one time. You can set as high of a number as you want, but the number cannot be negative and must be greater than 0 (zero). |
| offset |  ``` Optional ```  | The number of MDRs to skip when performing a query. The number must be 0 (zero) or greater, but cannot be negative. |


#### Example Usage

```ruby
start_date = DateTime.now
end_date = DateTime.now
limit = 61
offset = 61

result = messages_controller.get_look_up_a_set_of_messages(start_date, end_date, limit, offset)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="create_send_a_message"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.create_send_a_message") create_send_a_message

> Sends an SMS or MMS from a Flowroute long code or toll-free phone number to another valid phone number.


```ruby
def create_send_a_message(body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| body |  ``` Required ```  | The SMS or MMS message to send. |


#### Example Usage

```ruby
body = Message.new

result = messages_controller.create_send_a_message(body)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 403 | Forbidden – You don't have permission to access this resource. |
| 404 | The specified resource was not found |
| 422 | Unprocessable Entity - You tried to enter an incorrect value. |



### <a name="get_look_up_a_message_detail_record"></a>![Method: ](https://apidocs.io/img/method.png ".MessagesController.get_look_up_a_message_detail_record") get_look_up_a_message_detail_record

> Searches for a specific message record ID and returns a Message Detail Record (in MDR2 format).


```ruby
def get_look_up_a_message_detail_record(id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| id |  ``` Required ```  | The unique message detail record identifier (MDR ID) of any message. When entering the MDR ID, the number should include the mdr2- preface. |


#### Example Usage

```ruby
id = 'id'

result = messages_controller.get_look_up_a_message_detail_record(id)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



[Back to List of Controllers](#list_of_controllers)

## <a name="numbers_controller"></a>![Class: ](https://apidocs.io/img/class.png ".NumbersController") NumbersController

### Get singleton instance

The singleton instance of the ``` NumbersController ``` class can be accessed from the API Client.

```ruby
numbers_controller = client.numbers
```

### <a name="get_account_phone_numbers"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.get_account_phone_numbers") get_account_phone_numbers

> Returns a list of all phone numbers currently on your Flowroute account. The response includes details such as the phone number's rate center, state, number type, and whether CNAM Lookup is enabled for that number.


```ruby
def get_account_phone_numbers(starts_with = nil,
                                  ends_with = nil,
                                  contains = nil,
                                  limit = nil,
                                  offset = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| starts_with |  ``` Optional ```  | Retrieves phone numbers that start with the specified value. |
| ends_with |  ``` Optional ```  | Retrieves phone numbers that end with the specified value. |
| contains |  ``` Optional ```  | Retrieves phone numbers containing the specified value. |
| limit |  ``` Optional ```  | Limits the number of items to retrieve. A maximum of 200 items can be retrieved. |
| offset |  ``` Optional ```  | Offsets the list of phone numbers by your specified value. For example, if you have 4 phone numbers and you entered 1 as your offset value, then only 3 of your phone numbers will be displayed in the response. |


#### Example Usage

```ruby
starts_with = 61
ends_with = 61
contains = 61
limit = 61
offset = 61

result = numbers_controller.get_account_phone_numbers(starts_with, ends_with, contains, limit, offset)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="get_phone_number_details"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.get_phone_number_details") get_phone_number_details

> Lists all of the information associated with any of the phone numbers in your account, including billing method, primary voice route, and failover voice route.


```ruby
def get_phone_number_details(id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| id |  ``` Required ```  | Phone number to search for which must be a number that you own. Must be in 11-digit E.164 format; e.g. 12061231234. |


#### Example Usage

```ruby
id = 61

result = numbers_controller.get_phone_number_details(id)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized |
| 404 | Not Found |



### <a name="create_purchase_a_phone_number"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.create_purchase_a_phone_number") create_purchase_a_phone_number

> Lets you purchase a phone number from available Flowroute inventory.


```ruby
def create_purchase_a_phone_number(id); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| id |  ``` Required ```  | Phone number to purchase. Must be in 11-digit E.164 format; e.g. 12061231234. |


#### Example Usage

```ruby
id = 61

result = numbers_controller.create_purchase_a_phone_number(id)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="search_for_purchasable_phone_numbers"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.search_for_purchasable_phone_numbers") search_for_purchasable_phone_numbers

> This endpoint lets you search for phone numbers by state or rate center, or by your specified search value.


```ruby
def search_for_purchasable_phone_numbers(starts_with = nil,
                                             contains = nil,
                                             ends_with = nil,
                                             limit = nil,
                                             offset = nil,
                                             rate_center = nil,
                                             state = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| starts_with |  ``` Optional ```  | Retrieve phone numbers that start with the specified value. |
| contains |  ``` Optional ```  | Retrieve phone numbers containing the specified value. |
| ends_with |  ``` Optional ```  | Retrieve phone numbers that end with the specified value. |
| limit |  ``` Optional ```  | Limits the number of items to retrieve. A maximum of 200 items can be retrieved. |
| offset |  ``` Optional ```  | Offsets the list of phone numbers by your specified value. For example, if you have 4 phone numbers and you entered 1 as your offset value, then only 3 of your phone numbers will be displayed in the response. |
| rate_center |  ``` Optional ```  | Filters by and displays phone numbers in the specified rate center. |
| state |  ``` Optional ```  | Filters by and displays phone numbers in the specified state. Optional unless a ratecenter is specified. |


#### Example Usage

```ruby
starts_with = 61
contains = 61
ends_with = 61
limit = 61
offset = 61
rate_center = 'rate_center'
state = 'state'

result = numbers_controller.search_for_purchasable_phone_numbers(starts_with, contains, ends_with, limit, offset, rate_center, state)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="list_available_area_codes"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.list_available_area_codes") list_available_area_codes

> Returns a list of all Numbering Plan Area (NPA) codes containing purchasable phone numbers.


```ruby
def list_available_area_codes(limit = nil,
                                  offset = nil,
                                  max_setup_cost = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| limit |  ``` Optional ```  | Limits the number of items to retrieve. A maximum of 400 items can be retrieved. |
| offset |  ``` Optional ```  | Offsets the list of phone numbers by your specified value. For example, if you have 4 phone numbers and you entered 1 as your offset value, then only 3 of your phone numbers will be displayed in the response. |
| max_setup_cost |  ``` Optional ```  | Restricts the results to the specified maximum non-recurring setup cost. |


#### Example Usage

```ruby
limit = 153
offset = 153
max_setup_cost = 153.243678050695

numbers_controller.list_available_area_codes(limit, offset, max_setup_cost)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="list_available_exchange_codes"></a>![Method: ](https://apidocs.io/img/method.png ".NumbersController.list_available_exchange_codes") list_available_exchange_codes

> Returns a list of all Central Office (exchange) codes containing purchasable phone numbers.


```ruby
def list_available_exchange_codes(limit = nil,
                                      offset = nil,
                                      max_setup_cost = nil,
                                      areacode = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| limit |  ``` Optional ```  | Limits the number of items to retrieve. A maximum of 200 items can be retrieved. |
| offset |  ``` Optional ```  | Offsets the list of phone numbers by your specified value. For example, if you have 4 phone numbers and you entered 1 as your offset value, then only 3 of your phone numbers will be displayed in the response. |
| max_setup_cost |  ``` Optional ```  | Restricts the results to the specified maximum non-recurring setup cost. |
| areacode |  ``` Optional ```  | Restricts the results to the specified area code. |


#### Example Usage

```ruby
limit = 153
offset = 153
max_setup_cost = 153.243678050695
areacode = 153

numbers_controller.list_available_exchange_codes(limit, offset, max_setup_cost, areacode)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



[Back to List of Controllers](#list_of_controllers)

## <a name="routes_controller"></a>![Class: ](https://apidocs.io/img/class.png ".RoutesController") RoutesController

### Get singleton instance

The singleton instance of the ``` RoutesController ``` class can be accessed from the API Client.

```ruby
routes_controller = client.routes
```

### <a name="update_primary_voice_route_for_a_phone_number"></a>![Method: ](https://apidocs.io/img/method.png ".RoutesController.update_primary_voice_route_for_a_phone_number") update_primary_voice_route_for_a_phone_number

> Use this endpoint to update the primary voice route for a phone number. You must create the route first by following "Create an Inbound Route". You can then assign the created route by specifying its value in a PATCH request.


```ruby
def update_primary_voice_route_for_a_phone_number(number_id,
                                                      body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| number_id |  ``` Required ```  | The phone number in E.164 11-digit North American format to which the primary route for voice will be assigned. |
| body |  ``` Required ```  | The primary route to be assigned. |


#### Example Usage

```ruby
number_id = 153
nil
routes_controller.update_primary_voice_route_for_a_phone_number(number_id, body)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="update_failover_voice_route_for_a_phone_number"></a>![Method: ](https://apidocs.io/img/method.png ".RoutesController.update_failover_voice_route_for_a_phone_number") update_failover_voice_route_for_a_phone_number

> Use this endpoint to update the failover voice route for a phone number. You must create the route first by following "Create an Inbound Route". You can then assign the created route by specifying its value in a PATCH request.


```ruby
def update_failover_voice_route_for_a_phone_number(number_id,
                                                       body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| number_id |  ``` Required ```  | The phone number in E.164 11-digit North American format to which the failover route for voice will be assigned. |
| body |  ``` Required ```  | The failover route to be assigned. |


#### Example Usage

```ruby
number_id = 153
nil
routes_controller.update_failover_voice_route_for_a_phone_number(number_id, body)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



### <a name="list_inbound_routes"></a>![Method: ](https://apidocs.io/img/method.png ".RoutesController.list_inbound_routes") list_inbound_routes

> Returns a list of your inbound routes. From the list, you can then select routes to use as the primary and failover routes for a phone number, which you can do via "Update Primary Voice Route for a Phone Number" and "Update Failover Voice Route for a Phone Number".


```ruby
def list_inbound_routes(limit = nil,
                            offset = nil); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| limit |  ``` Optional ```  | Limits the number of routes to retrieve. A maximum of 200 items can be retrieved. |
| offset |  ``` Optional ```  | Offsets the list of routes by your specified value. For example, if you have 4 inbound routes and you entered 1 as your offset value, then only 3 of your routes will be displayed in the response. |


#### Example Usage

```ruby
limit = 153
offset = 153

routes_controller.list_inbound_routes(limit, offset)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized |
| 404 | Not Found |



### <a name="create_an_inbound_route"></a>![Method: ](https://apidocs.io/img/method.png ".RoutesController.create_an_inbound_route") create_an_inbound_route

> Creates a new inbound route which can then be associated with phone numbers. Please see "List Inbound Routes" to review the route values that you can associate with your Flowroute phone numbers.


```ruby
def create_an_inbound_route(body); end
```

#### Parameters

| Parameter | Tags | Description |
|-----------|------|-------------|
| body |  ``` Required ```  | The new inbound route to be created. |


#### Example Usage

```ruby
body = NewRoute.new

routes_controller.create_an_inbound_route(body)

```

#### Errors

| Error Code | Error Description |
|------------|-------------------|
| 401 | Unauthorized – There was an issue with your API credentials. |
| 404 | The specified resource was not found |



[Back to List of Controllers](#list_of_controllers)



# flowroute-numbers-messaging-ruby
