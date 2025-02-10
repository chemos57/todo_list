module Todos
  class ToggleService < ApplicationService
    def call(todo)
      if todo.update(completed: !todo.completed)
        Success(todo)
      else
        Failure(todo.errors)
      end
    end
  end
end
