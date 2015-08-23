class Blog < ActiveRecord::Base
  has_many :posts

  after_save :create_posts

  private

  def create_posts
    rss = RSS::Parser.parse("http://#{url}", false)
    rss.items.each do |post|
      posts.create(title: post.title, url: post.link)
    end
  end
end
