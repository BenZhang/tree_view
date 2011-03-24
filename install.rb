# Install hook code here

File.copy(File.dirname(__FILE__)+'/rails/ChartShape.png', File.join(Rails.root, 'public', 'images'))
File.copy(File.dirname(__FILE__)+'/rails/jquery-1.4.2.min.js', File.join(Rails.root, 'public', 'javascripts'))
File.copy(File.dirname(__FILE__)+'/rails/jquery.svg.min.js', File.join(Rails.root, 'public', 'javascripts'))
File.copy(File.dirname(__FILE__)+'/rails/jquery.drawinglibrary.js', File.join(Rails.root, 'public', 'javascripts'))
File.copy(File.dirname(__FILE__)+'/rails/jquery.dimensions.min.js', File.join(Rails.root, 'public', 'javascripts'))