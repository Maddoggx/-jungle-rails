require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before(:each) do
      @user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "janedoe123@gmail.com",
        password: "2468",
        password_confirmation: "2468"
      )
      @user.save
    end

    it 'should not be nil if all fields are present' do
      expect(@user).to be_valid
    end

    it 'should require a first name' do
      @user.first_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'should require a last name' do
      @user.last_name = nil
      @user.save
      expect(@user).to_not be_valid
    end

    it 'email should be present' do
      user = User.new(first_name: "Jane", last_name: "Doe", email: nil, password: "2468",  password_confirmation: "2468")
      expect(user).to_not be_valid
      expect(user.errors.full_messages.first).to include("Email can't be blank")
    end

    it 'needs to have a unique email, not case sensitive' do
      @user2 = User.new ({ first_name: 'Jane', last_name: 'Doe', email: 'JaneDoe123@gmail.com', password: '2468', password_confirmation: '2468' })
      @user2.save
      # expect(@user).not_to be_valid
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
  end

  
    it 'should require password to be present' do
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "janedoe1234@gmail.com",
        password: "2468",
        password_confirmation: "2468"
      )
      user.save
      expect(user).to be_valid
    end

    it 'should have the same password and password confirmation' do
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "janedoe1234@gmail.com",
        password: "2468",
        password_confirmation: "246"
      )
      user.save
      expect(user).to_not be_valid
    end

    it 'should have matching password and password_confirmation' do
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "janedoe1234@gmail.com",
        password: "2468",
        password_confirmation: "246"
      )
      user.save
      expect(user.password).to_not eq(user.password_confirmation)
    end

    it 'makes sure password has at least 4 characters' do
      user = User.new(
        first_name: "Jane",
        last_name: "Doe",
        email: "janedoe1234@gmail.com",
        password: "246",
        password_confirmation: "246"
      )
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end

describe '.authenticate_with_credentials' do
  
  it 'should return a valid email' do
    user = User.new(
      first_name: "Jane",
      last_name: "Doe",
      email: "janedoe1234@gmail.com",
      password: "2468",
      password_confirmation: "2468"
    )
    user.save
    expect(User.authenticate_with_credentials(nil, "2468")).to be_falsy
  end

  it 'should return the user even with trailing whitespaces' do
    user = User.new(
      first_name: "Jane",
      last_name: "Doe",
      email: "janedoe1234@gmail.com",
      password: "2468",
      password_confirmation: "2468"
    )
    user.save

    expect(User.authenticate_with_credentials("janedoe1234@gmail.com" , "2468")).to eq(user)
  end
end



