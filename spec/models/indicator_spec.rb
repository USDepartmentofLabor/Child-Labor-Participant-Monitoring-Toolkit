require 'rails_helper'

RSpec.describe Indicator, type: :model do

	it "should be valid" do
		expect(FactoryGirl.build(:indicator, code: "code 1", indicator: "indicator 1", unit_of_measure_id: 1)).to be_valid
	end

	it "is invalid without code" do
		expect(FactoryGirl.build(:indicator, code: nil, indicator: "indicator 1", unit_of_measure_id: 1)).not_to be_valid
	end

	it "is invalid without indicator" do
		expect(FactoryGirl.build(:indicator, code: 'code 1', indicator: nil, unit_of_measure_id: 1)).not_to be_valid
	end

	it "is invalid without project_id" do
		expect(FactoryGirl.build(:indicator, code: "code 1", indicator: "indicator 1", unit_of_measure_id: 1, project_id: nil)).not_to be_valid
	end

	it "is invalid without unit_of_measure_id" do
		expect(FactoryGirl.build(:indicator, code: nil, indicator: "indicator 1", unit_of_measure_id: nil)).not_to be_valid
	end

end
