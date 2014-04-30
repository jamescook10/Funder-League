class Player < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  validates :first_name, presence: true

  def full_name
    if self.first_name && self.last_name
      self.first_name + " " + self.last_name
    else
      self.first_name
    end
  end

  def possessive_form(name)
    if name[-1] == "s"
      name + "'"
    else
      name + "'s"
    end
  end
end
