module TreeView
  
  class Railtie < Rails::Railtie
    initializer "tree_view" do
      ActiveSupport.on_load :action_view do
        require 'tree_view/view_helpers/action_view'
      end
    end
  end
  
end