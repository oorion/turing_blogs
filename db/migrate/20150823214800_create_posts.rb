class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.references :blog, index: true, foreign_key: true
    end
  end
end
