Gem::Specification.new do |s|
  s.name              = "oulipo"
  s.version           = "0.1.0"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Constrained writing with Ruby."
  s.homepage          = "http://github.com/Aupajo/oulipo"
  s.email             = "pete@metanation.com"
  s.authors           = [ "Pete Nicholls" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("spec/**/*")

  # s.add_dependency    "gemname", "< 3.0.0"

  s.description = 'Oulipo gives you tools to write constrained stories and poems with Ruby.'
end