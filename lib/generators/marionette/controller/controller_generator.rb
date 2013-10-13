require 'eco'
require 'generators/marionette/resource_helpers'

module Marionette
  module Generators
    class ControllerGenerator < Rails::Generators::NamedBase
      include Marionette::Generators::ResourceHelpers

      source_root File.expand_path("../templates", __FILE__)

      argument :actions, :type => :array, :default => [], :banner => "action action"

      RESERVED_JS_WORDS = %W{ break case catch continue debugger default delete do else finally for function if in instanceof return switch this throw try typeof var void while with }

      def validate_no_reserved_words
        actions.each do |action|
          if RESERVED_JS_WORDS.include? action
            raise Thor::Error, "The name '#{action}' is reserved by javascript " <<
                "Please choose an alternative action name and run this generator again."
          end
        end
      end

      ## TODO: IF YOU HAVE NOT ADDED ANY ACTIONS, IT SHOULD ASK YOU A SERIES OF QUESTIONS TO DECIDE WHAT YOU WANT TO BUILD
      ## IE: DO YOU WANT DIALOGS? ARE YOU EDITING ANYTHING? ARE YOU SHOWING ANYTHING? ARE YOU LISTING ANYTHING?
      ## LOOK AT MY WEBAPP MODULES AND FIND PATTERNS, IF THERE AREN'T PATTERNS, CREATE THEM!
      ## rails g marionette:module users show list edit -> listUsers showUser editUser <- methods -- actually just use |list, show, edit, new/New|
      ## or just ask questions to determine stuff if there aren't any actions... that's probably better

      ## TODO: ASK WHAT SUB MODULES YOU'D LIKE ADDED AS WELL - WHICH COME AFTER THE MODULE - LIKE SCAFFOLDS

      def create_controller
        actions.each do |action|
          %W{ controller view }.each do |type|
            @action = action
            @controller = action.capitalize
            template "#{action}_#{type}.js.coffee.erb", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/#{action}_#{type}.js.coffee"
          end
        end
      end

      def create_template
        actions.each do |action|
          @controller = action.capitalize
          if action == 'new'
            template "#{action}.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/#{action}_#{singlularized_lower_module_name}.jst.eco"
          else
            template "#{action}_layout.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/#{action}_layout.jst.eco"
            template "#{action}.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/#{action}_#{singlularized_lower_module_name}.jst.eco"
            template "#{action}_breadcrumb.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/_breadcrumb.jst.eco"
            template "_panel.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/_panel.jst.eco" if action == 'list'
            template "blank.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/new_#{singlularized_lower_module_name}.jst.eco" if action == 'list'
            template "_sidebar.jst.eco", "#{backbone_path}/apps/#{module_name_underscore}/#{action}/templates/_sidebar.jst.eco"
          end
        end
      end

      private

      def view_base_template_path
        "#{module_name_underscore}/#{@controller.downcase}"
      end

      def view_template_path
        "#{module_name_underscore}/#{@controller.downcase}/#{@controller.downcase}_layout"
      end

    end
  end
end
