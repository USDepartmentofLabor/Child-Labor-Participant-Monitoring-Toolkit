require 'faker'
require 'csv'

module DBMS
  module DefaultData
    class DataAlreadyLoaded < Exception; end

    module Loader
      class << self

        def load_children_from_file(project)
          puts 'loading children ...'

          project_id = 1000
          intake_date = '2015-11-01'
          child_inserts = []
          CSV.foreach("#{::Rails.root}/lib/dbms/default_data/children.csv", headers: true) do |child_row|
            first_name = child_row[4].gsub(/\\/, '\&\&').gsub(/'/, "''")
            middle_name = child_row[5].gsub(/\\/, '\&\&').gsub(/'/, "''")
            last_name = child_row[6].gsub(/\\/, '\&\&').gsub(/'/, "''")
            gender = child_row[1] == 'male' ? 1 : 2
            date_of_birth = child_row[21]
            age = rand 5..17
            code = (child_row[1] == 'male' ? 'B' : 'G') + project_id.to_s
            address = child_row[7].gsub(/\\/, '\&\&').gsub(/'/, "''")
            city = child_row[8].gsub(/\\/, '\&\&').gsub(/'/, "''")
            state = child_row[9].gsub(/\\/, '\&\&').gsub(/'/, "''")
            country = child_row[12].gsub(/\\/, '\&\&').gsub(/'/, "''")
            child_inserts.push "('#{first_name}', '#{middle_name}', '#{last_name}', #{gender}, '#{date_of_birth}', '#{age}', now(), now())"
            project_id += 1
          end

          sql = "INSERT INTO people (first_name, middle_name, last_name, sex, dob, age, created_at, updated_at) VALUES #{child_inserts.join(', ')}"
          conn = ActiveRecord::Base.connection
          conn.execute sql

        end

        def load_child_baselines
          puts 'loading child baselines ...'

          status_date = '2016-03-01'
          user = User.first

          Child.all.each do |child|
            work_status = WorkStatus.find(rand(1..4))
            education_status = EducationStatus.find(rand(1..3))
            ChildStatus.create(child: child, work_status: work_status, education_status: education_status, user_id: user.id, start_date: status_date, note: 'Baseline statuses')
          end
        end

        def load_households_from_children(_project)
          puts 'loading households ...'

          intake_date = '2015-11-01'
          (1..30).each do |_household_number|
            child_id = rand(1..100)
            child = Child.find(child_id)

            if Household.find_by name: child.lname

              heads_or_tails = rand(1..2)

              if heads_or_tails == 1
                household = Household.create(name: child.lname, code: 'F' + _household_number.to_s.rjust(5, "0"), intake_date: intake_date, address: child.address, city: child.city, state: child.state, country: child.country)
                household.children << child
              else
                household = Household.find_by name: child.lname
                household.children << child
              end
            else
              household = Household.create(name: child.lname, code: 'F' + _household_number.to_s.rjust(5, "0"), intake_date: intake_date, address: child.address, city: child.city, state: child.state, country: child.country)
              household.children << child
            end
          end
        end

        def load_adults_from_households
          puts 'loading adults ...'

          Household.all.each do |household|
            number_of_adults = rand(1..4)

            number_of_adults.times do |_adult_number|
              gender = rand(1..2)
              Adult.create(fname: Faker::Name.first_name, lname: household.name, sex: gender, household_id: household.id)
            end
          end
        end

        def create_adult(household, family_name)
          adult = Adult.new(
            fname: Faker::Name.first_name,
            lname: family_name,
            sex: rand(1..2)
          )
          adult.household_id = household.id
          adult.save!
          adult
        end

        def create_services
          puts 'creating services ...'
          Service.create(
            name: 'Education support for child laborers',
            service_type_id: 1,
            start_date: '2016-01-01',
            description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et'
          )

          Service.create(
            name: 'Provision of livelihood skills for children',
            service_type_id: 5,
            start_date: '2016-01-01',
            description: 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et'
          )
        end

        def create_child_services
          puts 'creating child services ...'

          Child.all.each do |child|
            Service.all.each do |service|
              #child.services << service
              ServiceInstance.create(
                child_id: child.id,
                service_id: service.id,
                start_date: '2016-03-01'
              )
            end
          end
        end

        def load_example_data

          User.transaction do
            project = Project.first
            load_children_from_file(project)
            load_child_baselines()
            load_households_from_children(project)
            load_adults_from_households
            create_services
            create_child_services
          end
        end
      end
    end
  end
end
