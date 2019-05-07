require 'rspec'


class Account
  attr_accessor :logger
  def close
    # logger.account_closed
    # logger.account_closed '42'
    logger.account_closed self
  end
end

describe Account do
  context "when closed" do
    it "should log an 'account closed' message" do
      logger = double('logger')
      account = Account.new
      account.logger = logger

      expect(logger).to receive(:account_closed).with(account)

      account.close
    end
  end
end
