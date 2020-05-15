# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nmax/version'

Gem::Specification.new do |spec|
  spec.name          = 'nmax'
  spec.version       = Nmax::VERSION
  spec.authors       = ['Vyacheslav Kuzharov']
  spec.email         = ['vyacheslav.kuzharov@gmail.com']

  spec.summary       = 'A gem for extract n largest integers encountered in the received text data'
  spec.homepage      = 'https://github.com/VyacheslavKuzharov/nmax-test'
  spec.license       = 'MIT'

  spec.files         = Dir.glob('{bin,lib}/**/*')
  spec.executables << 'nmax'
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 0.83.0'
end
