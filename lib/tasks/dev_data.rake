namespace :dev do

  desc 'Populates the database with custom fields for development'
  task dev_add_custom_fields: :environment do

    # Add Household custom fields
    CustomField.create(
      name: 'Household Short Text',
      field_type: 'text',
      model_type: 'Household',
      help_text: 'This is for short answers',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 1)
    CustomField.create(
      name: 'Household Long Text',
      field_type: 'textarea',
      model_type: 'Household',
      help_text: 'This is for longer answers',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 2)
    CustomField.create(
      name: 'Household Check Box',
      field_type: 'check_box',
      selections: "Household Check Box Option A\r\nHousehold Check Box Option B\r\nHousehold Check Box Option C",
      model_type: 'Household',
      help_text: 'This allows for multiple selection of choices among many',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 3)
    CustomField.create(
      name: 'Household Radio Button',
      field_type: 'radio_button',
      selections: "Household Radio Option A\r\nHousehold Radio Option B\r\nHousehold Radio Option C",
      model_type: 'Household',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 4)
    CustomField.create(
      name: 'Household Selection Field',
      field_type: 'select',
      selections: "Household Selection Option A\r\nHousehold Selection Option B\r\nHousehold Selection Option C",
      model_type: 'Household',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 5)
    CustomField.create(
      name: 'Household Numeric Field',
      field_type: 'number',
      model_type: 'Household',
      help_text: 'This is for numbers',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 6)
    CustomField.create(
      name: 'Household Date Field',
      field_type: 'date',
      model_type: 'Household',
      help_text: 'This is for a date',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 7)
    CustomField.create(
      name: 'Household Rank List',
      field_type: 'rank_list',
      selections: "Household Rank Option A\r\nHousehold Rank Option B\r\nHousehold Rank Option C",
      model_type: 'Household',
      help_text: 'This is for ranking a list of options',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 8)

    # Add Household Member custom fields
    CustomField.create(
      name: 'Person Intake Short Text',
      field_type: 'text',
      model_type: 'Person',
      help_text: 'This is for short answers',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 1)
    CustomField.create(
      name: 'Person Intake Long Text',
      field_type: 'textarea',
      model_type: 'Person',
      help_text: 'This is for longer answers',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 2)
    CustomField.create(
      name: 'Person Intake Check Box',
      field_type: 'check_box',
      selections: "Person Check Box Option A\r\nPerson Check Box Option B\r\nPerson Check Box Option C",
      model_type: 'Person',
      help_text: 'This allows for multiple selection of choices among many',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 3)
    CustomField.create(
      name: 'Person Intake Radio Button',
      field_type: 'radio_button',
      selections: "Person Radio Option A\r\nPerson Radio Option B\r\nPerson Radio Option C",
      model_type: 'Person',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 4)
    CustomField.create(
      name: 'Person Intake Selection Field',
      field_type: 'select',
      selections: "Person Selection Option A\r\nPerson Selection Option B\r\nPerson Selection Option C",
      model_type: 'Person',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 5)
    CustomField.create(
      name: 'Person Intake Numeric Field',
      field_type: 'number',
      model_type: 'Person',
      help_text: 'This is for numbers',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 6)
    CustomField.create(
      name: 'Person Intake Date Field',
      field_type: 'date',
      model_type: 'Person',
      help_text: 'This is for a date',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 7)
    CustomField.create(
      name: 'Person Intake Rank List',
      field_type: 'rank_list',
      selections: "Person Rank Option A\r\nPerson Rank Option B\r\nPerson Rank Option C",
      model_type: 'Person',
      help_text: 'This is for ranking a list of options',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 8)

    # Add Household Member Follow Up custom fields
    CustomField.create(
      name: 'Person Follow Up Short Text',
      field_type: 'text',
      model_type: 'FollowUp',
      help_text: 'This is for short answers',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 1)
    CustomField.create(
      name: 'Person Follow Up Long Text',
      field_type: 'textarea',
      model_type: 'FollowUp',
      help_text: 'This is for longer answers',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 2)
    CustomField.create(
      name: 'Person Follow Up Check Box',
      field_type: 'check_box',
      selections: "Follow Up Check Box Option A\r\nFollow Up Check Box Option B\r\nFollow Up Check Box Option C",
      model_type: 'FollowUp',
      help_text: 'This allows for multiple selection of choices among many',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 3)
    CustomField.create(
      name: 'Person Follow Up Radio Button',
      field_type: 'radio_button',
      selections: "Follow Up Radio Option A\r\nFollow Up Radio Option B\r\nFollow Up Radio Option C",
      model_type: 'FollowUp',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 4)
    CustomField.create(
      name: 'Person Follow Up Selection Field',
      field_type: 'select',
      selections: "Follow Up Selection Option A\r\nFollow Up Selection Option B\r\nFollow Up Selection Option C",
      model_type: 'FollowUp',
      help_text: 'This is for a single selection among many',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 5)
    CustomField.create(
      name: 'Person Follow Up Numeric Field',
      field_type: 'number',
      model_type: 'FollowUp',
      help_text: 'This is for numbers',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 6)
    CustomField.create(
      name: 'Person Follow Up Date Field',
      field_type: 'date',
      model_type: 'FollowUp',
      help_text: 'This is for a date',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 7)
    CustomField.create(
      name: 'Person Follow Up Rank List',
      field_type: 'rank_list',
      selections: "Follow Up Rank Option A\r\nFollow Up Rank Option B\r\nFollow Up Rank Option C",
      model_type: 'FollowUp',
      help_text: 'This is for ranking a list of options',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 8)

  end

end
