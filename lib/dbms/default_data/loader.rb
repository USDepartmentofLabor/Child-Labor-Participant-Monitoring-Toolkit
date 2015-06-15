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

        def create_report(user)
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
            user_id: user.id
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
            user_id: user.id
          )
        end

        def load_dummy_data
          load if no_data?
          user = User.create!(email: "admin@impaqint.com", password: "password")

          index = 1
          year = Date.today.year - 13

          # leave the day to be random
          start_date = "#{Date.today.year}-10"
          end_date = "#{Date.today.year+1}-3"

          # create users with different work status
          WorkStatus.all.each do |status|
            child_num = rand(10) + 2
            month = rand(13) + 1
            day = rand(20) + 1
            child_num.times do
              rand_birth = Date.new(year, month, day)
              child = Child.create!(fname: "Child_#{index}", lname: "Labor", sex: index%2+1, dob: rand_birth, country: 'US')
              child_status = ChildStatus.create!(
                start_date: start_date + "-#{rand(27)+1}",
                end_date: end_date + "-#{rand(27)+1}",
                work_status_id: status.id, 
                education_status_id: EducationStatus.pluck(:id).sample,
                child_id: child.id,
                user_id: user.id
              )
              index += 1
            end
          end

          create_report(user)
        end
      end 
    end
  end
end