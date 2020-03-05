require "rails_helper"

# follow https://selleo.com/blog/testing-graphql-mutations-in-ruby-on-rails-with-rspec
# https://www.howtographql.com/graphql-ruby/6-error-handling/

module Mutations
  module Customers
    RSpec.describe CreateCustomer, type: :request do
      describe ".resolve" do
        let(:customer_details) { customer_details_hash }

        it "creates a new customer details" do
          expect do
            post "/graphql", params: { query: query(customer_details) }
          end#.to change { Customer.count }.by(1)

          customer = Customer.last

          expect(customer.first_name).to eq(customer_details[:first_name])
          expect(customer.last_name).to eq(customer_details[:last_name])
          expect(customer.phone_number).to eq(customer_details[:phone_number])
        end
      end

      def query(customer_details)
        <<~GQL
          mutation createCustomer{
            createCustomer(input: {
              firstName: "#{customer_details[:first_name]}",
              lastName: "#{customer_details[:last_name]}",
              phoneNumber: "#{customer_details[:phone_number]}"
            }){
              id
              firstName
              lastName
              phoneNumber
            }
          }
        GQL
      end

      def customer_details_hash
        {
          first_name: "Vitalijus",
          last_name: "Desukas",
          phone_number: 2348
        }
      end
    end
  end
end
