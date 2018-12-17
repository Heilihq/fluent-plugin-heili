# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-heili"
  spec.version       = "1.0.0"
  spec.authors       = ["David Golovan"]
  spec.email         = ["davidg@forthscale.com"]
  spec.description   = %q{Recieve and parse Heili metrics}
  spec.summary       = %q{Recieve and parse Heili metrics}
  spec.homepage      = "https://github.com/Heilihq/fluent-plugin-heili"
  spec.license       = "ASL2"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.required_ruby_version = '>= 2.1.0'

  spec.add_runtime_dependency(%q<fluentd>, [">= 0.14.8", "< 2"])

  spec.add_runtime_dependency(%q<bunny>, [">= 1.7", "< 3"])
  # We can use this for simple mocking, but only works on Ruby 2+
  spec.add_development_dependency(%q<bunny-mock>, [">= 1.0"])

  spec.add_development_dependency(%q<shoulda>, [">= 3.5.0"])
  spec.add_development_dependency(%q<rake>)
  spec.add_development_dependency(%q<minitest>, ["< 5.0.0"])
  spec.add_development_dependency(%q<test-unit>, [">= 3.1.0"])
  spec.add_development_dependency(%q<simplecov>, [">= 0.10"])

end
