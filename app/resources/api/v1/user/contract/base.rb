module API
  module V1
    module User
      module Contract
        class Base < Pragma::Contract::Base
          property :first_name
          property :last_name
          property :username
          property :email
          property :password

          validation do
            required(:first_name).filled(min_size?: 2)
            required(:last_name).filled(min_size?: 2)
            required(:username).filled(min_size?: 3)
            required(:email).filled(format?: /\A[A-Z0-9._%a-z\-]+@(?:[A-Z0-9a-z\-]+\.)+[A-Za-z]{2,4}\z/)
            required(:password).filled(min_size?: 8, format?: /\A^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d]{8,}\z/)
          end
        end
      end
    end
  end
end
