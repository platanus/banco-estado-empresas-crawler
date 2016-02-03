require 'spec_helper'

describe CuentaCorriente do
  before do
    navigate :login, company_rut: '762728382', rut: '192837283', password: 'notreal'
  end
  let!(:reducer) {spy_reducer CuentaCorrienteReducer}
  it "should get the balance sheet", navigating: 'login' do
    navigate
    expect(reducer.target.body.text).to include("Cartola Chequera Electrónica")
  end

end
