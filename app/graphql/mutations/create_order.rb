module Mutations
  class CreateOrder < BaseMutation
    argument :total, Int, required: true
    argument :customer_id, ID, required: false

    type Types::OrderType

    def resolve(customer_id: nil, total: nil)
      Order.create!(
        customer: Customer.find(customer_id),
        total: total
      )
    end
  end
end
