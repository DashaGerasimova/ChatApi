Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :create_message, function: Resolvers::CreateMessage.new
end
