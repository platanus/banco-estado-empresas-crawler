require 'date'
class CuentaCorrienteReducer < Crabfarm::BaseReducer

  has_array :transactions

  def run
    rows = css('#AutoNumber6 #AutoNumber8 tr')
    rows.each do |tx|
      next if tx.css('.c3').count == 0 || tx.css('.c3:first-child').text == ""
      t = Transaction.new
      t.signature = nil #tx.css('.c3:first-child').text
      t.description = tx.css('.c3:nth-child(2)').text
      t.amount = t.signed_amount(tx.css('.c3:nth-child(4)').text, tx.css('.c3:nth-child(5)').text)
      t.date = Date.strptime(tx.css('.c3:nth-child(6)').text, '%d/%m/%Y')
      t.balance = tx.css('.c3:nth-child(7)').text.gsub(/[^0-9]*/,"").to_i || ""
      self.transactions.push(t)
    end
  end

end

