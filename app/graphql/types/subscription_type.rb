Types::SubscriptionType = GraphQL::ObjectType.define do
  name "Subscription"

  subscription :messages, !types[Types::MessageType] do
    resolve -> (obj, args, ctx) {
      Message.all
    }
  end
end