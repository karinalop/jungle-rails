require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it "is valid with name, email, password and password_confirmation" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      expect(user).to be_valid
    end

    it "is not valid without a name" do
      user = User.new(
        name: nil,
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without an email" do
      user = User.new(
        name: 'kar',
        email: nil,
        password: 'kar',
        password_confirmation: 'kar'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a password" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: nil,
        password_confirmation: 'kar'
      )
      expect(user).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: nil
      )
      expect(user).to_not be_valid
    end

    it "is not valid if password is not equal to  password_confirmation" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kara'
      )
      expect(user).to_not be_valid
    end

    it "is not valid if the email is not unique" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      user.save

      user1 = User.new(
        name: 'kari',
        email: 'kar@gmail.com',
        password: 'kari',
        password_confirmation: 'kari'
      )
      user1.save

      expect(user1).to_not be_valid
    end

    it "is not valid if password is shorter than 3 characters" do
      user = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'ka',
        password_confirmation: 'ka'
      )
      expect(user).to_not be_valid
    end
  end
  describe "Class Method" do
    it "should return truthy if user email and password are equal to user-name and user-password" do
      user1 = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      user1.save
      user = User.authenticate_with_credentials('kar@gmail.com', 'kar')
      expect(user).to eq user1
    end

    it "should return false if user email dosent match the user email" do
      user1 = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      user1.save
      user = User.authenticate_with_credentials('kari@gmail.com', 'kar')

      expect(user).to_not eq user1
    end

    it "should return false if password dosent match the user password" do
      user1 = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      user1.save
      user = User.authenticate_with_credentials('kar@gmail.com', 'kari')

      expect(user).to_not eq user1
    end
    it "should return true when email has spaces before/after the email adress " do
      user1 = User.new(
        name: 'kar',
        email: 'kar@gmail.com',
        password: 'kar',
        password_confirmation: 'kar'
      )
      user1.save
      user = User.authenticate_with_credentials('  kar@gmail.com ', 'kar')
      expect(user).to eq user1
    end
  end
end
