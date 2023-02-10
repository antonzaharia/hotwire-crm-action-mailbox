require "application_system_test_case"

class ConversationTest < ApplicationSystemTestCase
  setup do
    @contact = contacts(:anton)
    @conversation = conversations(:one)
  end

  test "Replying to a conversation" do
    visit contacts_path

    click_on "Anton"
    click_on "First conversation subject", match: :first

    find(".trix-content").click.set("My test text").click.set("Hello streamed!")
    click_on "Create Post"

    assert_selector 'div', text: 'Hello streamed!'
  end
end
