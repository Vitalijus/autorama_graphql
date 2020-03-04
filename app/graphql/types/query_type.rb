module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :all_customers, [CustomerType], null: false

    # this method is invoked, when `all_link` fields is being resolved
   def all_customers
     Customer.all
   end
  end
end
