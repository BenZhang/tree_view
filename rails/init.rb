# Include hook code here
require 'tree_view'
require 'fileutils'

File.copy(File.dirname(__FILE__)+'/ChartShape.png', File.join(Rails.root, 'public', 'images'))