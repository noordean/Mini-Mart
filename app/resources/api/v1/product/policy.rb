module API
  module V1
    module Product
      class Policy < Pragma::Policy::Base
        class Scope < Pragma::Policy::Base::Scope
          def resolve
            scope.all
          end
        end

        def show?
          true
        end

        def create?
          user.role == "admin" if user
        end

        def update?
          user.role == "admin" if user
        end

        def destroy?
          user.role == "admin" if user
        end
      end
    end
  end
end
