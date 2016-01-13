# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'browser/version'

Gem::Specification.new do |s|
  s.name        = 'browser2'
  s.version     = Browser::Version::STRING
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Dirk Gadsden',      'Nando Vieira']
  s.email       = ['dirk@esherido.com', 'fnando.vieira@gmail.com']
  s.homepage    = 'http://github.com/dirk/browser2'
  s.summary     = 'Optimized browser user agent detection library.'
  s.description = s.summary
  s.license     = 'MIT'

  s.files         = `git ls-files`.split "\n"
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split "\n"
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  # s.post_install_message = [
  #   "",
  #   "#################### WARNING ##############################"     ,
  #   "#                                                         #"     ,
  #   "#   Internet Explorer detection has changed on v1.0.0+.   #"     ,
  #   "#   If this is important for you, please read             #"     ,
  #   "#   https://github.com/fnando/browser#internet-explorer   #"     ,
  #   "#                                                         #"     ,
  #   "###########################################################"     ,
  #   "\n"
  # ].join("\n")

  s.add_dependency 'multi_json', '~> 1.11'

  s.add_development_dependency "bundler", ">= 0"
  s.add_development_dependency "rake"
  s.add_development_dependency "rails"
  s.add_development_dependency "rack-test"
  s.add_development_dependency "minitest"
  s.add_development_dependency "minitest-utils"
  s.add_development_dependency "pry-meta"
  s.add_development_dependency "ruby-prof"
end
