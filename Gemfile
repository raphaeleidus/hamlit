source 'https://rubygems.org'

# Specify your gem's dependencies in hamlit.gemspec
gemspec

# maintain compatibility against master
gem 'haml', github: 'haml/haml'
gem 'faml', github: 'eagletmt/faml', branch: 'optional-extend', submodules: true

gem 'benchmark-ips', '2.3.0'
gem 'lineprof'
gem 'stackprof'
gem 'minitest-line'
gem 'pry-byebug'

if File.exist?('hamlit1')
  gem 'hamlit1', path: 'hamlit1'
end
