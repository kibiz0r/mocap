module Mocap
  module PresentedWith
    extend MocapSupport::Concern

    module ClassMethods
      def presented_with(*slots)
        attr_accessor *slots
        slots.each do |slot|
          presented_slots << slot
        end
      end

      def presented_slots
        @presented_slots ||= []
      end
    end
  end
end
