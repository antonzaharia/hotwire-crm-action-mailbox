class ConversationMailbox < ApplicationMailbox
  def process
    conversation = Conversation.create(subject: mail.subject)
    conversation.posts.create(
      contact: author,
      body: body,
      message_id: mail.message_id,
    )
  end

  def author
    @author ||= if (user = User.find_by(email: from.address))
        user
      else
        contact = Contact.where(email: from.address).first_or_initialize
        contact.update(name: from.display_name)
        contact
      end
  end
end
