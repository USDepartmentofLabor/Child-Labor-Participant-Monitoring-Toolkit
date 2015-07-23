require "faker"

module DBMS
  module DefaultData
    class DataAlreadyLoaded < Exception; end

    module Loader
      class << self
        def no_data?
          !WorkStatus.exists? &&
            !EducationStatus.exists?
        end

        def load
          raise DataAlreadyLoaded.new("Some configuration data is already loaded.") unless no_data?

          WorkStatus.create!(name: "Engaged in Child Labor")
          WorkStatus.create!(name: "High-Risk of Entering Child Labor")
          WorkStatus.create!(name: "Trafficked")
          WorkStatus.create!(name: "High-Risk of being Trafficked")
          WorkStatus.create!(name: "Commercial Sexual Exploitation")
          WorkStatus.create!(name: "High-Risk of Entering Commercial Sexual Exploitation")

          EducationStatus.create!(name: "Formal Education")
          EducationStatus.create!(name: "Non-formal Education")
          EducationStatus.create!(name: "Vocational Education")

          true
        end

        def create_report(user, project)
          # create report template for education indicators
          start_date = "#{Date.today.year}-10-1"
          end_date = "#{Date.today.year+1}-3-31"

          e1_desc = <<-eos
            E1: Number of children engaged in or at high-risk of entering child labor provided education or vocational services
          eos
          Report.create!(
            title: "Education Indicator E1", 
            desc: e1_desc,
            start_date: start_date,
            end_date: end_date,
            service_ids: ["1", "2", "3"],
            service_type: "EducationStatus",
            target_ids: ["1", "2", "3", "4", "5", "6"],
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )

          e11_desc = <<-eos
            E1.1: Number of children trafficked or in commercial sexual exploitation, or at high-risk of being
            trafficked or entering commercial sexual exploitation, provided education or vocational services
          eos
          Report.create!(
            title: "Education Indicator E1.1 CSEC & Trafficked Children", 
            desc: e11_desc,
            start_date: start_date,
            end_date: end_date,
            service_ids: ["1", "2", "3"],
            service_type: "EducationStatus",
            target_ids: ["3", "4", "5", "6"],
            target_type: "WorkStatus",
            user_id: user.id,
            project_id: project.id
          )
        end

        def create_admin_user
          user = User.where(email: "admin@impaqint.com").first_or_create do |user|
            user.name = "Admin"
            user.password = "password"
          end
          user
        end

        def create_dummy_project(user, project_name)
          project = Project.where(name: "Child Labor Example Project").first_or_create do |project|
            project.user_id = user.id
          end
          project
        end

        def create_dummy_child(project)
          year = Date.today.year - rand(3...18)
          month = rand(1..12)
          day = rand(1..28)

          rand_birth = Date.new(year, month, day)

          child = Child.create!(
            fname: Faker::Name.first_name,
            lname: Faker::Name.last_name,
            sex: rand(1..2),
            dob: rand_birth, 
            country: 'US'
          )
              
          project.children << child

          child
        end

        def load_dummy_data
          load if no_data?
          user = create_admin_user
          project = create_dummy_project(user, "Child Labor Example Project")

          index = 1
          current_year = Date.today.year

          # leave the day to be random
          start_date = "#{Date.today.year}-10"
          end_date = "#{Date.today.year+1}-3"

          # create children with different work status
          WorkStatus.all.each do |status|

            child_num = rand(10) + 2

            child_num.times do

              child = create_dummy_child(project)

              child_status = ChildStatus.create!(
                start_date: start_date + "-#{rand(1..28)}",
                end_date: end_date + "-#{rand(1..28)}",
                work_status_id: status.id, 
                education_status_id: EducationStatus.pluck(:id).sample,
                child_id: child.id,
                user_id: user.id,
                project_id: project.id
              )
              index += 1
            end
          end

          create_report(user, project)
        end
      end 
    end
  end
end