require "test_helper"

class RequestTest < ActiveSupport::TestCase

    test "should delete request on produt delete" do
        product = products(:pintura)
      product_request = requests(:one)
      product.destroy
      assert Request.exists?(product_request.id), "Requests not deleted"
    end

end
