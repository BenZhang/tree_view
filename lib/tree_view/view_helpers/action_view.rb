module TreeView
  
  module ActionView
    # generate html tree view helper
    #
    # @param root      [model instance] the root node of the tree structure
    # @param opt       [Hash]           the options to generate tree nodes
    #       :css       [String]         the wrapper div's css
    #       :drawline  [true, false]    whether draw lines among each nodes
    #       :node_css  [String]         the css for each node
    #       :order_by  [sym]            the order of the children
    # @param &block    [code block]     if you want to customise the content of each tree node, just passing a code block
    def tree_view(root, opt = {}, &block)
      css = opt[:css] || "treeview"    
      drawline = opt.has_key?(:drawline) ? opt[:drawline] : true
      result = builder(root, opt, &block)
      html = <<-EOF
        <ul id="structure-display" class="#{css}">
          #{result[0]}
        </ul>
      EOF
      html << "<script type=\"text/javascript\">#{result[1]}</script>" if drawline
      raw html
    end

    protected
    
    def builder(root, opt = {}, &block)    
      drawline = opt.has_key?(:drawline) ? opt[:drawline] : true
      node_css = opt[:node_css] || ''
      if block_given?
        content = capture(root, &block)
      else
        content = "<a href='#'>#{truncate(root.name, :length => 20)}</a>"
      end
      result, script = "", ""
      html = <<-EOF
        <li>
        <div class="#{node_css}" data-id="#{root.id}" data-type="#{root.entry_type}">
          <span id="pos#{root.id}">
            #{content}          
          </span>
        </div>
      EOF
      if opt.has_key?(:order_by)
        children = root.children.sort_by{|c| c.attributes[opt[:order_by]] }
      else
        children = root.children
      end
      children.each do |child|
        code = builder(child, opt, &block)
        result += code[0]
        if drawline
          script += code[1] if code[1]
          script << "svgDrawLine($('#pos#{root.id}'),$('#pos#{child.id}'));"
        end
      end
      html << "<ul>#{result}</ul>" if result.present?
      html << "</li>"
      [html, script]
    end
    ::ActionView::Base.send :include, self
  end  
end