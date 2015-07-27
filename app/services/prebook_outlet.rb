class PrebookOutlet
  attr_acessor :outlet_id

  def initialize(outlet_id)
    @outlet_id = outlet_id
  end

  def fetch
    session[:prebk_outlet] = nil
    outlet = Outlet.find(session[:prebk_outlet])
  end
end
