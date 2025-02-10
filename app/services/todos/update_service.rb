module Todos
  class UpdateService < ApplicationService
    def call(todo, params)
      if todo.update(params)
        Success(todo)
      else
        Failure(todo.errors)
      end
    end
  end
end
