BusinessType = GraphQL::ObjectType.define do
  name "Business"
  description "A san francisco registered business"
  field :id, !types.ID
  field :account_number, !types.Int
  field :ownership_name, !types.String
  field :start_date, !types.String
  field :end_date, !types.String
  field :create_at, !types.String
  field :updated_at, !types.String
end

NaicsInfoType = GraphQL::ObjectType.define do
  name "NaicsInfoType"
  description "Naics codes and descriptions"
  field :id, !types.ID
  field :naics_code, !types.String
  field :naics_code_description, !types.String
end

QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root of this schema"

  field :business do
    type BusinessType
    argument :id, !types.ID
    description "Find a business by ID"
    resolve ->(obj, args, ctx) { Business.find(args['id']) }
  end
end

Schema = GrapahQL::Schema.define do
  query QueryType
end
