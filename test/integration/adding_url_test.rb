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

    assert_equal root_path, current_path
    assert page.has_content?('Added http://oorion.net/rss')
    assert_equal 'Orion Osborn', Blog.last.author
    assert_equal 'http://oorion.net/rss', Blog.last.rss_url
  end

  test "user can add a url with http" do
    visit '/blogs'

    add_blog(author: 'Orion Osborn', url: 'http://oorion.net/rss')

    assert_equal root_path, current_path
    assert page.has_content?('Added http://oorion.net/rss')
    assert_equal 'Orion Osborn', Blog.last.author
    assert_equal 'http://oorion.net/rss', Blog.last.rss_url
  end

  test "user can see post titles and links from the blog they added" do
    visit '/blogs'

    add_blog

    assert page.has_content?('Combining HATEOAS APIs with Ember Data')
  end
end
