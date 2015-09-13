class AddRssUrlToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :rss_url, :string
  end
end
