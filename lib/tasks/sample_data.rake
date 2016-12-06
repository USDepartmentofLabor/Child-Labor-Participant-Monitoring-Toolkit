# lib/tasks/sample_data.rake
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
      role_ids: [Role.find_by(name: 'Administrator').id]
    )
  end

  desc 'Populates the database with sample project data'
  task populate_sample_project_data: :environment do

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

  task load_tprs: :environment do
    TechnicalProgressReport.create!(
      reporting_period_id:  1,
      reporting_status_id:  1,
      tpr_included:         true,
      annex_a_included:     false,
      annex_b_included:     true,
      annex_c_included:     false,
      annex_d_included:     true,
      annex_e_included:     false,
      annex_f_included:     false,
      annex_g_included:     false,
      annex_h_included:     false,
      annex_i_included:     false
    )
  end

end
