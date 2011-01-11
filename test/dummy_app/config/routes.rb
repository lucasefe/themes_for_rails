DummyApp::Application.routes.draw do

  themes_for_rails

  resource :products

  match ':controller(/:action(/:id(.:format)))'

  root to: 'Products#index'

end
