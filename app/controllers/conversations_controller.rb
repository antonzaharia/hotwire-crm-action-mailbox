class ConversationsController < ApplicationController
  before_action :set_contact

  def index
    @conversations = @contact.conversations
  end

  def show
    @conversation = @contact.conversations.find(params[:id])
    @post = Post.new
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end
end
