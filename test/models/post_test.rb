require 'test_helper'

class PostTest < ActiveSupport::TestCase
  should belong_to :blog
end
