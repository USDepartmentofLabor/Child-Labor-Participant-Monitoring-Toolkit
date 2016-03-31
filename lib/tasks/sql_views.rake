namespace :db do
  desc "Create and update SQL Views"

  task :update_views => :environment do
    Dir["#{Rails.root}/db/views/*.sql"].each do |file|
      begin
        puts "Applying the SQL view in #{file}"

        view_file = File.new(file, 'r')

        if view_file and (view_sql = view_file.read)
          ActiveRecord::Base.transaction do
            view_lines = view_sql.split(/;[ \t]*$/)
            if view_lines.respond_to? :each
              view_lines.each do |view_line|
                ActiveRecord::Base.connection.execute "#{view_line};"
              end
            end
          end
        end
      rescue => error
        STDERR.puts "Error applying the SQL view in #{file}"
        STDERR.puts error.message
      end
    end
  end
end
