module Mocap
  module Present
    def present(view, wrapper_values)
      wrapped_view_models = Hash[wrapper_values.map do |wrapper_name, *value|
        [
          wrapper_name,
          wrapper_factories[wrapper_name].new(*value)
        ]
      end]
      wrapped_view_models.each do |wrapper_name, wrapper|
        view.send :"#{wrapper_name}=", wrapper
      end
      view.present
    end
  end
end
