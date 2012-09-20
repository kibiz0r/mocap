module Mocap
  module Wrap
    extend MocapSupport::Concern

    def wrapper_factories
      Hash[self.class.wrapper_factories.map do |wrapper_name, wrapper_factory_ivar|
        [wrapper_name, instance_variable_get(wrapper_factory_ivar)]
      end]
    end
  
    module ClassMethods
      def wrap(view_models)
        view_model_factory_names = Hash[view_models.map do |name, view_model|
          [name, "#{view_model}_factory"]
        end]

        constructor *view_model_factory_names.values

        @wrapper_factories = Hash[view_model_factory_names.map do |name, view_model_factory|
          [name, :"@#{view_model_factory}"]
        end]
      end

      def wrapper_factories
        @wrapper_factories ||= {}
      end
    end
  end
end
