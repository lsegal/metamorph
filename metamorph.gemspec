SPEC = Gem::Specification.new do |s|
  s.name = "metamorph"
  s.version = "0.1"
  s.date = "2010-03-25"
  s.author = "Loren Segal"
  s.email = "lsegal@soen.ca"
  s.homepage = "http://github.com/lsegal/metamorph"
  s.summary = "Transparently defines instance methods inside anonymous module so mixins can override them with proper inheritance."
  s.files = ['LICENSE', 'README.md', 'Rakefile', 'lib/metamorph.rb', 'spec/metamorph_spec.rb', 'ext/extconf.rb', 'ext/metamorph.c']
  s.require_paths = ['lib']
  s.extensions    = ['ext/extconf.rb']
end