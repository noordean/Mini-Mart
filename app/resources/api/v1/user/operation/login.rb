module API
  module V1
    module User
      module Operation
        class Login < Pragma::Operation::Base
          step :authenticate?
          failure :send_auth_error!
          step :generate_token!
          step :send_response!
          
          def authenticate?(options, params:, **)
            auth_object = ::Authentication.new(
              username: params["username"],
              password: params["password"]
            )
            options["auth_object"] = auth_object
            auth_object.authenticate
          end
          
          def send_auth_error!(options)
            options['result.response'] = Pragma::Operation::Response.new(
              status: 401,
              entity: {
                message: "Invalid username/password combination"
              }
            )
          end

          def generate_token!(options)
            options["token"] = options["auth_object"].generate_token
            true
          end

          def send_response!(options)
            options['result.response'] = Pragma::Operation::Response.new(
              status: 200,
              entity: {
                message: "Login successful",
                token: options["token"]
              }
            )
          end
        end
      end
    end
  end
end
