require 'spec_helper'

FactoryGirl.define do
  factory :owner do
    first_name 'John'
    last_name  'Doe'
    email 'faizaan@example.com'
    company 'wherever'
  end

  factory :building do
    name 'The Dorchester'
    street_address '1116 Dorchester Ave'
    city 'Boston'
    postal_code '02125'
    state 'MA'
  end
end
