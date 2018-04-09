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
          # record.author == user
          true
        end

        def create?
          true
        end

        def update?
          true
        end

        def destroy?
          true
        end
      end
    end
  end
end
