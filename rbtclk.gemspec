lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbtclk/version'

Gem::Specification.new do |spec|
  spec.name          = "rbtclk"
  spec.version       = Rbtclk::VERSION
  spec.authors       = ["Moza USANE"]
  spec.email         = ["mozamimy@quellencode.org"]
  spec.summary       = %q{A light-weight timer application that can run in terminal emulators.}
  spec.description   = %q{A light-weight timer application that can run in terminal emulators.}
  spec.homepage      = "http://quellencode.org/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "artii"
  spec.add_dependency "curses"
end
