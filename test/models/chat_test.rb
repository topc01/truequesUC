require "test_helper"

class ChatTest < ActiveSupport::TestCase
  
    test "should not save chat without client1_id" do
        chat = Chat.new
      result = chat.save
      assert_not result
    end

    test "should not save chat without client2_id" do
        chat = Chat.new(
          client1_id: 1
      )
      result = chat.save
      assert_not result
    end

    test "should get chat message content" do
        chat = chats(:two)
      messages = chat.messages
      result = messages.last.content
      assert_equal "HelloWorld!", result, "Chat message content not found"
    end

    test "sould get all chat messages" do
        chat = chats(:one)
      messages = chat.messages
      assert_equal 3, messages.length, "Chat messages not found"
    end

    test "should get chat client2" do
        chat = chats(:one)
      client_id = chat.client2_id
      assert_equal clients(:messi).id, client_id, "Chat client2 not found"
    end

end
