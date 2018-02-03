class Folder < ApplicationRecord
  belongs_to :user
  has_many :questions, dependent: :destroy

  validates :name, presence: true

  after_initialize :init

  def init
    self.loose = "false" if self.loose.nil?
  end
end
