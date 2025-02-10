module Todos
  class CreateService < ApplicationService
    def call(params)
      todo = Todo.new(params)
      
      if todo.save
        Success(todo)
      else
        Failure(todo.errors)
      end
    end
  end
end
