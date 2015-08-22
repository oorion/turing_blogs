class CreatePosts < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :author
      t.string :url
    end
  end
end
