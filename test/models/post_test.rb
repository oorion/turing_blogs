require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should belong_to :blog

  def new_post(title: 'test title', url: 'http://example.com/post1')
    blog ||= Blog.create(author: 'Orion Osborn', rss_url: 'oorion.net/rss')
    blog.posts.new(title: title, url: url)
  end

  test "validates uniqueness of title and url" do
    post1 = new_post
    post2 = new_post(title: 'different title')
    post3 = new_post(url: 'http://differenturl.com/post1')

    assert post1.save
    refute post2.save
    refute post3.save
  end
end
