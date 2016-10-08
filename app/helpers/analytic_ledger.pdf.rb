module AnalyticLedgersHelper
  def parent_accounts
  @accounts = SecondSyntheticAccount.all
  end

end
