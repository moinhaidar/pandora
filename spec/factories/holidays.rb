# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :holiday do
    name "MyString"
    date "2013-02-23"
    type ""
    weekend false
  end
end
