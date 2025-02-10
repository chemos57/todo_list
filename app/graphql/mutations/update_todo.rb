module Mutations
  class UpdateTodo < BaseMutation
    argument :id, ID, required: true
    argument :input, Types::TodoInput, required: true

    field :todo, Types::TodoType, null: true
    field :errors, [String], null: true

    def resolve(id:, input:)
      todo = Todo.find_by(id: id)
      return { todo: nil, errors: ['Todo not found'] } unless todo

      result = Todos::UpdateService.new.call(todo, input.to_h)
      
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
