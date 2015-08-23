require 'test_helper'

class BlogTest < ActiveSupport::TestCase
  should have_many :posts
end
