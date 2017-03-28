# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name        = 'markdown_checkboxes'
  s.version     = '1.1.0'
  s.date        = '2017-03-28'
  s.summary     = 'Markdown with checkbox support'
  s.description = 'Adding checkbox rendering functionality on top of the redcarpet markdown parser'
  s.authors     = ['Brightbit Apps']
  s.email       = 'hello@brightbit.com'
  s.homepage    = 'http://rubygems.org/gems/markdown_checkboxes'
  s.license     = 'MIT'

  if s.respond_to?(:metadata)
    s.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  s.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
    f.match(/\.gem\z/)
  end

  s.bindir        = 'exe'
  s.executables   = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = %w(lib)

  s.add_runtime_dependency 'redcarpet',   '~> 3.4'
  s.add_runtime_dependency 'actionpack',  '~> 5.0'

  s.add_development_dependency 'rake-compiler', '~> 1.0'
  s.add_development_dependency 'test-unit',     '~> 3.2'
end
