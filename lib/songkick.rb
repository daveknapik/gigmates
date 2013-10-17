module Songkick
	def self.get_location(location_keyword)
		locations = remote.location_search(query: location_keyword).results
		return locations.first if locations.count > 0
	end

	def self.get_metro_area(location_keyword)
		location = get_location(location_keyword)
		return location.metro_area if location
	end

	def self.get_metro_area_events(location_keyword, query = {})
		metro_area = get_metro_area(location_keyword)
		return remote.metro_areas_events(metro_area["id"], query) if metro_area
	end

	def self.get_artist(artist_keyword)
		artists = remote.artist_search(query: artist_keyword).results
		return artists.first if artists.count > 0
	end

	def self.get_artist_events(artist_keyword, query = {})
		artist = get_artist(artist_keyword)
		return remote.artist_events(artist.id, query) if artist
	end

	private

	def self.remote
		@remote ||= Songkickr::Remote.new ENV["SONGKICK_KEY"]
	end
end