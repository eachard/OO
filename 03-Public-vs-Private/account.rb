require_relative "transaction"

# This is how you define your own custom exception classes
class DepositError < StandardError
end

class BankAccount
  attr_reader :name, :position 
  
  # Contract for the BankAccount class
  # - you can access full owner's name and position, but partial IBAN
  # - you cannot access full IBAN
  # - you can print partial account infos
  # - you can print transactions only with a password
  # - you can withdraw or deposit money
  
  MIN_DEPOSIT =  100
  
  def initialize(name, iban, initial_deposit, password)
    raise DepositError, "Insufficient deposit" unless initial_deposit > MIN_DEPOSIT
    @password = password
    @transactions = []
    @position = 0
    @name = name
    @iban = iban
    
    add_transaction(initial_deposit)
  end
    
  def withdraw(amount)
    add_transaction(-amount)
  end
  
  def deposit(amount)
    add_transaction(amount)
  end
  
  def transactions_history(args = {})
    # Should print transactions, BUT NOT return the transaction array !
    if args.empty?
      puts "no password given"
      return nil
    elsif args[:password] == @password
      puts @transactions.dup
    else
      puts "wrong password"
      return nil
    end
  end
  
  def iban
    # Partial getter (should hide the middle of the IBAN like FR14**************606)
    @iban.dup[3..(@iban.length-4)] = "*****"
  end
  
  def to_s
    # Method used when printing account object as string (also used for string interpolation)
    "Name: #{@name}\nIban: #{iban}\nPosition: #{@position}"
  end
          
  private  
  
  def add_transaction(amount)
    # Main account logic
    # Should add the amount in the transactions array
    # Should update the current position
    @transactions << Transaction.new(amount)
    @position += amount
  end
    
end

# TESTING YOUR BANK ACCOUNT

# In the outside world, create a new account for Bruce Lee
account = BankAccount.new("Bruce Lee", "FR14-2004-1010-0505-0001-3M02-606", 200, "brucelit")

# Accessible infos
puts account.name # => Bruce Lee
puts account.iban # => FR14**************606
puts account.position # => 200

# Nicely print account's infos (over-riding #to_s)
puts account  # =>  Owner: Bruce Lee
              #     IBAN: FR14**************606
              #     Current amount: 200 euros

# Make some transactions
account.withdraw(515) # => You've just withdrawn 515 euros
account.deposit(100) # => You've just made a 100 euros deposit
account.deposit(650) # => You've just made a 650 euros deposit

# Print transactions history with password
account.transactions_history(password: "brucelit") # => [200, -515, 100, 650]
account.transactions_history(password: "brucewayne") # => wrong password
account.transactions_history() # => no password given


# Check current position
puts account.position == 435 # => true

# Un-comment the following to test custom exception
# too_small_deposit = BankAccount.new("Poor Billy", "FR14-2004-1010-0505-0001-3M02-606", 50, "toopoor")
