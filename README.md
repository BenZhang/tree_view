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

```ruby
//= require jquery.dimensions.min.js
//= require jquery.drawinglibrary.js
//= require jquery.svg.min.js
//= require tree_view.drawline.js
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

API Doc
=======

Coming soon...

Copyright (c) 2011 Ben Zhang, released under the MIT license
