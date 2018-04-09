module API
  module V1
    module Product
      module Decorator
        class Instance < Pragma::Decorator::Base
          feature Pragma::Decorator::Type
          feature Pragma::Decorator::Timestamp

          property :id
          property :name
          property :description
          property :number

          timestamp :created_at
          timestamp :updated_at
        end
      end
    end
  end
end
