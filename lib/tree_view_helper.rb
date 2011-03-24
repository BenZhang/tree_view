module TreeViewHelper
  def wrap(content, js, width, height)
    <<-EOF
    <script type="text/css">
      .treeview, .treeview ul {
          margin: 0;
          padding: 0;
          list-style: none;
          text-align: center;
      }

      .treeview li{
          margin: 30px 0 0;
          padding: 0;
          float: left;
          text-align: left;
      }

      .treeview li span {
          background-repeat: no-repeat;
          background-image: url(/images/ChartShape.png);
          margin: auto;
          display: block;
          width: 180px;
          height: 58px;
          padding: 8px 10px 10px;
      }

      .treeview li span img {
          position:relative;
          float:left;
          top:-1px;
          left:-2px;
      }
    </script>
    <div id="svgbasics" style="position:absolute;left:0px;top:80px;width:#{width}px;height:#{height}px;border:solid 0px #484;"></div>
    <div>
    <div id="tree-view-content" style="width:#{width}px;">
    <ul class="treeview">
    #{content}
    </ul>
    </div>
    <script type="text/javascript">
    #{js}
    </script>
    </div>
    EOF
  end

  def print_tree(object, name)
    root = object
    children = object.class.find(:all, :conditions => "parent_id = #{object.id}", :order => "#{name}")
    result = <<-EOF
    <li>
    <span id='pos#{root.id}'>
      <table>
        <tr>
          <td valign='top'>#{root.attributes[name.to_s]}</td>
        </tr>
      </table>
    </span>
    EOF
    script = ''
    sub_tree = ''
    children.each do |child|
      script += "svgDrawLine($('#pos#{root.id}'),$('#pos#{child.id}'));"
      stuff = print_tree(child, name)
      sub_tree += stuff[0]
      script += stuff[1]
    end
    result += children.blank? ? sub_tree : "<ul>#{sub_tree}</ul>"
    result += "</li>"
    return [result, script]
  end

  def form_tree_view(object, name, options = {})
    result, w_num, h_num = print_tree(object, name), get_max_nodes_count(object), get_max_depth(object, 0)
    width, height = w_num*30 + w_num*200, h_num*61 + h_num*50 + 50
    wrap(result[0], result[1], width, height)
  end
  
  def get_max_nodes_count(root)
    children = Composition.find(:all, :conditions => "parent_id = #{root.id}")
    if children.length == 0
      amount = 1
    else
      amount = 0
      children.each do |child|
        tmp = get_max_nodes_count(child)
        amount += ( tmp > 1 ? tmp : 1 )
      end
    end
    amount
  end

  def get_max_depth(root, cur_level)
    amount = cur_level + 1
    res = Composition.find(:all, :conditions => "parent_id = #{root.id}").collect{|c| get_max_depth(c, amount) }.max
    return res.blank? ? 1 : res + 1
  end

end