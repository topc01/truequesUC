require "test_helper"

class MessageTest < ActiveSupport::TestCase
    test "should not save message without chat" do
        message = Message.new(
          client_id: 1,
          content: "Hello"
      )
      result = message.save
      assert_not result
    end

    test "should not save message without client" do
        message = Message.new(
          chat_id: 1,
          content: "Hello"
      )
      result = message.save
      assert_not result
    end

    test "should delete messages on chat delete" do
        chat = chats(:one)
      chat.destroy
      messages = chat.messages
      assert_equal 0, messages.length, "Messages not deleted"
    end
  
end
