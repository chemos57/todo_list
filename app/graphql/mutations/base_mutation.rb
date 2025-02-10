module Mutations
  class BaseMutation < GraphQL::Schema::Mutation
    include Dry::Monads[:result]
  end
end
