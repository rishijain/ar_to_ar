# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ar_to_ar/version'

Gem::Specification.new do |spec|
  spec.name          = "ar_to_ar"
  spec.version       = ArToAr::VERSION
  spec.authors       = ["Rishi Jain"]
  spec.email         = ["rishi@joshsoftware.com"]

  spec.summary       = %q{Change ActiveRecord to ApplicationRecord}
  spec.description   = %q{When migrating to Rails 5, all models needs to be changed and application_record.rb needs to be added}
  spec.homepage      = "https://github.com/rishijain/ar_to_ar"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", '~> 5.8'

  spec.license = 'MIT'
end
