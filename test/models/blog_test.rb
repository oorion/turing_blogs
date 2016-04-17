require_relative '../test_helper'

class BlogTest < ActiveSupport::TestCase
  should have_many :posts

  def new_blog(author: 'Orion Osborn', rss_url: 'http://oorion.net/rss')
    Blog.new(author: author, rss_url: rss_url)
  end

  test "has attributes" do
    blog = new_blog

    blog.save!

    assert_equal 'Orion Osborn', blog.author
    assert_equal 'http://oorion.net/rss', blog.rss_url
    assert_equal 'http://oorion.net', blog.url
  end

  test "formats an rss_url without http" do
    blog = new_blog(rss_url: 'oorion.net/rss')

    blog.save!

    assert_equal 'http://oorion.net/rss', blog.rss_url
  end

  test "formats a url correctly when the rss_url is missing http" do
    blog = new_blog(rss_url: 'oorion.net/rss')

    blog.save!

    assert_equal 'http://oorion.net', blog.url
  end

  test "formats a url correctly when the rss_url is missing http and has a different route" do
    blog = new_blog(rss_url: 'dmitryvizer.com/?feed=rss2')

    blog.save!

    assert_equal 'http://dmitryvizer.com', blog.url
  end

  test "can parse https rss urls" do
    blog = new_blog(rss_url: 'https://medium.com/feed/@adamkijensen')

    blog.save!

    assert_equal 'https://medium.com/feed/@adamkijensen', blog.rss_url
  end

  test "can parse medium rss urls and save author url correctly" do
    blog = new_blog(rss_url: 'https://medium.com/feed/@adamkijensen')

    blog.save!

    assert_equal 'https://medium.com/@adamkijensen', blog.url
  end

  test "creates posts with a published on date" do
    blog = new_blog(rss_url: 'oorion.net/rss')

    blog.save!

    assert_equal 1440972132, blog.posts.first.published_on
  end

  test "should validate uniqueness of author and rss_url" do
    blog1 = new_blog
    blog2 = new_blog(author: 'test')
    blog3 = new_blog(rss_url: 'test.com/rss')

    assert blog1.save
    refute blog2.save
    refute blog3.save
  end
end
