TreeView
========

TreeView is a little plugin to generate a tree view. TreeView is powered by jQuery and jQuery drawing plugin. It only supports Rails 3.1.

http://benzhang.me/files/medium_tree_view.jpg


Installation
===========

Put this line of code to your gemfile

gem 'tree_view'

include necessary javascript and stylesheet files.

//=require jquery.dimensions.min
//=require jquery.drawinglibrary
//=require jquery.svg.min


Example
=======

If you have a model with tree structure (you might use tree or ancestry gem), you can simple invoke 


<%= tree_view(@root) %>


The attributes name is the name of the attribute that you want to display on the tree node.

If you are using other name instead of parent_id in your database, you can simple set the parent_name to whatever you call it on your database, such as 
build_tree_view(model, attribute name, :parent_name => 'parent')

Copyright (c) 2011 Ben Zhang, released under the MIT license
