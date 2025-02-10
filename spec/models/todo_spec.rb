require 'rails_helper'

RSpec.describe Todo, type: :model do
  describe 'validations' do
    it 'is valid with a title' do
      todo = build(:todo)
      expect(todo).to be_valid
    end

    it 'is invalid without a title' do
      todo = build(:todo, title: nil)
      expect(todo).not_to be_valid
      expect(todo.errors[:title]).to include("can't be blank")
    end
  end

  describe 'scopes' do
    let!(:pending_todo) { create(:todo) }
    let!(:completed_todo) { create(:todo, completed: true) }

    describe '.pending' do
      it 'returns only pending todos' do
        expect(Todo.pending).to include(pending_todo)
        expect(Todo.pending).not_to include(completed_todo)
      end
    end

    describe '.completed' do
      it 'returns only completed todos' do
        expect(Todo.completed).to include(completed_todo)
        expect(Todo.completed).not_to include(pending_todo)
      end
    end
  end
end
