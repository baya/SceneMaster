# session
get   '/sign_up', Session::SignForm
post  '/sign_up', Session::SignUp
post  '/login',   Session::Login
get   '/login',   Session::LoginForm
match '/logout',  Session::Logout

# scene
get  '/scenes',    Scene::Index
post '/scene',     Scene::Create
get  '/scene/new', Scene::New
get  '/scene/:id', Scene::Show

# activity
post '/activity', Activity::Create

