FactoryBot.define do
  factory :user do
    email "kolbykalafut@gmail.com"
    password "password"
    password_confirmation "password"
    confirmed_at Date.today
  end
end
