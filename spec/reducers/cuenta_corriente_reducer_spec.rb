require 'spec_helper'

describe CuentaCorrienteReducer do

  it "should output a list of transactions", reducing: 'balance_sheet', live: true do
    expect(reducer.transactions.count).to be > 0
  end

end
