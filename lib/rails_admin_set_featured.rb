require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdmin
  module Config
    module Actions

      class FeatureOutlet < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && !bindings[:object].activated
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-eye-open'
        end

        register_instance_option :controller do
          Proc.new do
            @object.update(featured: true)

            flash[:notice] = "Outlet: #{@object.name} is now featured."

            redirect_to back_or_index
          end
        end
      end

      class UnfeatureOutlet < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && bindings[:object].activated
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-eye-close'
        end

        register_instance_option :controller do
          Proc.new do
            @object.update(featured: false)
            flash[:notice] = "Outlet: #{@object.name} is now unfeatured."

            redirect_to back_or_index
          end
        end
      end
    end
  end
end
