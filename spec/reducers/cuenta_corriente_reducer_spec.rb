require 'spec_helper'

describe CuentaCorrienteReducer do

  it "should output a list of transactions", reducing: 'cuenta_corriente', live: true do
    expect(reducer.transactions.count).to be > 0
  end

  it "should parse the date", reducing: 'cuenta_corriente' do
    expect(reducer.transactions[0].date).to eq(Date.new(2015,5,13))
  end

  it "should parse the description", reducing: 'cuenta_corriente' do
    expect(reducer.transactions[0].description).to eq('TRANSFERENCIA FONDOS INTERNET')
  end

  it "should set value when is positive", reducing: 'cuenta_corriente' do
    expect(reducer.transactions[0].amount).to eq(100)
  end

  it "should set value when is negative", reducing: 'cuenta_corriente' do
    expect(reducer.transactions[3].amount).to eq(-52995)
  end

  it "should set signature as null", reducing: 'cuenta_corriente' do
    expect(reducer.transactions[0].signature).to eq(nil)
  end

  it "should get the balance", reducing: 'cuenta_corriente', live:'true' do
    expect(reducer.transactions[1].balance).to eq(50100.0)
  end
end
