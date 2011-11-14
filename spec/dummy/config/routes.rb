DummyApp::Application.routes.draw do
  match '/my/hello' => 'my#hello', :as => :hello
end
