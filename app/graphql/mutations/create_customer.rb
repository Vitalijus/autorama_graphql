module Mutations
  class CreateCustomer < BaseMutation
    # arguments passed to the `resolve` method
    argument :first_name, String, required: true
    argument :last_name, String, required: true
    argument :phone_number, Int, required: true

    # return type from thr mutation
    type Types::CustomerType

    def resolve(first_name: nil, last_name: nil, phone_number: nil)
      Customer.create!(
        first_name: first_name,
        last_name: last_name,
        phone_number: phone_number
      )

      rescue ActiveRecord::RecordInvalid => e
        GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
      end
    end
end
