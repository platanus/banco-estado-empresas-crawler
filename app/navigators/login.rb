class Login < Crabfarm::BaseNavigator

  def run
    # Add some navigation code here.
    browser.goto 'https://www.bancoestado.cl/imagenes/empresas2008/Acceso_empresas/acceso_clientes.html'


    empresas_frame = wait_until_present(browser.div(id:'sidebar1').iframe)

    empresas_frame.text_field(id: 'CustPermIDAux').set(params[:company_rut])
    empresas_frame.text_field(id: 'CustLoginIDAux').set(params[:rut])
    empresas_frame.text_field(id: 'SignonPswdAux').set(params[:password])

    empresas_frame.button(id: 'enviar').click
  end

  def wait_until_present(element)
    element.wait_until_present
    element
  end
end

