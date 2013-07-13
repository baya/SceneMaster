Ground do

  # root
  get '/', Index
  
  # session
  get   '/sign_up', Session::SignForm
  post  '/sign_up', Session::SignUp
  post  '/login',   Session::Login
  get   '/login',   Session::LoginForm
  match '/logout',  Session::Logout

  # scene
  get  '/scenes',           Scene::Index
  post '/scene',            Scene::Create
  get  '/scene/new',        Scene::New
  get  '/scene/:id',        Scene::Show
  get  '/scene/:id/edit',   Scene::Edit
  post '/scene/:id/update', Scene::Update

  # activity
  post '/activity',        Activity::Create
  post '/activity/delete', Activity::Delete
  post '/activity/update', Activity::Update

  # sort_array
  post '/sort_array/save', SortArray::Save

  # my
  get '/my/scenes', My::Scenes

  # ab
  get '/ab', Benchmark::Hello

end

