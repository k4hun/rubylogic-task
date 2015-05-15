class Request < ActiveRecord::Base
  before_validation :set_as_unread

  validates :description, :email, :category, presence: { message: 'Pole nie może być puste!' }
  CATEGORIES = ['awaria', 'uszkodzenie', 'usterka']
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 100, message: 'Pole musi zawierać minimum 100 znaków!' }
  validates :email, format: { with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/), message: 'Zły format adresu email!' }

  def set_as_unread
    self.read = false
    true
  end
end
