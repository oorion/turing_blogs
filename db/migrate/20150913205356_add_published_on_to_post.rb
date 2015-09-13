class AddPublishedOnToPost < ActiveRecord::Migration
  def change
    add_column :posts, :published_on, :integer
  end
end
