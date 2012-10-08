require 'spec_helper'

describe User do
  describe "user" do
    before { @user = FactoryGirl.build(:user) }

    subject {@user}

    it { should be_valid}

    it { should respond_to(:login) }
    it { should respond_to(:email) }
    it { should respond_to(:full_name) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }

    describe "when login is not present" do
      before { @user.login = "" }
      it { should_not be_valid }
    end

    describe "when email is not present" do
      before { @user.email = "" }
      it { should_not be_valid }
    end

    describe "when full name is too long" do
      before { @user.full_name = "a" * 51 }
      it { should_not be_valid }
    end

    describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
    end

    describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
    end

    describe "when email address is already taken" do
      before do
        user_with_same_email = FactoryGirl.build(:user, login:"example1")
        user_with_same_email.email = @user.email.upcase
        user_with_same_email.save
      end

      it { should_not be_valid }
    end

    describe "when login is already taken" do
      before do
        user_with_same_login = FactoryGirl.build(:user, email:"example1@example.com")
        user_with_same_login.save
      end

      it { should_not be_valid }
    end

    describe "when password is not present" do
      before { @user.password = @user.password_confirmation = " " }
      it { should_not be_valid }
    end

    describe "when password doesn't match confirmation" do
      before { @user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

    describe "when password confirmation is nil" do
      before { @user.password_confirmation = nil }
      it { should_not be_valid }
    end

    describe "with a password that's too short" do
      before { @user.password = @user.password_confirmation = "a" * 5 }
      it { should be_invalid }
    end

    describe "when first user after save"

  end



  describe "admin" do
  end
end
