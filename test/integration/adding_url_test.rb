require 'test_helper'

class AddingUrlTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def add_blog
    within '.add-blog' do
      fill_in 'blog[author]', with: 'Orion Osborn'
      fill_in 'blog[url]', with: 'oorion.net/rss'
      click_button 'Add Blog'
    end
  end

  test "user can add a url" do
    visit '/blogs'

    add_blog

    assert_equal root_path, current_path
    assert page.has_content?('Added oorion.net/rss')
  end

  test "user can see post titles and links from the blog they added" do
    visit '/blogs'

    add_blog

    assert page.has_content?('Combining HATEOAS APIs with Ember Data')
    assert page.has_content?('http://oorion.net/building-up-to-the-tweet-news')
  end
end
