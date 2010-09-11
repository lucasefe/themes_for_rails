DummyApp::Application.routes.draw do
  theme_support
  match ':controller(/:action(/:id(.:format)))'
end
