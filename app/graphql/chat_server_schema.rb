ChatServerSchema = GraphQL::Schema.define do
  use GraphQL::Guard.new(
    policy_object: GraphqlPolicy,
    not_authorized: ->(type, field) { GraphQL::ExecutionError.new("Not authorized to access #{type}.#{field}") }
  )

  subscription(Types::SubscriptionType)
  mutation(Types::MutationType)
  query(Types::QueryType)
end
