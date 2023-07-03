require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do

    it "should be created with a password and password_confirmation fields" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: nil, password_confirmation: nil)
      @user.save

      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "should not be created if password and password_confirmation fields do not match" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test1")
      expect(@user).to_not be_valid
    end

    it "should have unique email" do
      @user1 = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test")
      @user1.save
      @user2 = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test")

      expect(@user2).to_not be_valid
    end

    it "should have a first name, last name, and email" do
      @user = User.new(first_name: nil, last_name: nil, email: nil, password: "test", password_confirmation: "test")

      expect(@user).not_to be_valid
    end

    it "should have a password with a minimum length of 4" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: "tes", password_confirmation: "tes")

      expect(@user).not_to be_valid
    end
  end

  describe '.authenticate_with_credentials' do

    it "should only log in if email and password match" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials("test", "test")

      expect(@user).not_to be_nil
    end

    it "should authenticate user if email has spaces before or after" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials(" test ", "test")

      expect(@user).not_to be_nil
    end

    it "should authenticate user if email has different cases" do
      @user = User.new(first_name: "test", last_name: "test", email: "test", password: "test", password_confirmation: "test")
      @user.save
      @user = User.authenticate_with_credentials("TEST", "test")

      expect(@user).not_to be_nil
    end
  end
end

#     It must be created with a password and password_confirmation fields
# These need to match so you should have an example for where they are not the same
# These are required when creating the model so you should also have an example for this
# Emails must be unique (not case sensitive; for example, TEST@TEST.com should not be allowed if test@test.COM is in the database)
# Email, first name, and last name should also be required