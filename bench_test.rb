require 'benchmark'

Benchmark.bm do |query|
  10.times do query.report { Geocoder.search(FullBusinessDatum.first.business_location) } ; end
  10.times do query.report { Geocoder.search(FullBusinessDatum.second.business_location) } ; end
  10.times do query.report { Geocoder.search(FullBusinessDatum.third.business_location) } ; end
end

x = Geocoder.search(FullBusinessDatum.first.business_location)
puts x
