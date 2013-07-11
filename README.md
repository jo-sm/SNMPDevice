# SNMPDevice

This gem allows for gathering of information via SNMP, using the SNMP Library for Ruby, on any network device that allows SNMP requests. It is manufacturer agnostic, and accepts a configuration file or hash when creating a new `Device` instance. See Usage for more information.

## Installation

Add this line to your application's Gemfile:

    gem 'SNMPDevice'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install SNMPDevice

## Usage

	require 'SNMPDevice/device'
	include SNMPDevice
	 
	printer_a = Device.new('10.247.1.20')
	printer_a.load_config({'toner' => {:name_of_toner => '1.2.3.4.5.6.7.351.2', :toner_level => '1.2.3.4.5.6.7.351.3'}})
	printer_a.toner_info # => [["name_of_toner","toner_level"], ["Yellow", "50"], ["Cyan", "100"], ["Magenta". "10"], ["Black", "0"]]

Depending on the values in the hash or YAML config, you can call something like `paper_info` or `toner_info`. It uses Ruby's `method_missing` function to define names dynamically depending on the configuration values. The results of a function such as `toner_info` can then be used as needed in other ways, such as turning to `JSON` and outputting to Javascript to create a web application capable of monitoring various devices. 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
