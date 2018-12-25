module API
  module V1
    module Entities
      class User < Grape::Entity
        expose :id
        expose :name
      end
    end
  end
end
