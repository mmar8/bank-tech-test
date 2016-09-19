require 'bank_account'

describe BankAccount do
  subject(:account) {described_class.new}

  describe 'initialize' do
    it 'No transactions' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#balance' do
    it 'New account has a balance of 0' do
      expect(account.balance).to eq(0)
    end
  end

  describe '#deposit' do
    before do
      @fake_time = Time.now
      Time.stub(:now) { @fake_time }

      account.deposit("Wages", 3000)
    end

    it 'has date, description and amount' do
      expect(account.transactions).to include(:date => Time.now.strftime("%d-%m-%Y"),:description => "Wages", :amount => 3000)
    end
  end
end
