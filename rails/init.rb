# Include hook code here
require 'tree_view'
require 'fileutils'

FileUtils.cp(File.dirname(__FILE__)+'/../asset/ChartShape.png', File.join(Rails.root, 'public', 'images'))
FileUtils.cp(File.dirname(__FILE__)+'/../asset/jquery-1.4.2.min.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/../asset/jquery.svg.min.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/../asset/jquery.drawinglibrary.js', File.join(Rails.root, 'public', 'javascripts'))
FileUtils.cp(File.dirname(__FILE__)+'/../asset/jquery.dimensions.min.js', File.join(Rails.root, 'public', 'javascripts'))