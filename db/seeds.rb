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
end

parks_hash.each do |p|
  ParkLocation.find_or_create_by(
    zipcode: p['Zipcode'].present? ? to_num(p['Zipcode']) : nil,
    latitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:latitude].to_f : nil,
    longitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:longitude].to_f : nil,
    park_id: Park.find_or_create_by(name: p['ParkName']).id
  )
end

businesses_hash.each do |b|
  Naic.find_or_create_by(
    code: (x = b['NAICS Code']).present? ? x : nil,
    description: (x = b['NAICS Code Description']).present? ? x : nil
  )
  Business.find_or_create_by(
    account_number: (x = b['Business Account Number']).present? ? x : nil,
    ownership_name: (x = b['Ownership Name']).present? ? x : nil
  )
end

businesses_hash.each do |b|
  FullBusinessDatum.find_or_create_by(
    locationid: (x = b['Location Id']).present? ? x : nil,
    business_account_number: (x = b['Business Account Number']).present? ? x : nil,
    
  )
end
