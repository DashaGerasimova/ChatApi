Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :create_message, function: Resolvers::CreateMessage.new
  field :create_user, function: Resolvers::CreateUser.new
  field :sign_in_user, function: Resolvers::SignInUser.new
end
