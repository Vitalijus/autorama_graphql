module Types
  class MutationType < Types::BaseObject
    field :create_customer, mutation: Mutations::CreateCustomer,
    description: "Create customer"

    field :create_order, mutation: Mutations::CreateOrder,
    description: "Create order"
  end
end
