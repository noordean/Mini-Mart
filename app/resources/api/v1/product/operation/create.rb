module API
  module V1
    module Product
      module Operation
        class Create < Pragma::Operation::Create
          step :unique?, before: 'persist.save'
          failure :log_error!

          def unique?(options, params:, **)
            ::Product.find_by(name: params["name"]).nil?
          end

          def log_error!(options)
            options['result.response'] = Pragma::Operation::Response.new(
              status: 409,
              entity: {
                message: "Record already exists"
              }
            )
          end
        end
      end
    end
  end
end
