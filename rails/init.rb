# Include hook code here
require 'tree_view'
require 'fileutils'

FileUtils.cp(File.dirname(__FILE__)+'/ChartShape.png', File.join(Rails.root, 'public', 'images'))
FileUtils.cp(File.dirname(__FILE__)+'/jquery-1.4.2.min.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/jquery.svg.min.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/jquery.drawinglibrary.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/jquery.dimensions.min.js', File.join(Rails.root, 'public', 'javascripts'))