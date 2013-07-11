# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'SNMPDevice/version'

Gem::Specification.new do |spec|
  spec.name          = "SNMPDevice"
  spec.version       = SNMPDevice::VERSION
  spec.authors       = ["Joshua Smock"]
  spec.email         = ["contact@joshuasmock.com"]
  spec.description   = %q{This gem allows for gathering of information via SNMP, using the SNMP Library for Ruby, on network devices. It is manufacturer agnostic, and accepts a configuration file or hash when creating a new `Device` instance.}
  spec.summary       = %q{This gem allows for the generation of various network device information through SNMP. It is built to be manufacturer agnostic.}
  spec.homepage      = "https://github.com/joshuasmock/SNMPDevice"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_dependency "snmp"
end
