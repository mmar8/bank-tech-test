class BankAccount
  attr_reader :balance, :transactions

  EMPTY_ACCOUNT = 0

  def initialize(balance = EMPTY_ACCOUNT)
    @balance = balance
    @transactions = []
  end

  def add_transaction(description, amount)
    @transactions.push(date: Time.now, description: description, amount: amount)
  end

  def deposit(description, amount)
    add_transaction(description, amount)
    @balance += amount
  end

  def withdraw(description, amount)
    add_transaction(description, -amount)
    @balance -= amount
  end
end
