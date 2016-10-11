# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'foo/version'

Gem::Specification.new do |spec|
  spec.name          = "foo"
  spec.version       = Foo::VERSION
  spec.authors       = ['foo man']

  spec.summary       = %q{foo}

  spec.files         = ['lib/foo/version.rb', 'lib/foo.rb', 'exe/foo']
  spec.bindir        = "exe"
  spec.executables   = ['foo']
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
