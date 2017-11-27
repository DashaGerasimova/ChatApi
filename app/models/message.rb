class Message < ApplicationRecord
  belongs_to :user

  def after_commit
    GraphQL::Streaming::ActionCableSubscriber.trigger(:messages)
  end
end
