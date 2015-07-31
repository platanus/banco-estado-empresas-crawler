class Login < Crabfarm::BaseNavigator

  def run
    # Add some navigation code here.
    browser.goto 'www.bancoestado.cl'

    forget_radio = browser.radio(id: 'opc_no')
    forget_radio.set

    empresas_link = browser.link(class: 'btn_empresas')
    empresas_link.click

    login_button = wait_until_present(browser.frame(id:'mainFrame').div(id:'sidebar1').link(class: 'naranjo'))
    login_button.click

    empresas_frame = wait_until_present(browser.frame(id:'mainFrame').div(id:'sidebar1').iframe)

    empresas_frame.text_field(id: 'CustPermIDAux').set(params[:rut_empresa])
    empresas_frame.text_field(id: 'CustLoginIDAux').set(params[:rut_persona])
    empresas_frame.text_field(id: 'SignonPswdAux').set(params[:password])

    empresas_frame.button(id: 'enviar').click
  end

  def wait_until_present(element)
    element.wait_until_present
    element
  end
end

