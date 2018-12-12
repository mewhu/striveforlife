class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # add "admin?" function as the judgement of administrator
  def admin?
    if self.role == "admin"
      return true
    else
      return false
    end
  end
end
