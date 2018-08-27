class Question < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :answers

  validates :description, presence: true

  attr_reader :folder_id
  attr_reader :answer
  attr_reader :source
end
