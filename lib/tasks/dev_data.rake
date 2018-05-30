namespace :dev do

  desc 'Populates the database with demo data using Faker for development'
  task dev_load_demo_data: :environment do
    # VARS
    number_households_to_create = 10
    today = Date.today
    max_income_sources = 2
    max_people = 3
    max_follow_ups = 2
    max_service_assignments = 2

    # Add Services
    Service.create(
      name: 'School Books',
      service_type_id:ServiceType.first.id,
      start_date: Date.new(2017, 2, 1),
      end_date: Date.new(2019, 2, 1),
      description: 'Service to provide school books.')
    Service.create(
      name: 'Counseling',
      service_type_id:ServiceType.last.id,
      start_date: Date.new(2017, 6, 1),
      end_date: Date.new(2019, 3, 1),
      description: 'Service to provide counseling.')

    # get look up arrays so we have valid values
    service_ids = Service.ids
    relationship_ids = Relationship.ids
    hazardous_condition_ids = HazardousCondition.ids
    household_task_ids = HouseholdTask.ids
    work_activity_ids = WorkActivity.ids

    # Create Households
    number_households_to_create.times do |n|
      new_household = Household.create(
        name: Faker::Name.name + ' (Household # ' + (n + 1).to_s + ' of ' +
          number_households_to_create.to_s + ')',
        intake_date: Date.new(today.year, today.month, today.day),
        address_line_1: Faker::Address.street_address,
        address_line_2: Faker::Address.secondary_address,
        postal_code: Faker::Address.zip_code,
        dependent_locality: Faker::Address.city + ' Neighborhood',
        locality: Faker::Address.city,
        adminv_area: Faker::Address.state,
        dependent_adminv_area: Faker::Address.city + ' County',
        country: Faker::Address.country,
        address_info: 'Near ' + Faker::Address.city + ' area',
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        position_accuracy: 0,
        altitude: 0,
        altitude_accuracy: 0,
        heading: 0,
        speed: 0,
        gps_recorded_at: today)

      # Create a random number of income sources per household
      Random.new.rand(1..max_income_sources).times do
        new_income_source = new_household.income_sources.create(
          name: Faker::Company.profession,
          unit_of_measure: Faker::Space.galaxy, # TODO: upgrade faker to get measurements
          currency: Faker::Space.moon, # TODO: upgrade faker to get measurements
          estimated_volume_produced: 1,
          estimated_volume_sold: 2,
          estimated_income: 3.0)
      end

      # Create a random number of people per household
      Random.new.rand(1..max_people).times do
        new_person = new_household.people.create(
          intake_date: today,
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          middle_name: Faker::Name.first_name,
          sex: Random.new.rand(1..2),
          dob: rand(Date.new(1950, 1, 1)..Date.new(today.year - 6, 1, 1)),
          is_birthdate_approximate: Faker::Boolean.boolean,
          have_job_returning_to: Faker::Boolean.boolean,
          hours_worked: Random.new.rand(0..40),
          hours_worked_on_housework: Random.new.rand(0..40),
          enrolled_in_school: Faker::Boolean.boolean,
          relationship_id: relationship_ids.sample,
          relationship_other: Faker::Lorem.word,
          work_activity_ids: work_activity_ids.sample(Random.new.rand(1..work_activity_ids.count)),
          hazardous_condition_ids: hazardous_condition_ids.sample(Random.new.rand(1..hazardous_condition_ids.count)),
          household_task_ids: household_task_ids.sample(Random.new.rand(1..household_task_ids.count)))

        # Create a random number of follow ups per person
        Random.new.rand(1..max_follow_ups).times do
          new_person.follow_ups.create(
            follow_date: rand(Date.new(2017, 1, 1)..today),
            have_job_returning_to: Faker::Boolean.boolean,
            hours_worked: Random.new.rand(0..40),
            hours_worked_on_housework: Random.new.rand(0..40),
            enrolled_in_school: Faker::Boolean.boolean,
            work_activity_ids: work_activity_ids.sample(Random.new.rand(1..work_activity_ids.count)),
            hazardous_condition_ids: hazardous_condition_ids.sample(Random.new.rand(1..hazardous_condition_ids.count)),
            household_task_ids: household_task_ids.sample(Random.new.rand(1..household_task_ids.count)))
        end

        # Create service assignments
        Random.new.rand(1..max_service_assignments).times do
          start_date = rand(Date.new(2017, 7, 1)..today)
          ServiceInstance.create(
            person_id: new_person.id,
            service_id: service_ids.sample,
            start_date: start_date,
            end_date: start_date + 1,
            hours: Random.new.rand(0..10),
            notes: Faker::Lorem.paragraph)
        end
      end
    end
  end

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
