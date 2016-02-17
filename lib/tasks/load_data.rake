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