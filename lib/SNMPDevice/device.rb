require 'snmp'
require 'SNMPDevice/configuration'

module SNMPDevice
	class Device
		attr_accessor :config

		def initialize(ip_address, hash_or_filename = nil)
			set_snmp_object(ip_address)
			unless hash_or_filename.nil?
				set_config(hash_or_filename)
			end
		end
		def set_config(hash_or_filename)
			@config = hash_or_filename.end_with?('.yml') ? SNMPDevice::Configuration.load(hash_or_filename) : hash_or_filename
		end

		private
		attr_accessor :snmp_object
		def method_missing(symbol, *args)
			if symbol.id2name.end_with?('_info') and @config.has_key?(symbol.id2name.split('_info')[0])
				snmp_lookup(symbol.id2name.split('_info')[0])
			else
				super
			end
		end
		def set_snmp_object(ip_address)
			@snmp_object = SNMP::Manager.new(:host => ip_address)
		end
		def snmp_lookup(name)
			require_config
			lookup_table = Array.new
			output = [[]]
			@config[name].each do |n| 
				lookup_table.push(SNMP::ObjectId.new(n[1])) 
				output[0].push(n[0])
			end
			@snmp_object.walk(lookup_table) do |row|
				tmp_arr = Array.new
				row.each do |r|
					tmp_arr.push(r.value.to_s)
				end
				output.push(tmp_arr)
			end
			return output
		end
		def require_config
			raise 'Config is not currently set' if @config.nil?
		end
	end
end
