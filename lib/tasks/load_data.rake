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
    WorkActivity.create!([
      { code: '01', canonical_name: 'WA1', display_name: '1. Run or do any kind of business, big or small, for himself/herself or with one or more partners? Examples: Selling things, making things for sale, repairing things, guarding cars, hairdressing, crèche business, taxi or other transport business, having a legal or medical services, performing in public, having a public phone shop, barber, shoe shining etc.' },
      { code: '02', canonical_name: 'WA2', display_name: '2. Do any work for a wage, salary, commission or any payment in kind? Examples: a regular job, contract, casual or piece work for pay, work in exchange for food or housing.' },
      { code: '03', canonical_name: 'WA3', display_name: '3. Do any work as a domestic worker for a wage, salary or any payment in kind?' },
      { code: '04', canonical_name: 'WA4', display_name: "4. Help unpaid in a household business of any kind? (Don't count normal housework.) Examples: Helping to sell things, making things for sale or exchange, doing the accounts, cleaning up for the business, etc." },
      { code: '05', canonical_name: 'WA5', display_name: "5. Do any work on his/her own or household's plot, farm, food garden, or help in growing farm produce or in looking after animals for the household? Examples: ploughing, harvesting, looking after livestock." },
      { code: '06', canonical_name: 'WA6', display_name: '6. Do any construction or major repair work on his/her own home, plot, or business or those of the household?' },
      { code: '07', canonical_name: 'WA7', display_name: '7. Catch any fish, prawns, shells, wild animals, or other food for sale or household food?' },
      { code: '08', canonical_name: 'WA8', display_name: '8. Fetch water or collect firewood for household use?' },
      { code: '09', canonical_name: 'WA9', display_name: '9. Produce any other good for this household use? Examples: clothing, furniture, clay pots, etc' },
      { code: '10', canonical_name: 'WA10', display_name: '10. Did not engage in any of the above activities.' }
    ])
  end

  desc 'Loads Occupations'
  task load_occupations: :environment do
    Occupation.create!([
      { code: '01', canonical_name: 'O1', display_name: 'bricklayer/mason' },
      { code: '02', canonical_name: 'O2', display_name: 'helper/assistant' },
      { code: '03', canonical_name: 'O3', display_name: 'shoe cobbler' },
      { code: '04', canonical_name: 'O4', display_name: 'auto mechanic' },
      { code: '05', canonical_name: 'O5', display_name: 'painter' },
      { code: '06', canonical_name: 'O6', display_name: 'street/candy vendor' },
      { code: '07', canonical_name: 'O7', display_name: 'farmer' },
      { code: '08', canonical_name: 'O8', display_name: 'harvesting sugar cane' },
      { code: '09', canonical_name: 'O9', display_name: 'nanny' }
    ])
  end

  desc 'Loads Industries'
  task load_industries: :environment do
    Industry.create!([
      { code: '01', canonical_name: 'I1', display_name: 'construction/homebuilding' },
      { code: '02', canonical_name: 'I2', display_name: 'shoe store' },
      { code: '03', canonical_name: 'I3', display_name: 'auto shop' },
      { code: '04', canonical_name: 'I4', display_name: 'construction company' },
      { code: '05', canonical_name: 'I5', display_name: 'street/candy vending' },
      { code: '06', canonical_name: 'I6', display_name: 'corn crop' },
      { code: '07', canonical_name: 'I7', display_name: 'sugar cane production' },
      { code: '08', canonical_name: 'I8', display_name: 'other persons home' }
    ])
  end

end
