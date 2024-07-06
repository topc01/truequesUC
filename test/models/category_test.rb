require "test_helper"

class CategoryTest < ActiveSupport::TestCase

    test "should not save empty category" do
        category = Category.new
      result = category.save
      assert_not result, "Saved empty category"
    end

    test "should not save category without name" do
        category = Category.new(
          description: "This is a description"
      )
      result = category.save
      assert_not result, "Saved category without name"
    end

    test "should save category" do
        category = Category.new(
          name: "Category",
          description: "This is a description"
      )
      result = category.save
      assert result, "Saved category"
    end
end
