Gem::Specification.new do |s|
  s.name              = "oulipo"
  s.version           = "0.0.0"
  s.date              = Time.now.strftime('%Y-%m-%d')
  s.summary           = "Fun with words."
  s.homepage          = "http://github.com/Aupajo/oulipo"
  s.email             = "pete@metanation.com"
  s.authors           = [ "Pete Nicholls" ]
  s.has_rdoc          = false

  s.files             = %w( README.md Rakefile LICENSE )
  s.files            += Dir.glob("lib/**/*")
  s.files            += Dir.glob("spec/**/*")

  # s.add_dependency    "gemname", "< 3.0.0"

  s.description = <<-eod
    Analyse and play with words.
  eod
end