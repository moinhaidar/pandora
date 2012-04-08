Factory.sequence(:student_email) { |n| "student_email#{n}@example.com" }

FactoryGirl.define do
  factory :student do
    email Factory.next(:student_email)
    first_name 'Moin'
    last_name 'Haidar'
    address 'Hitech City, Hyderabad'
    mobile '8121783479'
    active true
  end
  
end
