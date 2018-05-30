namespace :demo do

  desc 'Populates the database with demo data using Faker'
  task :load_demo_data, [:household_count, :person_count] => [:environment] do |t, args|
    # VARS
    number_households_to_create = args[:household_count].to_i
    today = Date.today
    max_income_sources = 2
    max_people = args[:person_count].to_i
    max_follow_ups = 5
    max_service_assignments = 5

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

      head_of_household_first_name = Faker::Name.first_name
      head_of_household_last_name = Faker::Name.last_name
      head_of_household_middle_name = Faker::Name.first_name

      new_household = Household.create(
        name: head_of_household_last_name,
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

      # Add an adult head of household with the name used for the household
      head_of_household = new_household.people.create(
        intake_date: today,
        first_name: head_of_household_first_name,
        last_name: head_of_household_last_name,
        middle_name: head_of_household_middle_name,
        sex: Random.new.rand(1..2),
        dob: rand(Date.new(1950, 1, 1)..Date.new(today.year - 20, 1, 1)),
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

      # Create a random number of children per household
      Random.new.rand(1..max_people).times do
        new_person = new_household.people.create(
          intake_date: today,
          first_name: Faker::Name.first_name,
          last_name: head_of_household_last_name,
          middle_name: Faker::Name.first_name,
          sex: Random.new.rand(1..2),
          dob: rand(Date.new(today.year - 18, 1, 1)..Date.new(today.year - 6, 1, 1)),
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

  desc 'Populates the database with custom fields for demos'
  task demo_add_custom_fields: :environment do

    # Add Household custom fields
    CustomField.create(
      name: 'Council',
      field_type: 'text',
      model_type: 'Household',
      help_text: '',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 1)
    CustomField.create(
      name: 'Type of Household',
      field_type: 'radio_button',
      selections: "Child headed\r\nFemale headed\r\nMale headed\r\nSingle parent Male\r\nSingle parent Female\r\nElderly Female\r\nElderly Male\r\nFemale headed with a disability\r\nMale headed with a disability",
      model_type: 'Household',
      help_text: 'What type of household is this?',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 2)
    CustomField.create(
      name: 'Additional Household Notes',
      field_type: 'textarea',
      model_type: 'Household',
      help_text: 'Add any additional notes on the household',
      custom_section_id: CustomSection.where(model_type: 'Household').order(:sort_order).first.id,
      sort_order: 3)

    # Add Household Member custom fields
    CustomField.create(
      name: 'Marital Status',
      field_type: 'select',
      selections: "Married\r\nNever Married\r\nDivorced\r\nLiving Together\r\nWidowed",
      model_type: 'Person',
      help_text: 'Select one marital status',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 1)
    CustomField.create(
      name: 'Children Not in School',
      field_type: 'check_box',
      selections: "School fees\r\nLong distance to school\r\nUniform\r\nNo food\r\nHigh exams fees\r\nLack of basic school needs\r\nChildren have to work\r\nToo many children\r\nNo interest in school\r\nToo old to be in school\r\nOther",
      model_type: 'Person',
      help_text: 'For children 5 to 17, give reason(s) if child is not in school (check all that apply)',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 2)
    CustomField.create(
      name: 'Number of jobs',
      field_type: 'number',
      model_type: 'Person',
      help_text: 'How many jobs has the member had?',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 3)
    CustomField.create(
      name: 'Last Date Worked',
      field_type: 'date',
      model_type: 'Person',
      help_text: 'What was the last date the member worked?',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 4)
    CustomField.create(
      name: 'Rank Types of Help',
      field_type: 'rank_list',
      selections: "School\r\nLoans\r\nAgricultural",
      model_type: 'Person',
      help_text: 'Have the member rank the types of assistance needed in order of most important (top_) to least (bottom)',
      custom_section_id: CustomSection.where(model_type: 'Person').order(:sort_order).first.id,
      sort_order: 5)

    # Add Household Member Follow Up custom fields
    CustomField.create(
      name: 'Children Not in School',
      field_type: 'check_box',
      selections: "School fees\r\nLong distance to school\r\nUniform\r\nNo food\r\nHigh exams fees\r\nLack of basic school needs\r\nChildren have to work\r\nToo many children\r\nNo interest in school\r\nToo old to be in school\r\nOther",
      model_type: 'FollowUp',
      help_text: 'For children 5 to 17, give reason(s) if child is not in school (check all that apply)',
      custom_section_id: CustomSection.where(model_type: 'FollowUp').order(:sort_order).first.id,
      sort_order: 1)

  end

end
