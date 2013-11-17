require File.dirname(__FILE__) + '/lib/redcarpet_checkboxes'

Gem::Specification.new do |s|
  s.name        = 'redcarpet_checkboxes'
  s.version     = CheckboxMarkdown::VERSION
  s.date        = '2013-11-15'
  s.summary     = 'Redcarpet + Checkboxes'
  s.description = 'Adding checkbox rendering functionality on top of the redcarpet markdown parser'
  s.authors     = ['Brightbit Apps']
  s.email       = 'aaron@brightbit.com'
  s.files       = ['lib/redcarpet_checkboxes.rb']
  s.homepage    = 'http://rubygems.org/gems/redcarpet_checkboxes'
  s.license     = 'MIT'

  s.add_runtime_dependency "redcarpet",   '>= 3.0.0'
  s.add_runtime_dependency "actionpack",  '>= 2.0.0'

  s.add_development_dependency "rake-compiler", "~> 0.8.3"
  s.add_development_dependency "test-unit",     "~> 2.5.4"
end
