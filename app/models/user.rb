class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :openid_identity, type: String
  field :openid_data, type: Hash
  field :main_role, type: String
  field :about, type: String
  field :status, type: String

  has_many :projects
end
