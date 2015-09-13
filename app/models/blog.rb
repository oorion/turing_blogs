require 'rss'

class Blog < ActiveRecord::Base
  has_many :posts

  before_save :format_rss_url
  before_save :format_url

  after_save :create_posts

  private

  def create_posts
    rss = RSS::Parser.parse(rss_url, false)
    rss.items.each do |post|
      posts.create(title: post.title, url: post.link)
    end
  end

  def format_rss_url
    unless self.rss_url.match(/^http:\/\//)
      self.rss_url = "http://#{rss_url}"
    end
  end

  def format_url
    unless self.rss_url.match(/^http:\/\//)
      self.url = "http://#{rss_url}".match(/.+(?=\/rss)/)
    else
      self.url = self.rss_url.match(/.+(?=\/rss)/)
    end
  end
end
