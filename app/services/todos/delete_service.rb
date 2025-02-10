module Todos
  class DeleteService < ApplicationService
    def call(todo)
      if todo.destroy
        Success(todo)
      else
        Failure(todo.errors)
      end
    end
  end
end
