data_hash = []
CSV.foreach('db/data/sf_opendata.csv', headers: true) do |row|
  data_hash << row.to_hash
end

data_hash.each do |d|
  Business.find_or_create_by!(
    account_number: d['Business Account Number'].present? ? d['Business Account Number'].to_i : nil,
    ownership_name: d['Ownership Name'].present? ? d['Ownership Name'] : nil,
    start_date: d['Business Start Date'].present? ? Date.strptime(d['Business Start Date'], "%m/%d/%Y") : nil,
    end_date: d['Business End Date'].present? ? Date.strptime(d['Business End Date'], "%m/%d/%Y") : nil
  )

  NaicsInfo.find_or_create_by(
    naics_code: d['NAICS Code'].present? ? d['NAICS Code'] : nil,
    naics_code_description: d['NAICS Code Description'].present? ? d['NAICS Code Description'] : nil
  )
end
