module Types
  class QueryType < Types::Base::BaseObject
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Get all groups
    field :groups, [Types::Model::GroupType, null: true], null: false
    def groups
      Group.includes(:members).all
    end

    field :groupsConnection, Types::Model::GroupType.connection_type, null: false
    def groupsConnection
      Group.includes(:members).all
    end

    # Get a specific group
    field :group, Types::Model::GroupType, null: false do
      argument :id, ID, required: true
    end
    def group(id:)
      Group.find(id)
    end

     # Get all members
     field :members, [Types::Model::MemberType, null: true], null: false
     def members
        Member.includes(:group).all
     end

     field :membersConnection, Types::Model::MemberType.connection_type, null: false
     def membersConnection
       Member.includes(:group).all
     end

     # Get a specific member
     field :member, Types::Model::MemberType, null: false do
       argument :id, ID, required: true
     end
     def member(id:)
      Member.find(id)
     end
  end
end
