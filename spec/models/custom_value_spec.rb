require "spec_helper"
require "rails_helper"
require "pp"

describe CustomValue do
  before :each do
    @cv = build :custom_value
  end

  it "should be valid" do
    expect(@cv).to be_valid
  end

  it "is invalid without model_id" do
    @cv.model_id = nil

    expect(@cv).not_to be_valid
  end

  it "is invalid without custom_field_id" do
    @cv.custom_field_id = nil

    expect(@cv).not_to be_valid
  end

  describe "#value_text" do
    it "returns the current value as a JSON string" do
      v = @cv.value_text

      expect(v).to eq '{"value":"Text"}'
    end

    it "has valid JSON as a value" do
      v = JSON.parse @cv.value_text

      expect(v).to include("value" => "Text")
    end
  end
end
