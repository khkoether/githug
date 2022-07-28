# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "githug/version"

Gem::Specification.new do |s|
  s.name        = "githug-de"
  s.version     = Githug::VERSION
  s.licenses    = ['MIT']

  s.authors     = ["Karl-Heinz Köther"]
  s.email       = ["khkoether@gmx.de"]
  s.homepage    = "https://github.com/koether/githug"
  s.summary     = %q{Eine Tour in Git}
  s.description = %q{Eine interaktive Möglichkeit Git zu lernen.}

  # s.rubyforge_project = "githug-de"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~>3.11.0"

  s.add_dependency "grit", "~>2.4.1"
  s.add_dependency "thor", "~>1.2.1"
  s.add_dependency "rake", "~>12.3.3"
end
