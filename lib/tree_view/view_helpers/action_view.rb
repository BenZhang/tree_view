module TreeView
  
  module ActionView
    
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
        content = <<-EOF
        #{image_position root.entry_type}<a href="#">#{root.entry_type == 'root' ? 'Organisation Chart' : truncate(root.name, :length => 20)}</a>
        EOF
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
      root.children.sort_by{|c| c.position }.each do |child|
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