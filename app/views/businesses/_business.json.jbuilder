json.extract! business, :id, :account_number, :ownership_name, :start_date, :end_data, :naics_code, :naics_code_description, :created_at, :updated_at
json.url business_url(business, format: :json)