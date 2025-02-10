class Todo < ApplicationRecord
  validates :title, presence: true
  
  scope :pending, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
end
