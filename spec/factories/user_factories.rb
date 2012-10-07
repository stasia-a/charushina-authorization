FactoryGirl.define do
  factory :user do
    email "example@example.com"
    login  "example"
    full_name "John Davis"
    password "password"
    password_confirmation "password"
    auth_secret "111111"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    email "example1@example.com"
    login  "example1"
    full_name "John Davis"
    password "password"
    password_confirmation "password"
    auth_secret "111111"
    admin      true
  end
end