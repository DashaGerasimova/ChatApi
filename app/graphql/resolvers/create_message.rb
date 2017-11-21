class Resolvers::CreateMessage < GraphQL::Function
  # arguments passed as "args"
  argument :text, !types.String

  # return type from the mutation
  type Types::MessageType

  # the mutation method
  # _obj - is parent object, which in this case is nil
  # args - are the arguments passed
  # _ctx - is the GraphQL context (which would be discussed later)
  def call(_obj, args, _ctx)
    Message.create!(
      text: args[:text]
    )
  end
end