Gem::Specification.new do |s|
  s.name        = 'redcarpet_checkboxes'
  s.version     = '0.0.1'
  s.date        = '2013-11-15'
  s.summary     = 'Redcarpet + Checkboxes'
  s.description = 'Adding checkbox rendering functionality on top of the redcarpet markdown parser'
  s.authors     = ['Brightbit Apps']
  s.email       = 'aaron@brightbit.com'
  s.files       = ['lib/redcarpet_checkboxes.rb']
  s.homepage    = 'http://rubygems.org/gems/redcarpet_checkboxes'
  s.license     = 'MIT'
  s.add_runtime_dependency "redcarpet"
  s.add_runtime_dependency "actionpack"
end
