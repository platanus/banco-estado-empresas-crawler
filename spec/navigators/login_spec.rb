require 'spec_helper'

describe Login do

  it "should enter BancoEstado's website", navigating: 'login' do
    navigate(rut_empresa: '763753034', rut_persona: '166607035', password: '123456')
    browser.frame(name:'rtop').wait_until_present
    expect(browser.frame(name:'rtop').body.text.include? 'Cerrar Sesion').to be(true)
  end

end
