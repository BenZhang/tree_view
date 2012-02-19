# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tree_view/version"

Gem::Specification.new do |s|
  s.name        = "tree_view"
  s.version     = TreeView::VERSION
  s.authors     = ["BenZhang"]
  s.email       = ["bzbnhang@gmail.com"]
  s.homepage    = "http://benzheng.me"
  s.summary     = "Generate a tree view"
  s.description = "view helper to generate tree view chart"

  s.rubyforge_project = "tree_view"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
