# frozen_string_literal: true

require 'multi_json'
json_string = '{
  "campaign_customer_key": "0456b316-3eaa-4542-ba4b-c52d5fc98e46",
  "appointment_key": null,
  "campaign_key": "c3d150b4-8680-4fad-962d-603cee1f757e",
  "campaign_run_key": null,
  "customer_vehicle_key": null,
  "customer_key": "7b4d5b20-f613-0134-07fe-72a2b8f8d9ae",
  "organization_key": "dce4b6f0-e4d5-0134-a902-7ea06458c1e8",
  "survey_key": "1d89b7f0-e4d7-0134-eb24-0e72b07369b1",
  "upload_file_key": null,
  "vehicle_key": null,
  "assigned_at": null,
  "assigned_to": null,
  "attempt_count": 0,
  "campaign_email_sent": false,
  "completed_at": 1488831134,
  "contacted": true,
  "contacted_at": 1488831134,
  "created_at": 1493234657,
  "eligible_for_outbound": false,
  "expiration_code": "already_completed",
  "expired_at": 1496852108,
  "expires_at": 1577836800,
  "is_completed": true,
  "last_attempt_time": 1488831134,
  "updated_at": 1496852108
}'
pp MultiJson.load(json_string)
