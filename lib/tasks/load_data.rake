namespace :DBMS do

  desc "Load same example data"
  task :load_example_data => :environment do
    begin
      # if Rails.env  == 'production'
      #   print "Are you sure to load dummy data into a production system? Type y for yes, n for no."
      #   input = gets.strip
      #   if input != 'y'
      #     puts "Exit the process ..."
      #     return
      #   end
      # end
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
  end

end
