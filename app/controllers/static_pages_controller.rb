class StaticPagesController < ApplicationController

  def landing
  end

  def about
  end

  def how_it_works
  end

  def faq
  end

  def terms
  end

  def partners
    outlets = Outlet.where(featured: true)
    @outlets = OutletDecorator.wrap(outlets)
  end
end
