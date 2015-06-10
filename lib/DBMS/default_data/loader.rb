module DBMS
	module DefaultData
		class DataAlreadyLoaded < Exception; end

		module Loader
			class << self
				def no_data?
          !WorkStatus.exists? &&
          	!EducationStatus.exists?
        end

        def load
        	raise DataAlreadyLoaded.new("Some configuration data is already loaded.") unless no_data?

        	WorkStatus.create!(name: "Engaged in Child Labor")
        	WorkStatus.create!(name: "High-Risk of Entering Child Labor")
        	WorkStatus.create!(name: "Trafficked")
        	WorkStatus.create!(name: "High-Risk of being Trafficked")
        	WorkStatus.create!(name: "Commercial Sexual Exploitation")
        	WorkStatus.create!(name: "High-Risk of Entering Commercial Sexual Exploitation")

        	EducationStatus.create!(name: "Formal Education")
        	EducationStatus.create!(name: "Non-formal Education")
        	EducationStatus.create!(name: "Vocational Education")

        	true
        end
			end	
		end
	end
end