require 'spec_helper'

describe Songkick do
	describe "#get_location_for" do
		context "valid location" do
			subject { Songkick.get_location("Brooklyn, NY") }

			it "should return a Songkickr::Location" do
				VCR.use_cassette("songkick_location_valid") { subject.should be_a Songkickr::Location }
			end
		end

		context "invalid location" do
			subject { Songkick.get_location("Agrestic, California") }

			it "should return nil" do
				VCR.use_cassette("songkick_location_invalid") { subject.should be_nil }
			end
		end
	end

	describe "#get_metro_area_for" do
		context "valid location" do
			subject { Songkick.get_metro_area("Brooklyn, NY") }

			it "should return a hash" do
				VCR.use_cassette("songkick_location_valid") { subject.should be_a Hash }
			end
		end

		context "invalid location" do
			subject { Songkick.get_metro_area("Agrestic, California") }

			it "should return nil" do
				VCR.use_cassette("songkick_location_invalid") { subject.should be_nil }
			end
		end
	end
end