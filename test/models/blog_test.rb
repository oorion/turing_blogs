require_relative '../test_helper'

class BlogTest < ActiveSupport::TestCase
  should have_many :posts

  def create_blog(author: 'Orion Osborn', rss_url: 'http://oorion.net/rss')
    Blog.new(author: author, rss_url: rss_url)
  end

  test "has attributes" do
    blog = create_blog

    blog.save!

    assert_equal 'Orion Osborn', blog.author
    assert_equal 'http://oorion.net/rss', blog.rss_url
    assert_equal 'http://oorion.net', blog.url
  end

  test "formats an rss_url without http" do
    blog = create_blog(rss_url: 'oorion.net/rss')

    blog.save!

    assert_equal 'http://oorion.net/rss', blog.rss_url
  end

  test "formats a url correctly when the rss_url is missing http" do
    blog = create_blog(rss_url: 'oorion.net/rss')

    blog.save!

    assert_equal 'http://oorion.net', blog.url
  end

  test "formats a url correctly when the rss_url is missing http and has a different route" do
    blog = create_blog(rss_url: 'dmitryvizer.com/?feed=rss2')

    blog.save!

    assert_equal 'http://dmitryvizer.com', blog.url
  end
end
