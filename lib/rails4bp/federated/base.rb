module Rails4Bp
  module Federated
    module Base 
      def self.included(model)
        model.instance_eval do
          include ROXML
          include Rails4Bp::Federated::Base::InstanceMethods
        end
      end

      module InstanceMethods
        def to_rails4bp_xml
          <<-XML
          <XML>
          <post>#{to_xml.to_s}</post>
          </XML>
    XML
        end

        def x(input)
          input.to_s.to_xs
        end

        # @abstract
        # @note this must return [Array<Person>]
        # @return [Array<Person>]
        def subscribers(user)
          raise 'You must override subscribers in order to enable federation on this model'
        end

        # @abstract
        def receive(user, person)
          raise 'You must override receive in order to enable federation on this model'
        end

        # @param [User] sender
        # @note this is a hook(optional)
        def after_dispatch(sender)
        end
      end
    end
  end
end
