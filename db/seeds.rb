## helper methods for seed file
def to_arr str
  str.split(/,|\*|\|/).each(&:strip!)
end

def to_num number
  number.gsub(/,/,'').to_i
end

def to_lat_lng location
  lat = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[1]
  lng = location.match(/\((-{0,1}\d+\.\d+),\s*(-{0,1}\d+\.\d+)\)/)[2]
  return { latitude: lat, longitude: lng }
end

## Data extraction from CSV files
parks_hash = []
CSV.foreach('db/data/recreation_and_park_info.csv', headers: true) do |row|
  parks_hash << row.to_hash
end

films_hash = []
CSV.foreach('db/data/film_locations.csv', headers: true) do |row|
  films_hash << row.to_hash
end

# businesses_hash = []
# CSV.foreach('db/data/businesses.csv', headers: true) do |row|
#   businesses_hash << row.to_hash
# end

users = [
  { email: 'admin@admin.com', password: '123456', username: 'admin' },
  { email: 'smith@syo.com', password: '123456', username: 'smith' },
  { email: 'dane@smith.com', password: '123456', username: 'dane' },
  { email: 'idi@unm.edu', password: '123456', username: 'idi' },
  { email: 'test@test.com', password: '123456', username: 'test' }
]
users.each{ |u| User.create(u) }

parks_hash.each do |p|
  FullParkDatum.find_or_create_by(
    park_name: (x = p['ParkName']).present? ? x : nil,
    park_type: (x = p['ParkType']).present? ? x : nil,
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

## Uniq hashes within parks_hash
p_hashes = [:park_service_area, :sup_dist, :park_type, :zipcode]
p_hashes.each{ |h| FullParkDatum.pluck(h).uniq }


###### parks and recreations data

parks_hash.each do |p|
  psa_m = ParkPsaManager.find_or_create_by(
    name: p['PSAManager'].present? ? p['PSAManager'] : nil,
    email: p['email'].present? ? p['email'] : nil,
    number: p['number'].present? ? p['number'] : nil
  )
  zip = ParkZipcode.find_or_create_by(
    code: p['Zipcode'].present? ? to_num(p['Zipcode']) : nil
  )
  park_loc = ParkLocation.find_or_create_by(
    address: (x = p['Location 1']).present? ? x : nil,
    latitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:latitude].to_f : nil,
    longitude: p['Location 1'].present? ? to_lat_lng(p['Location 1'])[:longitude].to_f : nil,
    park_zipcode_id: (x = zip.id).present? ? x : nil
  )
  park_area = ParkAreaDist.find_or_create_by(
    park_service_area: (x = p['ParkServiceArea']).present? ? x : nil,
    sup_dist: (x = p['SupDist']).present? ? x : nil
  )
  park = Park.find_or_create_by(
    name: p['ParkName'].present? ? p['ParkName'] : nil,
    acreage: p['Acreage'].present? ? p['Acreage'].to_f : nil,
    old_id: p['ParkID'].present? ? to_num(p['ParkID']) : nil,
    park_psa_manager_id: (x = psa_m.id).present? ? x : nil,
    park_location_id: (x = park_loc.id).present? ? x : nil,
    park_area_dist_id: (x = park_area.id).present? ? x : nil
  )
end

###### film locations data

@full_film_location_data = []

films_hash.each do |f|
  film_loc = FullFilmLocationDatum.find_or_create_by(
    title: (x = f['Title']).present? ? x : nil,
    release_year: (x = f['Release Year']).present? ? x : nil,
    locations: (x = f['Locations']).present? ? x : nil,
    fun_facts: (x = f['Fun Facts']).present? ? x : nil,
    production_company: (x = f['Production Company']).present? ? x : nil,
    distributor: (x = f['Distributor']).present? ? x : nil,
    director: (x = f['Director']).present? ? x : nil,
    writer: (x = f['Writer']).present? ? x : nil,
    actor1: (x = f['Actor 1']).present? ? x : nil,
    actor2: (x = f['Actor 2']).present? ? x : nil,
    actor3: (x = f['Actor 3']).present? ? x : nil
  )
  @full_film_location_data << film_loc
end

@full_film_location_data.each do |f|
  film = Film.find_or_create_by(title: f.title)
  film_location = FilmLocation.find_or_create_by(
    location: f.locations
  )
  FilmAndFilmLocation.find_or_create_by(
    film_id: (x = film.id).present? ? x : nil,
    film_location_id: (x = film_location.id).present? ? x : nil
  )
  film_fun_fact = FilmFunFact.find_or_create_by(fun_fact: f.fun_facts)
  FilmAndFilmFunFact.find_or_create_by(
    film_id: (x = film.id).present? ? x : nil,
    film_fun_fact_id: (x = film_fun_fact.id).present? ? x : nil
  )
  film.distributors.find_or_create_by(
    name: (x = f.distributor).present? ? x : nil
  )
end
###### big data with sanfrancisco business data


# businesses_hash.each do |b|
#   Naic.find_or_create_by(
#     code: (x = b['NAICS Code']).present? ? x : nil,
#     description: (x = b['NAICS Code Description']).present? ? x : nil
#   )
#   Business.find_or_create_by(
#     account_number: (x = b['Business Account Number']).present? ? x : nil,
#     ownership_name: (x = b['Ownership Name']).present? ? x : nil
#   )
#   Lic.find_or_create_by(
#     code: (x = b['LIC Code']).present? ? x : nil,
#     description: (x = b['LIC Code Description']).present? ? x : nil
#   )
#   FullBusinessDatum.find_or_create_by(
#     locationid: (x = b['Location Id']).present? ? x : nil,
#     business_account_number: (x = b['Business Account Number']).present? ? x : nil,
#     ownership_name: (x = b['Ownership Name']).present? ? x : nil,
#     dba_name: (x = b['DBA Name']).present? ? x : nil,
#     street_address: (x = b['Street Address']).present? ? x : nil,
#     city: (x = b['City']).present? ? x : nil,
#     state: (x = b['State']).present? ? x : nil,
#     source_zipcode: (x = b['Source Zipcode']).present? ? x : nil,
#     business_start_date: (x = b['Business Start Date']).present? ? x : nil,
#     business_end_date: (x = b['Business End Date']).present? ? x : nil,
#     location_start_date: (x = b['Location Start Date']).present? ? x : nil,
#     location_end_date: (x = b['Location End Date']).present? ? x : nil,
#     mail_address: (x = b['Mail Address']).present? ? x : nil,
#     mail_city: (x = b['Mail City']).present? ? x : nil,
#     mail_zipcode: (x = b['Mail Zipcode']).present? ? x : nil,
#     mail_state: (x = b['Mail State']).present? ? x : nil,
#     naics_code: (x = b['NAICS Code']).present? ? x : nil,
#     naics_code_description: (x = b['NAICS Code Description']).present? ? x : nil,
#     parking_tax: (x = b['Parking Tax']).present? ? x : nil,
#     transient_occupancy_tax: (x = b['Transient Occupancy Tax']).present? ? x : nil,
#     lic_code: (x = b['LIC Code']).present? ? x : nil,
#     lic_code_description: (x = b['LIC Code Description']).present? ? x : nil,
#     supervisor_district: (x = b['Supervisor District']).present? ? x : nil,
#     neighborhoods: (x = b['Neighborhoods-Analysis Boundaries']).present? ? x : nil,
#     business_corridor: (x = b['Business Corridor']).present? ? x : nil,
#     business_location: (x = b['Business Location']).present? ? x : nil
#   )
# end
