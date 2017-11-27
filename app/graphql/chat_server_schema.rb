ChatServerSchema = GraphQL::Schema.define do
  subscription(Types::SubscriptionType)
  mutation(Types::MutationType)
  query(Types::QueryType)
end
