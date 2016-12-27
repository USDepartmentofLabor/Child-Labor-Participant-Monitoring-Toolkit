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

  task load_translations: :environment do

    Translation.create!([
        { locale: 'en', key: 'login.banner', value: 'Direct Beneficiary Monitoring System' },
        { locale: 'en', key: 'general.logo_alt', value: 'Department of Labor Seal' },
        { locale: 'en', key: 'login.instruction', value: 'Login with your email address and password' },
        { locale: 'en', key: 'login.email', value: 'Email Address' },
        { locale: 'en', key: 'login.password', value: 'Password' },
        { locale: 'en', key: 'login.remember_me', value: 'Remember me' },
        { locale: 'en', key: 'general.submit', value: 'Submit' },
        { locale: 'en', key: 'login.forgot_password', value: 'Forgot your password?' },

        { locale: 'es', key: 'login.banner', value: 'Direct Beneficiary Monitoring System' },
        { locale: 'es', key: 'login.tagline', value: 'Cuanto más nos conectamos, mejor se pone.' },
        { locale: 'es', key: 'general.logo_alt', value: 'Sello del Departamento de Trabajo' },
        { locale: 'es', key: 'login.instruction', value: 'Iniciar sesión con su dirección de correo electrónico y contraseña' },
        { locale: 'es', key: 'login.email', value: 'Dirección de correo electrónico' },
        { locale: 'es', key: 'login.password', value: 'Contraseña' },
        { locale: 'es', key: 'login.remember_me', value: 'Recuérdame' },
        { locale: 'es', key: 'general.submit', value: 'Presentar' },
        { locale: 'es', key: 'login.forgot_password', value: '¿Olvidaste tu contraseña?' }
    ])

  end

end
