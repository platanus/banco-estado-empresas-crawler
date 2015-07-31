class CuentaCorrienteReducer < Crabfarm::BaseReducer

  has_array :transactions

  def run
    rows = css('#AutoNumber6 #AutoNumber8 tr')
    rows.each do |tx|
      next if tx.css('.c3').count == 0 || tx.css('.c3:first-child').text == ""
      object = {
        id: tx.css('.c3:first-child').text,
        description: tx.css('.c3:nth-child(2)').text,
        office: tx.css('.c3:nth-child(3)').text,
        date: tx.css('.c3:nth-child(5)').text,
        amount: tx.css('.c3:nth-child(6)').text
      }
      self.transactions.push(object)
    end
  end

end

