require 'rails/generators'

module TreeView
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../../../../assets", __FILE__)
      desc "This generator installs Tree View template files to Asset Pipeline"

      def add_assets
        copy_file "javascripts/tree_view.drawline.js", "vendor/assets/javascripts/tree_view.drawline.js"
        copy_file "javascripts/jquery.dimensions.min.js", "vendor/assets/javascripts/jquery.dimensions.min.js"
        copy_file "javascripts/jquery.drawinglibrary.js", "vendor/assets/javascripts/jquery.drawinglibrary.js"
        copy_file "javascripts/jquery.svg.min.js", "vendor/assets/javascripts/jquery.svg.min.js"
        copy_file "stylesheets/tree_view.sass", "vendor/assets/stylesheets/tree_view.sass"
      end

    end
  end
end