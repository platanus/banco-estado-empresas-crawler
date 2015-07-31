require 'spec_helper'

describe CuentaCorriente do
  before do
    navigate :login, rut_empresa: '763753034', rut_persona: '166607035', password: 'api182'
  end
  let!(:reducer) {spy_reducer CuentaCorrienteReducer}
  it "should get the balance sheet", navigating: 'login' do
    navigate
    expect(reducer.target.body.text).to include("Cartola Chequera Electrónica")
  end

end
