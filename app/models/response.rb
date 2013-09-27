class Response
  include Mongoid::Document
  include Mongoid::Timestamps
  field :body, type: String
  field :budjet, type: String
  field :time, type: String
end
