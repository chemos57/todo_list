module Mutations
  class DeleteTodo < BaseMutation
    argument :id, ID, required: true

    field :todo, Types::TodoType, null: true
    field :errors, [String], null: true

    def resolve(id:)
      todo = Todo.find_by(id: id)
      return { todo: nil, errors: ['Todo not found'] } unless todo

      result = Todos::DeleteService.new.call(todo)
      
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
