require "spec_helper"
require "rails_helper"
require "pp"

describe CustomField do
  before :each do
    @cf = create :custom_field, model_id: 1, model_type: 'Foo'
    @cf.custom_values = [
      create(:custom_value, model_id: 3),
      create(:custom_value, model_id: 2),
      create(:custom_value, model_id: 1)
    ]
  end

  describe "#value" do
    it "returns the current value for the field" do
      v = @cf.value

      expect(v).to include("value" => "Text")
    end

    it "should return nil if there is no associated custom value" do
      @cf.model_id = 4

      expect(@cf.value).to be nil
    end

    it "sets the current value for the field" do
      @cf.value = {value: 'MyText', other: 'OtherText'}

      v = @cf.value['value']
      o = @cf.value['other']

      expect(v).to eq 'MyText'
      expect(o).to eq 'OtherText'
    end

    it "creates a new value if one does not exist for specified model" do
      @cf.model_id = 4

      @cf.value = {value: 'New Text'}

      v = @cf.value['value']

      expect(v).to be
      expect(v).to eq 'New Text'
    end
  end

end
