module SNMPDevice
	class Configuration
		def self.load(filename)
			begin
				YAML::load(File.open("#{filename}"))
			rescue Errno::ENOENT
				puts "Could not find file #{filename}. Please check that the file exists."
				nil
			rescue Psych::SyntaxError => e
				puts "You had a syntax error in #{filename}: #{e}"
				nil
			end
		end
	end
end
