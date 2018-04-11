module API
  module V1
    module User
      module Decorator
        class Instance < Pragma::Decorator::Base
          feature Pragma::Decorator::Type
          feature Pragma::Decorator::Timestamp

          property :first_name
          property :last_name
          property :username

          timestamp :created_at
          timestamp :updated_at
        end
      end
    end
  end
end
