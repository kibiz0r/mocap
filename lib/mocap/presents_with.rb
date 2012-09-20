module Mocap
  module PresentsWith
    extend MocapSupport::Concern

    module ClassMethods
      def presents_with(*slots)
        slot_map = slots.extract_options!
        until slots.empty?
          slot = slots.shift
          slot_map[slot] ||= slot
        end

        slot_map.each do |slot, source|
          presents_map[slot] = source
        end
      end

      def presents_map
        @presents_map ||= {}
      end
    end
  end
end
