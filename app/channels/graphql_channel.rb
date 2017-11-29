class GraphqlChannel < ApplicationCable::Channel
  include GraphQL::Streaming::ActionCableChannel

  def fetch(data)
    query_string = data["query"]
    variables = JSON.parse(data["variables"] || "{}")
    context = {
      # ...
    }

    # Get the query ID, which is added by the GraphQLChannel client
    query_id = data["query_id"]

    # Make the query within a `stream_graphql_query` block
    stream_graphql_query(query_id: query_id) do |stream_ctx|
      # the block provides a subscriber and collector,
      # merge them into your context:
      merged_ctx = context.merge(stream_ctx)
      # don't forget to prevent stale data
      merged_ctx[:current_user].reload
      MySchema.execute(query_string, variables: variables, context: merged_ctx)
    end
  end	
  def subscribed
    stream_for "messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
