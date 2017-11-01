class User < ActiveRecord::Base

  has_many :rides
  has_many :attractions, through: :rides
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  def email_required?
     false
  end

  def email_changed?
     false
  end

  def guest?
    persisted?
  end

  def mood
    if happiness > nausea
      "happy"
    else
      "sad"
    end
  end

end
