class PaymentTransactionsDecorator < BaseDecorator

  def bought_at
    model.created_at.strftime("%d %B %Y").upcase
  end

  def purchase_time
    model.created_at.time.strftime("%I.%M%p")
  end

  def package_title
    package.title
  end

  def package_description
    package.description
  end

  private

  def package
    model.package
  end
end
