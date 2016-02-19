require 'faker'
require 'csv'

module DBMS
  module DefaultData
    class DataAlreadyLoaded < Exception; end

    module Loader
      class << self
        def no_data?
          !WorkStatus.exists? && !EducationStatus.exists? &&
            !UnitOfMeasure.exists? && !ServiceType.exists?
        end

        def load
          raise DataAlreadyLoaded.new('Some configuration data is already loaded.') unless no_data?

          # CL: Children Engaged in Child Labor
          # CAHR: Children at High-Risk of Entering Child Labor
          WorkStatus.create!(name: 'Engaged in Child Labor', work_type: 'CL')
          WorkStatus.create!(name: 'Hazardous Child Labor', work_type: 'CL')
          WorkStatus.create!(name: 'Worst Form of Child Labor (WFCL)', work_type: 'CL')
          WorkStatus.create!(name: 'High Risk of Entering Child Labor', work_type: 'CACHR')

          EducationStatus.create!(name: 'Formal Education')
          EducationStatus.create!(name: 'Non-formal Education')
          EducationStatus.create!(name: 'Vocational Education')

          true
        end

        def create_admin_user
          puts 'creating admin user ...'

          user = User.where(email: 'admin@impaqint.com').first_or_create do |user|
            user.name = 'Admin'
            user.password = 'password'
          end
          user
        end

        def create_dummy_project(user, _project_name)
          puts 'creating project ...'

          project = Project.where(name: 'EXCEL').first_or_create do |project|
            project.title = 'Cambodians EXCEL Project Eliminating eXploitive Child Labot through Education and Livelihoods'
            project.user_id = user.id
            project.cop_num = 'IL-23979-13-75-K'
            project.start_date = Date.new(2012, 12, 28)
            project.end_date = Date.new(2016, 12, 31)
            project.org = 'World Vision'
            project.proj_type = 'CLEP'
            project.funding = 10_000_000
            project.total_target_children = 28_000
          end
          project
        end

        def load_children_from_file(project)
          puts 'loading children ...'

          child_inserts = []
          CSV.foreach("#{::Rails.root}/lib/dbms/default_data/children.csv", headers: true) do |child_row|
            first_name = child_row[4].gsub(/\\/, '\&\&').gsub(/'/, "''")
            middle_name = child_row[5].gsub(/\\/, '\&\&').gsub(/'/, "''")
            last_name = child_row[6].gsub(/\\/, '\&\&').gsub(/'/, "''")
            gender = child_row[1] == 'male' ? 1 : 2
            date_of_birth = child_row[21]
            address = child_row[7].gsub(/\\/, '\&\&').gsub(/'/, "''")
            city = child_row[8].gsub(/\\/, '\&\&').gsub(/'/, "''")
            state = child_row[9].gsub(/\\/, '\&\&').gsub(/'/, "''")
            country = child_row[12].gsub(/\\/, '\&\&').gsub(/'/, "''")
            child_inserts.push "('#{first_name}', '#{middle_name}', '#{last_name}', #{gender}, '#{date_of_birth}', '#{address}', '#{city}', '#{state}', '#{country}', now(), now())"
          end

          sql = "INSERT INTO children (fname, mname, lname, sex, dob, address, city, state, country, created_at, updated_at) VALUES #{child_inserts.join(', ')}"
          conn = ActiveRecord::Base.connection
          conn.execute sql

          sql = "INSERT INTO projects_children (project_id, child_id, created_at, updated_at) (SELECT #{project.id} AS project_id, c.id AS child_id, now() AS create_at, now() AS update_at from children c);"
          conn.execute sql
        end

        def load_households_from_children(_project)
          puts 'loading households ...'

          (1..11_000).each do |_household_number|
            child_id = rand(1..2546)
            child = Child.find(child_id)

            if Household.find_by name: child.lname

              heads_or_tails = rand(1..2)

              if heads_or_tails == 1
                household = Household.create(name: child.lname, address: child.address, city: child.city, state: child.state, country: child.country)
                household.children << child
              else
                household = Household.find_by name: child.lname
                household.children << child
              end
            else
              household = Household.create(name: child.lname, address: child.address, city: child.city, state: child.state, country: child.country)
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

        def load_example_data
          load if no_data?

          User.transaction do
            user = create_admin_user
            project = create_dummy_project(user, 'Child Labor Example Project')
            load_children_from_file(project)
            load_households_from_children(project)
            load_adults_from_households
            load_regions
          end
        end
      end
    end
  end
end
