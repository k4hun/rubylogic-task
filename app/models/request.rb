class Request < ActiveRecord::Base
  before_save :set_price, :set_deadline

  validates :description, :email, :category, presence: { message: 'Pole nie może być puste!' }
  CATEGORIES = ['awaria', 'uszkodzenie', 'usterka']
  validates :category, inclusion: { in: CATEGORIES }
  validates :description, length: { minimum: 100, message: 'Pole musi zawierać minimum 100 znaków!' }
  validates :email, format: { with: (/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/), message: 'Zły format adresu email!' }

  def set_price
    case self.category
    when 'awaria'
      if Time.now.hour >= 17 || Time.now.hour <= 9
        self.price = 100
      else
        self.price = 50
      end
    when 'uszkodzenie'
      self.price = 10
    when 'usterka'
      self.price = 1
    else
      false
    end
  end

  def set_deadline
    case self.category
    when 'awaria'
      self.deadline = Time.now + 4.hours
    when 'uszkodzenie'
      self.deadline = Time.now + 1.day
    when 'usterka'
      self.deadline = Time.now + 3.days
    else
      false
    end
  end
end
