require "test_helper"

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "get client reviews" do
    client = clients(:cristiano)
    assert client.reviews.any?, "Client has no reviews"
  end

  test "should not have reviews" do
    client = clients(:neymar)
    assert_not client.reviews.any?, "Client has reviews"
  end
end
