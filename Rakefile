require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'

desc 'Default: run unit tests.'
task :default => :test

desc 'Test the tree_view plugin.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

desc 'Generate documentation for the tree_view plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'TreeView'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

PKG_FILES = FileList[
  '[a-zA-Z]*',
  'lib/**/*',
  'rails/**/*',
  'asset/*',
  'test/**/*'
]
 
spec = Gem::Specification.new do |s|
  s.name = "tree_view"
  s.version = "0.1"
  s.author = "Ben Zhang"
  s.email = "bzbnhang@gmail.com"
  s.homepage = "http://benzhang.me/"
  s.platform = Gem::Platform::RUBY
  s.summary = "Tree View"
  s.files = PKG_FILES.to_a
  s.require_path = "lib"
  s.has_rdoc = false
  s.extra_rdoc_files = ["README"]
end
 
desc 'Turn this plugin into a gem.'
Rake::GemPackageTask.new(spec) do |pkg|
  pkg.gem_spec = spec
end