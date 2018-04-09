module API
  module V1
    module Product
      module Operation
        class Destroy < Pragma::Operation::Destroy
          step :add_response!

          def add_response!(options)
            options['result.response'] = Pragma::Operation::Response.new(
              status: 200,
              entity: {
                message: "Record deleted"
              }
            )
          end
        end
      end
    end
  end
end
