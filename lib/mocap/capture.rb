module Mocap
  module Capture
    def capture(event, &block)
      stream.each do |e, args|
        block[args] if event == e
      end
    end

    module ClassMethods
    end
  end
end
