require 'rss'

class Blog < ActiveRecord::Base
  has_many :posts

  validates :author, uniqueness: true
  validates :rss_url, uniqueness: true

  before_save :format_rss_url
  before_save :format_url

  after_save :create_posts

  def create_posts
    rss = RSS::Parser.parse(rss_url, false)
    rss.items.each do |post|
      posts.create(
        title: post.title,
        url: post.link,
        published_on: post.pubDate
      )
    end
  end

  private

  def format_rss_url
    url_formatter = UrlFormatter.new(rss_url)
    self.rss_url = url_formatter.format_rss_url
  end

  def format_url
    url_formatter = UrlFormatter.new(rss_url)
    self.url = url_formatter.format_url
  end
end
