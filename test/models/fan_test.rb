require 'test_helper'

class FanTest < ActiveSupport::TestCase

  def valid_attributes
    { 
      name: "Dmitry",
      email: "dmitry@beliber.com"
    }
  end

  test "creates a fan with valid attributes" do
    fan = Fan.new(valid_attributes)

    assert fan.valid? 
  end

  test "fan is invalid without a name" do
    fan = Fan.new(email: "dmitry@beliber.com")

    refute fan.valid?
  end

  test "cannot create a fan with duplicate email" do
    2.times { Fan.create(valid_attributes) }

    result = Fan.where(email: "dmitry@beliber.com")

    assert_equal 1, result.count
  end

  test "name can only contain upper and lower case letters" do
    fan = Fan.new(name: "Lev!", email: "lev@levlev.com")

    refute fan.valid?
  end

  test "email must be between 5 and 50 characters" do
    fan = Fan.new(name: "Dmitry", email: "cat")

    refute fan.valid?
  end

  test "fan cannot be named Richard" do
    fan = Fan.new(name: "Richard", email: "richard@petowner.com")

    refute fan.valid? 
  end

  test "fan has a belieber nickname" do
    fan = Fan.new(valid_attributes)

    assert_equal "Dmitrylieber", fan.nickname
  end
end
