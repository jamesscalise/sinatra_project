require './config/environment'


use Rack::MethodOverride
run App
use UsersController

