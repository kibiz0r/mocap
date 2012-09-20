module Mocap
  module ViewModelness
    extend MocapSupport::Concern
    include Captivation::Routable

    def presenting(view)
    end

    def presented(view)
    end
  end
end
