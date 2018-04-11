FactoryBot.define do
  factory :user do
    first_name "my_first_name"
    last_name "my_last_name"
    username "my_username"
    email "email@gmail.com"
    password "mypassword123"
    role "admin"
  end
end
