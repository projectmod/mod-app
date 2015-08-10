RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin_activate_merchant.rb')

  ### Popular gems integration

  ## == Sorcery ==
  config.authenticate_with do
  #   warden.authenticate! scope: :user
    require_login
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with :cancan, Ability

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  config.excluded_models = ['Authentication']

  # Set local timezone
  module Fields
    module Types
      class Datetime < RailsAdmin::Config::Fields::Base
        def value
          value_in_default_time_zone = bindings[:object].send(name)
          return nil if value_in_default_time_zone.nil?
          pacific_time_zone = ActiveSupport::TimeZone.new('Asia/Kuala_Lumpur')
          value_in_default_time_zone.in_time_zone(pacific_time_zone)
        end
      end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    # Custom Actions
    set_activated do
      only ['User']
    end

    set_deactivated do
      only ['User']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
