module Types
  module Base
    module BaseInterface
      include GraphQL::Schema::Interface
      edge_type_class(Types::Base::BaseEdge)
      connection_type_class(Types::Base::BaseConnection)

      field_class Types::Base::BaseField
    end
  end
end
