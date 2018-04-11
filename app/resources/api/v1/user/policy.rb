module API
  module V1
    module User
      class Policy < Pragma::Policy::Base
        class Scope < Pragma::Policy::Base::Scope
          def resolve
            scope.all
          end
        end

        def show?
          record == user
        end

        def create?
          true
        end

        def update?
          false
        end

        def destroy?
          false
        end
      end
    end
  end
end
