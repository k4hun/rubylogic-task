class Request < ActiveRecord::Base
  before_save :set_as_unread

  validates :description, :email, :category, presence: true
  validates :category, inclusion: { in: %w(awaria, uszkodzenie, usterka) }
  validates :description, length: { minimum: 100 }
  validates :email, format: { with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/) }

  def set_as_unread
    self.read = false
  end
end
