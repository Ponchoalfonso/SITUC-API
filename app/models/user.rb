class User < ApplicationRecord
  acts_as_token_authenticatable
  has_many :payments

  before_validation :set_credit
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def set_credit
    if self.credit == nil
      self.credit = 0
    end
  end

end
