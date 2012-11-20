module Songkick
	def self.get_location_for(query)
		locations = remote.location_search(query: query).results
		return locations.first if locations.count > 0
	end

	def self.get_metro_area_for(query)
		location = get_location_for(query)
		return location.metro_area if location
	end

	private

	def self.remote
		@remote ||= Songkickr::Remote.new ENV["SONGKICK_KEY"]
	end
end