module API
  module V1
    module Product
      module Contract
        class Base < Pragma::Contract::Base
          property :name
          property :description
          property :number

          validation do
            required(:name).filled
            required(:description).filled
            required(:number).filled
          end
        
        end
      end
    end
  end
end
