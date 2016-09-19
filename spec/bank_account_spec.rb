require 'bank_account'

describe BankAccount do
  subject(:account) {described_class.new}

  before do
    allow(Time).to receive(:now) { '2016-09-19 14:19:43 +0100' }
  end

  describe 'initialize' do
    it 'New account has a balance of 0' do
      expect(account.balance).to eq(0)
    end

    it 'No transactions' do
      expect(account.transactions).to be_empty
    end
  end

  describe '#transactions' do
    before do
      account.deposit("Wages", 3000)
    end

    it 'has date, description and amount' do
      expect(account.transactions).to include(:date => Time.now,:description => "Wages", :amount => 3000)
    end
  end

  describe '#deposit' do
    it 'has increased balance' do
      account.deposit("Wages", 3000)
      expect(account.balance).to eq(3000)
    end
  end

  describe '#withdraw' do
    before do
      account.deposit("Wages", 3000)
    end

    it 'has decreased balance' do
      account.withdraw("Flight", 600)
      expect(account.balance).to eq(2400)
    end
  end
end
