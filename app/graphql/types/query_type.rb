Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :allMessages, !types[Types::MessageType] do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) { Message.all }
  end
  field :getMessage, !Types::MessageType do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) { Message.all }
  end
end
