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
          stream.each do |event, *args|
            self.class.capture_map[event].each do |block|
              instance_exec *args, &block
            end
          end
        end
      end

      attr_writer :captives

      def captures(event, &block)
        capture_map[event] << block
      end

      def capture_map
        @capture_map ||= Hash.new { |h, k| h[k] = [] }
      end

      def captives
        @captives ||= []
      end

      def captivated_by(*captives)
        captivated

        constructor *captives

        captives += captives
      end
    end
  end
end
