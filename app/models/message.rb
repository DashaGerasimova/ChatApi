class Message < ApplicationRecord
  belongs_to :user, required: false

  after_commit :broadcast_messages

  def broadcast_messages
    GraphqlChannel.broadcast_to(:messages, messages: Message.all.as_json)
  end
end
