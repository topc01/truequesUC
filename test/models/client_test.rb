require "test_helper"

class ClientTest < ActiveSupport::TestCase
    test "save" do
        client = clients(:cristiano)
      result = client.save
      assert result, "Client not saved"
    end

    test "should save with empty name" do
        client = clients(:cristiano)
      client.name = ""
      result = client.save
      assert result, "Client with empty name not saved"
    end

    test "should not save with empty username" do
        client = clients(:cristiano)
      client.username = ""
      result = client.save
      assert_not result, "Client with empty username saved"
    end

    test "should not save with empty email" do
        client = clients(:cristiano)
      client.email = ""
      result = client.save
      assert_not result, "Client with empty email saved"
    end

end
