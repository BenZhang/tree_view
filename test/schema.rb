ActiveRecord::Schema.define(:version => 0) do
  create_table :tree_nodes, :force => true do |t|
    t.string :name
    t.integer :parent_id
    t.integer :sequence, :default => 0
    t.datetime :created_at
  end
end