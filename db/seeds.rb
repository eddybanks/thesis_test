data_hash = []
CSV.foreach('db/data/recreation_and_park_info.csv', headers: true) do |row|
  data_hash << row.to_hash
end

def to_num number
  number.gsub(/,/,'').to_i
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
  ParkLocation.find_or_create_by(
    zipcode: d['Zipcode'].present? ? to_num(d['Zipcode']) : nil
  )
end
