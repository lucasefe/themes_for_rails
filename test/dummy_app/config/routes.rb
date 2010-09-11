DummyApp::Application.routes.draw do
  themes_for_rails
  match ':controller(/:action(/:id(.:format)))'
end
