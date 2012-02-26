TreeView
========

TreeView is a little plugin to generate a tree view. TreeView is powered by jQuery and jQuery drawing plugin. It only supports Rails 3.1.

http://benzhang.me/files/medium_tree_view.jpg


Installation
===========

Add this line to your gemfile

```ruby
gem 'tree_view'
```

then run the install command to copy the assets to vendor.

```ruby
rails g tree_view:install
```

include necessary javascript and stylesheet files.

Add these files to your application.js
```ruby
//= require jquery.dimensions.min.js
//= require jquery.drawinglibrary.js
//= require jquery.svg.min.js
//= require tree_view.drawline.js
```

Add the stylesheet to your application.css
```ruby
//= require tree_view
```
Example
=======

If you have a model with tree structure (you might use tree or ancestry gem), you can simple invoke tree_view helper, and pass the root node of the tree.

In controller

```ruby
@root = Policy.root
```

In View

```ruby
<%= tree_view(@root) %>
```

To customise the content or each node you can simple pass a block. For instance, I want to display a little icon for each node like the example above.

```ruby
<%= tree_view(@root) do |node| %>
	<%= image_tag "#{node.entry_type}.png" %>&nbsp;
	<%= link_to node.name, "#" %>
<% end %>
```

API Doc
=======

```ruby
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
```

Copyright (c) 2011 Ben Zhang, released under the MIT license
