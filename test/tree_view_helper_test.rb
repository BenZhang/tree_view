require File.dirname(__FILE__) + '/test_helper'
include TreeViewHelper
 
class TreeViewHelperTest < Test::Unit::TestCase
  def test_tree_view
    assert_not_nil form_tree_view(TreeNode.find(1), 'name')
  end
end