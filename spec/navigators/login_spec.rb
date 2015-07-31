require 'spec_helper'

describe Login do

  it "should enter BancoEstado's website", navigating: 'login' do
    navigate(company_rut: '763753034', rut: '166607035', password: '123456')
    browser.frame(name:'rtop').wait_until_present
    expect(browser.frame(name:'rtop').body.text.include? 'Cerrar Sesion').to be(true)
  end

end
