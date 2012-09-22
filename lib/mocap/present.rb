module Mocap
  module Present
    def present(view, provided_values = {})
      presentation_slots = view.class.presented_slots + provided_values.keys + self.class.presents_map.keys

      presentation_values = Hash[presentation_slots.map do |slot|
        provided = provided_values[slot]
        if provided
          wrapper_factory = wrapper_factories[slot]
          if wrapper_factory
            wrapper = wrapper_factory.new provided_values
            [slot, wrapper]
          else
            [slot, provided]
          end
        else
          source = self.class.presents_map[slot]
          ivar = :"@#{source}"
          value = instance_variable_get ivar

          [slot, value]
        end
      end]

      presentation_values.each do |slot, value|
        setter = :"#{slot}="
        if view.respond_to? setter
          view.send setter, value
        end
      end

      presentation_values.each_value do |value|
        next unless value.is_a? Mocap::ViewModelness

        they = value.router.public_channel # use their public channel
        we = router.named_channel value # use our named channel

        we.connect they
      end

      presentation_values.each_value do |value|
        next unless value.is_a? Mocap::ViewModelness
        value.presenting view
      end

      view.present

      presentation_values.each_value do |value|
        next unless value.is_a? Mocap::ViewModelness
        value.presented view
      end

      view
    end
  end
end
