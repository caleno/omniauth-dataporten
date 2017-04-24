# -*- encoding: utf-8 -*-
require File.expand_path(File.join('..', 'lib', 'omniauth-dataporten', 'version'), __FILE__)

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth', '~> 1.0'

  gem.name          = 'omniauth-dataporten-ePPN'
  gem.version       = Omniauth::Dataporten::VERSION
  gem.license       = 'MIT'
  gem.authors       = ['kasperrt', 'Lennart Nordgreen']
  gem.email         = ['kasper@kasperrt.no', 'lennart.nordgreen@uib.no']
  gem.summary       = %q{A Dataporten OAuth2 strategy for OmniAuth 1.x}
  gem.description   = <<-DESCRIPTION 
A Dataporten OAuth2 strategy for OmniAuth 1.x configured to use userid-feide scope (eduPersonPrincipalName) as uid/username.

Scope mappings: 

* Person -> Full Name/(profile picture (not in use))
* Email -> User email
* Userid-feide -> uid/username 
                      DESCRIPTION
  gem.homepage      = 'https://github.com/caleno/omniauth-dataporten'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'omniauth-oauth2', '~> 1.0'

  gem.add_development_dependency 'rspec', '~> 2.6.0'
end
