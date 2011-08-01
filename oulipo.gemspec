# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name              = "oulipo"
  s.version           = "0.3.1"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.homepage          = "http://github.com/Aupajo/oulipo"
  s.email             = "pete@metanation.com"
  s.authors           = [ "Pete Nicholls" ]
  s.has_rdoc          = false
  
  s.summary           = "Constrained writing with Ruby."
  s.description       = 'Oulipo gives you tools to write constrained stories and poems with Ruby.'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  # s.add_dependency    "gemname", "< 3.0.0"
  
end