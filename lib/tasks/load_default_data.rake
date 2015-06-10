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
end