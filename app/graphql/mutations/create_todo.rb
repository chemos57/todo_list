module Mutations
  class CreateTodo < BaseMutation
    argument :input, Types::TodoInput, required: true

    field :todo, Types::TodoType, null: true
    field :errors, [String], null: true

    def resolve(input:)
      result = Todos::CreateService.new.call(input.to_h)
      
      case result
      when Success
        {
          todo: result.value!,
          errors: []
        }
      when Failure
        {
          todo: nil,
          errors: result.failure.full_messages
        }
      end
    end
  end
end
