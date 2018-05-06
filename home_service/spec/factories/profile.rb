FactoryBot.define do
  factory :profile do
    phone "999999999"
    street "77 Strawberry"
    city "Acton"
    state "Ma"
    zipcode "01234"
    user { create :user}
  end
end