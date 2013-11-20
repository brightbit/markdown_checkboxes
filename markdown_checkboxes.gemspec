require File.dirname(__FILE__) + '/lib/markdown_checkboxes'

Gem::Specification.new do |s|
  s.name        = 'markdown_checkboxes'
  s.version     = CheckboxMarkdown::VERSION
  s.date        = '2013-11-19'
  s.summary     = 'Markdown with checkbox support'
  s.description = 'Adding checkbox rendering functionality on top of the redcarpet markdown parser'
  s.authors     = ['Brightbit Apps']
  s.email       = 'hello@brightbit.com'
  s.files       = ['lib/markdown_checkboxes.rb', 'lib/markdown_checkboxes/data_struct.rb']
  s.homepage    = 'http://rubygems.org/gems/markdown_checkboxes'
  s.license     = 'MIT'

  s.add_runtime_dependency "redcarpet",   '>= 3.0.0'
  s.add_runtime_dependency "actionpack",  '>= 2.0.0'

  s.add_development_dependency "rake-compiler", "~> 0.8.3"
  s.add_development_dependency "test-unit",     "~> 2.5.4"
end
