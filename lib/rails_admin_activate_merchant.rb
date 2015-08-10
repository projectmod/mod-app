require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'
 
module RailsAdmin
  module Config
    module Actions
      
      class SetActivated < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && !bindings[:object].activated
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-check'
        end

        register_instance_option :controller do
          Proc.new do
            @object.update(activated: true)
            flash[:notice] = "Merchant: #{@object.name} has been activated."

            redirect_to back_or_index
          end
        end
      end

      class SetDeactivated < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          authorized? && bindings[:object].activated
        end

        register_instance_option :member do
          true
        end

        register_instance_option :link_icon do
          'icon-eject'
        end

        register_instance_option :controller do
          Proc.new do
            @object.update(activated: false)
            flash[:notice] = "Merchant: #{@object.name} has been deactivated."

            redirect_to back_or_index
          end
        end
      end
    end
  end
end

