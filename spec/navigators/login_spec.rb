require 'spec_helper'

describe Login do

  it "should enter BancoEstado's website", navigating: 'login' do
    navigate(company_rut: ENV['COMPANY_RUT'], rut: ENV['RUT'], password: ENV['password'])
    browser.frame(name:'rtop').wait_until_present
    expect(browser.frame(name:'rtop').body.text.include? 'Cerrar Sesion').to be(true)
  end

end
