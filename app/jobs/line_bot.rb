class LineBot < ApplicationJob
  require 'line/bot'

  LINE_MESSAGE = "今日は何を食べますか。\n↓↓をクリック\nhttps://today-menu.onrender.com/menus/suggest"

  def initialize
    @client = Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  # def push_message(user_id, message)
    # @client.push_message(user_id, {
      # type: 'text',
      # text: LINE_MESSAGE
    # })
  # end

  def broadcast_message
    @client.broadcast({ type: 'text', text: LINE_MESSAGE })
  end
end