module Types
  class OrderType < Types::BaseObject
    field :id, ID, null: false
    field :total, Int, null: false
    field :customer, Types::CustomerType, null: false
  end
end
