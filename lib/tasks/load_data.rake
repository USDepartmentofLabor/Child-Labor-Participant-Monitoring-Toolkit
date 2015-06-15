namespace :DBMS do
	desc "Load default data required by the system"
	task :load_default_data => :environment do
		begin
      DBMS::DefaultData::Loader.load
      puts "Default configuration data loaded."
    rescue DBMS::DefaultData::DataAlreadyLoaded => error
      puts error.message
    rescue => error
      puts "Error: " + error.message
      puts "Default configuration data was not loaded."
    end
	end

  desc "Load same dummy data"
  task :load_dummy_data => :environment do
    begin
      if Rails.env  == 'production'
        print "Are you sure to load dummy data into a production system? Type y for yes, n for no."
        input = gets.strip
        if input != 'y'
          puts "Exit the process ..."
          return
        end
      end
      puts "Loading dummy data into the system ..."
      DBMS::DefaultData::Loader.load_dummy_data
    rescue => error
      puts "Error: " + error.message
    end
  end
end