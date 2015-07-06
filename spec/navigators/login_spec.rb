require 'spec_helper'

describe Login do

  it "should enter to BancoEstado website", navigating: 'login' do
    navigate(rut_empresa: '763753034', rut_persona: '166607035', password: 'api182')
    expect(browser.frame(name:'rtop').body.text.include? 'Cerrar Sesion').to be(true)
  end

end
