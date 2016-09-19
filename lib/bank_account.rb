class BankAccount
  attr_reader :transactions

  def initialize
    @transactions = []
  end

  def balance
    balance = 0
    @transactions.each do |transaction|
      balance += transaction[:amount]
    end
    return balance
  end

  def add_transaction(description, amount)
    @transactions.push(date: Time.now, description: description, amount: amount)
  end

  def deposit(description, amount)
    add_transaction(description, amount)
  end

  def withdraw(description, amount)
    add_transaction(description, -amount)
  end
end
