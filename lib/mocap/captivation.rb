module Mocap
  module Captivation
    attr_reader :stream

    def fire(event, *args)
      stream << [event, args]
    end

    module ClassMethods
      def captivated
        define_method :initialize do |args|
          stream = args[:stream]._? { Reactr::Streamer.new }
          instance_variable_set :@stream, stream
          motivate! args
          self.class.captives.each do |captive|
            args[captive].stream.subscribe stream
          end
        end
      end

      attr_writer :captives

      def captives
        @captives ||= []
      end

      def captivates(captives)
        captivated

        captives += captives
      end
    end
  end
end
