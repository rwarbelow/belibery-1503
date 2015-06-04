class Fan < ActiveRecord::Base
  validates :name, presence: true, 
                   format: { with: /\A[a-zA-Z]+\z/, message: "only allows upper and lower case letters" }
  validates :email, uniqueness: true,
                    length: { in: 5..50 }

  validate :no_richards

  def nickname
    "#{name}lieber"
  end

  def no_richards
    errors.add(:name, "cannot be Richard") if name && name.downcase == "richard"
  end
end
