module API
  module V1
    module User
      module Operation
        class Create < Pragma::Operation::Create
          step :unique?, before: 'persist.save'
          failure :log_error!

          def unique?(options, params:, **)
            ::User.where(email: params["email"]).or(::User.where(username: params["username"])).empty?
          end

          def log_error!(options)
            options['result.response'] = Pragma::Operation::Response.new(
              status: 409,
              entity: {
                message: "User already exists"
              }
            )
          end
        end
      end
    end
  end
end
