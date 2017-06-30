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
  end

  desc 'Loads Work Activities'
  task load_work_activities: :environment do
    work_activities = [
      { code: '01', canonical_name: '', display_name: 'Run or do any kind of business, big or small, for himself/herself or with one or more partners?' },
      { code: '02', canonical_name: '', display_name: 'Do any work for a wage, salary, commission or any payment in kind?' },
      { code: '03', canonical_name: '', display_name: 'Do any work as a domestic worker for a wage, salary or any payment in kind?' },
      { code: '04', canonical_name: '', display_name: "Help unpaid in a household business of any kind?" },
      { code: '05', canonical_name: '', display_name: "Do any work on his/her own or household's plot, farm, food garden, or help in growing farm produce or in looking after animals for the household?" },
      { code: '06', canonical_name: '', display_name: 'Do any construction or major repair work on his/her own home, plot, or business or those of the household?' },
      { code: '07', canonical_name: '', display_name: 'Catch any fish, prawns, shells, wild animals, or other food for sale or household food?' },
      { code: '08', canonical_name: '', display_name: 'Fetch water or collect firewood for household use?' },
      { code: '09', canonical_name: '', display_name: 'Produce any other good for this household use?' },
      { code: '10', canonical_name: '', display_name: 'Did not engage in any of the above activities.' }
    ]
    work_activities.each { |a| a[:canonical_name] = 'WA_' + a[:display_name].parameterize('_').upcase }
    WorkActivity.create!(work_activities)
  end

  desc 'Loads Occupations'
  task load_occupations: :environment do
    occupations = [
      { code: '01', canonical_name: '', display_name: 'Bricklayer/Mason' },
      { code: '02', canonical_name: '', display_name: 'Helper/Assistant' },
      { code: '03', canonical_name: '', display_name: 'Shoe Cobbler' },
      { code: '04', canonical_name: '', display_name: 'Auto Mechanic' },
      { code: '05', canonical_name: '', display_name: 'Painter' },
      { code: '06', canonical_name: '', display_name: 'Street/Candy Vendor' },
      { code: '07', canonical_name: '', display_name: 'Farmer' },
      { code: '08', canonical_name: '', display_name: 'Harvesting Sugar Cane' },
      { code: '09', canonical_name: '', display_name: 'Nanny' }
    ]
    occupations.each { |o| o[:canonical_name] = 'O_' + o[:display_name].parameterize('_').upcase }
    Occupation.create!(occupations)
  end

  desc 'Loads Industries'
  task load_industries: :environment do
    industries = [
      { code: '01', canonical_name: '', display_name: 'construction/homebuilding' },
      { code: '02', canonical_name: '', display_name: 'shoe store' },
      { code: '03', canonical_name: '', display_name: 'auto shop' },
      { code: '04', canonical_name: '', display_name: 'construction company' },
      { code: '05', canonical_name: '', display_name: 'street/candy vending' },
      { code: '06', canonical_name: '', display_name: 'corn crop' },
      { code: '07', canonical_name: '', display_name: 'sugar cane production' },
      { code: '08', canonical_name: '', display_name: 'other persons home' }
    ]
    industries.each { |i| i[:canonical_name] = 'I_' + i[:display_name].parameterize('_').upcase }
    Industry.create!(industries)
  end

end
