module Mocap
  module Presentation
    extend MocapSupport::Concern
    include Captivation::Routable
    include Mocap::Wrap
    include Mocap::Present
    include Mocap::PresentsWith
  end
end
