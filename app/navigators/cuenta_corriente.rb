class CuentaCorriente < Crabfarm::BaseNavigator

  def run
    menu = browser.frame(name:'left')
    drop_link = menu.div(id:'ntMenu0d').link(class:'clsMainNode')
    drop_link.click
    balance_link = menu.div(id:'ntMenu2d').link(class:'clsSubNode')
    balance_link.click

    reduce_with_defaults browser.frame(name:'main')
  end

end

