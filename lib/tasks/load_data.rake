namespace :DBMS do

  desc "Populate database with example data"
  task :load_example_data => :environment do
    begin

      puts "Loading example data into the system ..."
      DBMS::DefaultData::Loader.load_example_data
    rescue => error
      puts "Error: " + error.message
    end
  end
end

namespace :db do

  desc 'Drop, create, migrate, seed and add the admin user'
  task prepare: [:drop, :create, :migrate, :seed, :add_admin_user] do
    puts 'Database is ready to go'
  end

  desc 'Adds admin user to the system'
  task add_admin_user: :environment do
    User.create!(
      email:    'ilabtoolkit@gmail.com',
      name:     'Administrator',
      password: 'password',
      confirmed_at: Date.parse(Time.now.to_s),
      role_ids: [Role.find_by(name: 'Administrator').id]
    )
  end

  # !!! This should be updated for the project being deployed
  desc 'Populates the database with project data'
  task load_project_data: :environment do

    project = Project.create!(
      name: 'ADVANCE Brazil',
      title: 'Brazilian ADVANCE Project Eliminating Exploitive Child Labor through Education and Livelihoods',
      cooperative_agreement_number: 'IL-23979-13-75-K',
      start_date: Date.new(2015, 12, 28),
      end_date: Date.new(2019, 12, 31),
      organization: 'IMPAQ International',
      funding_amount: 10_000_000,
      region_id: 2
    )

    child_target_type = ProjectTargetType.find_by name: 'Child'
    household_target_type = ProjectTargetType.find_by name: 'Household'

    ProjectTarget.create!(project: project, project_target_type: child_target_type, target: 900)
    ProjectTarget.create!(project: project, project_target_type: household_target_type, target: 450)

    ReportingPeriod.create(start_date: Date.new(2015, 10, 1), end_date: Date.new(2016, 3, 31), name: 'PERIOD 1: 1 Oct. 2015 - 31 Mar. 2016')
    ReportingPeriod.create(start_date: Date.new(2016, 4, 1), end_date: Date.new(2016, 9, 30), name: 'PERIOD 2: 1 Apr. 2016 - 30 Sep. 2016')
    ReportingPeriod.create(start_date: Date.new(2016, 10, 1), end_date: Date.new(2017, 3, 31), name: 'PERIOD 3: 1 Oct. 2016 - 31 Mar. 2017')
    ReportingPeriod.create(start_date: Date.new(2017, 4, 1), end_date: Date.new(2017, 9, 30), name: 'PERIOD 4: 1 Apr. 2017 - 30 Sep. 2017')
    ReportingPeriod.create(start_date: Date.new(2017, 10, 1), end_date: Date.new(2018, 3, 31), name: 'PERIOD 5: 1 Oct. 2017 - 31 Mar. 2018')
    ReportingPeriod.create(start_date: Date.new(2018, 4, 1), end_date: Date.new(2018, 9, 30), name: 'PERIOD 6: 1 Apr. 2018 - 30 Sep. 2018')
    ReportingPeriod.create(start_date: Date.new(2018, 10, 1), end_date: Date.new(2019, 3, 31), name: 'PERIOD 7: 1 Oct. 2018 - 31 Mar. 2019')
    ReportingPeriod.create(start_date: Date.new(2018, 4, 1), end_date: Date.new(2019, 9, 30), name: 'PERIOD 8: 1 Apr. 2019 - 30 Sep. 2019')
    ReportingPeriod.create(start_date: Date.new(2019, 10, 1), end_date: Date.new(2020, 3, 31), name: 'PERIOD 9: 1 Oct. 2019 - 31 Mar. 2020')
  end

end
