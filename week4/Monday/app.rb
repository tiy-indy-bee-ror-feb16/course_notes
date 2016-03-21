require 'sinatra'

get '/current_time' do
  Time.now.to_s
end

get '/say/hello' do
  "<h1>Hello</h1>"
end

get '/say_hello_to/:first_name/?:last_name?' do |first_name, last_name|
  @full_name = [first_name, last_name].join(" ")
  @greeting = params["howdy"] ? "Howdy" : "Hi"
  erb :index
end

get '/our_class' do
  @students = %w(James Matt Seth Kurt Ryder).shuffle
  erb :students
end

post '/search' do
  starter = case params["search_engine"]
  when "google"
    "https://www.google.com/#q="
  when "bing"
    "http://www.bing.com/search?q="
  else
    "https://www.google.com/#q="
  end
  redirect starter + params['query']
end

get '/:user/status/:id' do
  students = %w(James Matt Seth Kurt Ryder)
  erb :index, locals: {full_name: students[params['id'].to_i]}
end
