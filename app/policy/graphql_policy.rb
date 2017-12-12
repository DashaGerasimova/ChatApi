class GraphqlPolicy
  RULES = {
    Types::MessageType => {
      '*': ->(obj, args, ctx) { ctx[:current_user] }
    }
  }

  def self.guard(type, field)
    RULES.dig(type, field)
  end

  def self.not_authorized_handler(type, field)
    RULES.dig(type, field, :not_authorized) || RULES.dig(type, :'*', :not_authorized)
  end
end