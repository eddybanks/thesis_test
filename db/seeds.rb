parks_hash = []
CSV.foreach('db/data/recreation_and_park_info.csv', headers: true) do |row|
  parks_hash << row.to_hash
end

businesses_hash = []
CSV.foreach('db/data/businesses.csv', headers: true) do |row|
  businesses_hash << row.to_hash
end

def to_num number
  number.gsub(/,/,'').to_i
end

def to_lat_lng location
  lat = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[1]
  lng = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[2]
  return { latitude: lat, longitude: lng }
end

admin = User.create(email: 'admin@admin.com', password: '123456', username: 'admin')

parks_hash.each do |p|
  Park.find_or_create_by(
    name: p['ParkName'].present? ? p['ParkName'] : nil,
    acreage: p['Acreage'].present? ? p['Acreage'].to_f : nil,
    old_id: p['ParkID'].present? ? to_num(p['ParkID']) : nil
  )
  PsaManager.find_or_create_by(
    name: p['PSAManager'].present? ? p['PSAManager'] : nil,
    email: p['email'].present? ? p['email'] : nil,
    number: p['number'].present? ? p['number'] : nil
  )
  ParkLocation.find_or_create_by(
    zipcode: p['Zipcode'].present? ? to_num(p['Zipcode']) : nil,
    latitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:latitude].to_f : nil,
    longitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:longitude].to_f : nil,
    park_id: Park.find_or_create_by(name: p['ParkName']).id
  )
  FullParkDatum.find_or_create_by(
    park_name: (x = p['ParkName']).present? ? x : nil,
    park_type: (x = p['PartType']).present? ? x : nil,
    park_service_area: (x = p['ParkServiceArea']).present? ? x : nil,
    psa_manager: (x = p['PSAManager']).present? ? x : nil,
    email: (x = p['email']).present? ? x : nil,
    number: (x = p['Number']).present? ? x : nil,
    zipcode: (x = p['Zipcode']).present? ? x : nil,
    acreage: (x = p['Acreage']).present? ? x : nil,
    sup_dist: (x = p['SupDist']).present? ? x : nil,
    parkid: (x = p['ParkID']).present? ? x : nil,
    location: (x = p['Location 1']).present? ? x : nil,
    lat: (x = p['Lat']).present? ? x : nil
  )
end


###### big data with sanfrancisco business data


businesses_hash.each do |b|
  Naic.find_or_create_by(
    code: (x = b['NAICS Code']).present? ? x : nil,
    description: (x = b['NAICS Code Description']).present? ? x : nil
  )
  Business.find_or_create_by(
    account_number: (x = b['Business Account Number']).present? ? x : nil,
    ownership_name: (x = b['Ownership Name']).present? ? x : nil
  )
  Lic.find_or_create_by(
    code: (x = b['LIC Code']).present? ? x : nil,
    description: (x = b['LIC Code Description']).present? ? x : nil
  )
  FullBusinessDatum.find_or_create_by(
    locationid: (x = b['Location Id']).present? ? x : nil,
    business_account_number: (x = b['Business Account Number']).present? ? x : nil,
    ownership_name: (x = b['Ownership Name']).present? ? x : nil,
    dba_name: (x = b['DBA Name']).present? ? x : nil,
    street_address: (x = b['Street Address']).present? ? x : nil,
    city: (x = b['City']).present? ? x : nil,
    state: (x = b['State']).present? ? x : nil,
    source_zipcode: (x = b['Source Zipcode']).present? ? x : nil,
    business_start_date: (x = b['Business Start Date']).present? ? x : nil,
    business_end_date: (x = b['Business End Date']).present? ? x : nil,
    location_start_date: (x = b['Location Start Date']).present? ? x : nil,
    location_end_date: (x = b['Location End Date']).present? ? x : nil,
    mail_address: (x = b['Mail Address']).present? ? x : nil,
    mail_city: (x = b['Mail City']).present? ? x : nil,
    mail_zipcode: (x = b['Mail Zipcode']).present? ? x : nil,
    mail_state: (x = b['Mail State']).present? ? x : nil,
    naics_code: (x = b['NAICS Code']).present? ? x : nil,
    naics_code_description: (x = b['NAICS Code Description']).present? ? x : nil,
    parking_tax: (x = b['Parking Tax']).present? ? x : nil,
    transient_occupancy_tax: (x = b['Transient Occupancy Tax']).present? ? x : nil,
    lic_code: (x = b['LIC Code']).present? ? x : nil,
    lic_code_description: (x = b['LIC Code Description']).present? ? x : nil,
    supervisor_district: (x = b['Supervisor District']).present? ? x : nil,
    neighborhoods: (x = b['Neighborhoods-Analysis Boundaries']).present? ? x : nil,
    business_corridor: (x = b['Business Corridor']).present? ? x : nil,
    business_location: (x = b['Business Location']).present? ? x : nil
  )
end
