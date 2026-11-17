class Message < ApplicationRecord
  belongs_to :chat

  # Message.system_prompt
  def self.system_prompt
    "You are a Teaching Assistant.\n\nI am a student at the Le Wagon AI Software Development Bootcamp, learning how to code.\n\nHelp me break down my problem into small, actionable steps, without giving away solutions.\n\nAnswer concisely in Markdown."
  end

end
