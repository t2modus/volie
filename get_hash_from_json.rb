# frozen_string_literal: true

require 'multi_json'
json_string = '{
  "customer_key": "7b4d5b20-f613-0134-07fe-72a2b8f8d9ae",
  "organization_key": "dce4b6f0-e4d5-0134-a902-7ea06458c1e8",
  "address_1": null,
  "address_2": null,
  "cell_phone": "3192407215",
  "cell_phone_dnc_flag": null,
  "city_region": null,
  "created_at": 1488831112,
  "deleted_at": null,
  "do_not_contact_flag": false,
  "dnc_at": null,
  "email_address_1": "sam9@cfu.net",
  "email_address_2": null,
  "first_name": "Sam",
  "full_name": "Sam Davis",
  "middle_name": "Arthur",
  "home_phone": "6128405950",
  "home_phone_dnc_flag": null,
  "last_name": "Davis",
  "lat_lng": null,
  "latitude": null,
  "longitude": null,
  "postal_code": null,
  "state_province": null,
  "time_zone": null,
  "updated_at": 1504639916,
  "work_phone": "3192402743",
  "work_phone_dnc_flag": null
}'
pp MultiJson.load(json_string)
