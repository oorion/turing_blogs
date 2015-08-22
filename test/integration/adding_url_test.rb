require 'test_helper'

class AddingUrlTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  test "user can add a url" do
    visit '/blogs'

    within '.add-blog' do
      fill_in 'blog[author]', with: 'Orion Osborn'
      fill_in 'blog[url]', with: 'oorion.net/rss'
      click_button 'Add Blog'
    end

    assert_equal root_path, current_path
    assert page.has_content?('oorion.net/rss')
  end
end
