require "test_helper"

class ReplyMailboxTest < ActionMailbox::TestCase
  setup do
    @user = users(:support)
    @conversation = conversations(:one)
  end
  test "receive mail" do
    receive_inbound_email_from_mail \
      to: "conversation-#{@conversation.id}@example.com",
      from: @user.email,
      subject: "Hello world!",
      body: "Hello!"

    assert_equal @conversation.posts.last.body, "Hello!"
  end
end
