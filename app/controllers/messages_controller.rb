class MessagesController < ApplicationController

  def create
    @chat = Chat.find(params[:chat_id])
    @challenge = @chat.challenge
    @message = Message.new(message_params)
    @message.chat = @chat
    @message.role = "user"

    if @message.save
      create_assistant_message
      redirect_to chat_path(@chat)
    else
      render 'chats/show', status: :unprocessable_entity
    end
  end

  private

  def create_assistant_message
    # create the chat
    rubyllm_chat = RubyLLM.chat(model: 'gpt-4.1')
    # give it the previous history
    @chat.messages.each do |message|
      rubyllm_chat.add_message(role: message.role, content: message.content)
    end
    # give the system prompt
    rubyllm_chat.with_instructions(Message.system_prompt + "Here is the challenge: #{@challenge.content}")
    # Send the message to the AI for a response
    response = rubyllm_chat.ask(@message.content)
    # create an instance of a message from the response
    Message.create(
      content: response.content,
      chat: @chat,
      role: 'assistant'
    )
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
