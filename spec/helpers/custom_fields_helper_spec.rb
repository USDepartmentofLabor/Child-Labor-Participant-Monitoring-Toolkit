require "rails_helper"
require "spec_helper"
require "pp"

describe CustomFieldsHelper do
  describe "#custom_input" do
    it "creates a textbox" do
      hh = build :household
      cf = create :custom_field, field_type: 'text'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to include('type="text"')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}\"")
      expect(ci).to include('class="form-control"')
    end

    it "creates a number field" do
      hh = build :household
      cf = create :custom_field, field_type: 'number'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to include('type="number"')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}\"")
      expect(ci).to include('class="form-control"')
    end

    it "creates a date" do
      hh = build :household
      cf = create :custom_field, field_type: 'date'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to start_with('<div class="row date-select">')
      expect(ci).to include("select id=\"custom_field_#{cf.id}__1i\"")
      expect(ci).to include("select id=\"custom_field_#{cf.id}__2i\"")
      expect(ci).to include("select id=\"custom_field_#{cf.id}__3i\"")
      expect(ci).to include('class="form-control"')
      expect(ci).to include('<option value=""></option>')
    end

    it "creates a textarea" do
      hh = build :household
      cf = create :custom_field, field_type: 'textarea'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to include('<textarea')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}\"")
      expect(ci).to include('class="form-control"')
      expect(ci).to include('rows="5"')
    end

    it "creates a select field" do
      hh = build :household
      cf = create :custom_field, field_type: 'select', selections: ''
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to include('<select')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}\"")
      expect(ci).to include('class="form-control"')
      expect(ci).to include('<option value=""></option>')
    end

    it "creates a single check box" do
      hh = build :household
      cf = create :custom_field, field_type: 'check_box', selections: 'value'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with(
        '<div class="checkbox"><label class="checkbox-inline">'
      )
      expect(ci).to include('type="checkbox"')
      expect(ci).to include("name=\"custom_field[#{cf.id}][]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__0\"")
      expect(ci).to include('value')
      expect(ci).to include('class="square-red"')
    end

    it "creates a list of check boxes" do
      hh = build :household
      cf = create :custom_field, field_type: 'check_box'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with(
        '<div class="checkbox"><label class="checkbox-inline">'
      )
      expect(ci).to include('type="checkbox"')
      expect(ci).to include("name=\"custom_field[#{cf.id}][]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__0\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__1\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__2\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__3\"")
      expect(ci).to include('value="a"')
      expect(ci).to include('value="b"')
      expect(ci).to include('value="c"')
      expect(ci).to include('value="d"')
      expect(ci).to include('class="square-red"')
    end

    it "creates a single check box with 'other' field" do
      hh = build :household
      cf = create :custom_field, field_type: 'check_box',
        selections: '(specify)'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with(
        '<div class="checkbox"><label class="checkbox-inline">'
      )
      expect(ci).to include('type="checkbox"')
      expect(ci).to include("name=\"custom_field[#{cf.id}][]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__0\"")
      expect(ci).to include('value')
      expect(ci).to include('class="square-red"')
      expect(ci).to include('<input type="text"')
    end

    it "creates a list of radio buttons" do
      hh = build :household
      cf = create :custom_field, field_type: 'radio_button'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with(
        '<div class="radio"><label class="radio-inline">'
      )
      expect(ci).to include('type="radio"')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}_a\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}_b\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}_c\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}_d\"")
      expect(ci).to include('value="a"')
      expect(ci).to include('value="b"')
      expect(ci).to include('value="c"')
      expect(ci).to include('value="d"')
      expect(ci).to include('class="square-red"')
    end

    it "creates a radio button with 'other' field" do
      hh = build :household
      cf = create :custom_field, field_type: 'radio_button',
        selections: '(specify)'
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with(
        '<div class="radio"><label class="radio-inline">'
      )
      expect(ci).to include('type="radio"')
      expect(ci).to include("name=\"custom_field[#{cf.id}]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}\"")
      expect(ci).to include('value')
      expect(ci).to include('class="square-red"')
      expect(ci).to include('<input type="text"')
    end

    it "creates a ranking list" do
      hh = build :household
      cf = create :custom_field, field_type: 'rank_list',
        selections: "a\r\nb (specify)"
      ci = custom_input cf, "custom_field[#{cf.id}]", hh.id

      expect(ci).to be
      expect(ci).to start_with('<div class="grid-rank checkbox">')
      expect(ci).to include('<span class="grid-option">')
      expect(ci).to include('<span class="checkbox-inline grid-value"')
      expect(ci).to include('<label class="checkbox-inline grid-question">')
      expect(ci).to include('class="square-red grid-check"')
      expect(ci).to include("name=\"custom_field[#{cf.id}][]\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__0\"")
      expect(ci).to include("id=\"custom_field_#{cf.id}__1\"")
      expect(ci).to include('<input type="text"')
    end
  end
end
