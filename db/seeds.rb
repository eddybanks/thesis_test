data_hash = []
CSV.foreach('db/data/recreation_and_park_info.csv', headers: true) do |row|
  data_hash << row.to_hash
end

def to_num number
  number.gsub(/,/,'').to_i
end

def to_lat_lng location
  lat = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[1]
  lng = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[2]
  return { latitude: lat, longitude: lng }
end

data_hash.each do |d|
  Park.find_or_create_by(
    name: d['ParkName'].present? ? d['ParkName'] : nil,
    acreage: d['Acreage'].present? ? d['Acreage'].to_f : nil,
    old_id: d['ParkID'].present? ? to_num(d['ParkID']) : nil
  )
  PsaManager.find_or_create_by(
    name: d['PSAManager'].present? ? d['PSAManager'] : nil,
    email: d['email'].present? ? d['email'] : nil,
    number: d['number'].present? ? d['number'] : nil
  )
end

data_hash.each do |d|
  ParkLocation.find_or_create_by(
    zipcode: d['Zipcode'].present? ? to_num(d['Zipcode']) : nil,
    latitude: d['Location 1'].present? ? to_lat_lng(d['Location 1'])[:latitude].to_f : nil,
    longitude: d['Location 1'].present? ? to_lat_lng(d['Location 1'])[:longitude].to_f : nil,
    park_id: Park.find_or_create_by(name: d['ParkName']).id
  )
end

admin = User.create(email: 'admin@admin.com', password: '123456789', username: 'admin')
