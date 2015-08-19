RailsAdmin.config do |config|
  require Rails.root.join('lib', 'rails_admin_activate_merchant.rb')
  require Rails.root.join('lib', 'rails_admin_set_featured.rb')
  ### Popular gems integration

  ## == Sorcery ==
  config.authenticate_with do
  #   warden.authenticate! scope: :user
    require_login
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
  config.authorize_with do |controller|
    redirect_to main_app.admin_login_path unless current_user.try(:admin?)
  end

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

  config.model Outlet do
    list do
      field :bookings_count do
        sortable true
      end
      field :type_of_service do
        searchable true
      end
      field :featured
      field :name
      field :phone_number
      field :area
      field :address
      field :state
      field :latitude
      field :longitude
      field :price_range
      field :availability
      field :credits do
        sortable true
      end
      field :business_registration
      field :completed_registration
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
    show_in_app do
      only []
    end

    # Custom Actions
    activate_user do
      only ['User']
    end

    deactivate_user do
      only ['User']
    end

    feature_outlet do
      only ['Outlet']
    end

    unfeature_outlet do
      only ['Outlet']
    end

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
