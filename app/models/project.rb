class Project
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :body, type: String
  field :budget, type: String
  field :time, type: String

  belongs_to :user
end
