# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'P9_alu3177_ttt/version'

Gem::Specification.new do |gem|
  gem.name          = "P9_alu3177_ttt"
  gem.version       = P9Alu3177Ttt::VERSION
  gem.authors       = ["Fernando González López-Peñalver"]
  gem.email         = ["alu0100256543@ull.edu.es"]
  gem.description   = %q{Juego del tres en raya.}
  gem.summary       = %q{Permite crear partidas del tres en raya. Dispone de dos opoenentes controlados por computador.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency "rspec"
  gem.add_development_dependency "guard"
  gem.add_development_dependency "guard-rspec"
end
