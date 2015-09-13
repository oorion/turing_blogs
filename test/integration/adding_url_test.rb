require 'test_helper'

class AddingUrlTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def add_blog(author: 'Orion Osborn', url: 'oorion.net/rss')
    within '.add-blog' do
      fill_in 'blog[author]', with: author
      fill_in 'blog[rss_url]', with: url
      click_button 'Add Blog'
    end
  end

  test "user can add a url without http" do
    visit '/blogs'

    add_blog

    blog = Blog.last
    assert_equal root_path, current_path
    assert page.has_content?('Added http://oorion.net/rss')
    assert_equal 'Orion Osborn', blog.author
    assert_equal 'http://oorion.net/rss', blog.rss_url
    assert_equal 'http://oorion.net', blog.url
  end

  test "user can add a url with http" do
    visit '/blogs'

    add_blog(author: 'Orion Osborn', url: 'http://oorion.net/rss')

    blog = Blog.last
    assert_equal root_path, current_path
    assert page.has_content?('Added http://oorion.net/rss')
    assert_equal 'Orion Osborn', blog.author
    assert_equal 'http://oorion.net/rss', blog.rss_url
    assert_equal 'http://oorion.net', blog.url
  end

  test "user can add an rss feed url with a strange syntax" do
    visit '/blogs'

    add_blog(author: 'Dmitry Vizersky', url: 'http://dmitryvizer.com/?feed=rss2')

    blog = Blog.last
    assert_equal root_path, current_path
    assert page.has_content?('Added http://dmitryvizer.com/?feed=rss2')
    assert_equal 'Dmitry Vizersky', blog.author
    assert_equal 'http://dmitryvizer.com/?feed=rss2', blog.rss_url
    assert_equal 'http://dmitryvizer.com', blog.url
  end

  test "user can see post titles and links from the blog they added" do
    visit '/blogs'

    add_blog

    assert page.has_content?('Combining HATEOAS APIs with Ember Data')
  end

  test "blog posts are sorted in chronological order" do
    post1 = 'Asset Pipeline'
    post2 = 'Practical lessons from my first 3 months'
    post3 = 'Your First Sinatra Apps'
    post_order_regexp = Regexp.new("#{post1}.*#{post2}.*#{post3}")
    visit '/blogs'

    add_blog(author: 'Orion Osborn', url: 'oorion.net/rss')
    add_blog(author: 'Dmitry Vizersky', url: 'dmitryvizer.com/?feed=rss2')

    posts = page.find('div.posts')
    assert posts.text.match(post_order_regexp)
  end
end
