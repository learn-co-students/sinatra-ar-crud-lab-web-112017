class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :name
      t.string :content 
    end
  end
end
# First, you'll need to create the posts table. A blog post should have a name and content.
