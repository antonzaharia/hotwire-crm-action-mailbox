class PostsController < ApplicationController
  before_action :set_contact
  before_action :set_conversation

  def new
    @post = Post.new
  end

  def create
    @post = @conversation.posts.new(**post_params, message_id: 'test', author: @contact)

    if @post.save
      respond_to do |format|
        format.html { redirect_to conversation_path(@conversation) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  private

  def set_contact
    @contact = Contact.find(params[:contact_id])
  end
  
  def set_conversation
    @conversation = @contact.conversations.find(params[:conversation_id])
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
