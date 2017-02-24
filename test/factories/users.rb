FactoryGirl.define do
  factory :user do
    name "John"
    login  "Doe"
    password '123456'
    password_confirmation '123456'
  end
end