# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'date_range_formatter/version'

Gem::Specification.new do |spec|
  spec.name          = "date_range_formatter"
  spec.version       = DateRangeFormatter::VERSION
  spec.authors       = ["Mikhail Kuzmin", "Mikhail Dronov"]
  spec.email         = ["m.kuzmin@darleaf.ru"]
  spec.description   = "This is a date range formatter with i18 support. This gem can help you make your dates at views nice-looking."
  spec.summary       = "Date range formatter"
  spec.homepage      = "https://github.com/darkleaf/date_range_formatter"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 3.2.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest", "~> 4.7.3"
end
