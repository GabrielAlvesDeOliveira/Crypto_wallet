class WelcomeController < ApplicationController
  def index
    cookies[:curso] = "Curso de Ruby on Rails - Gabriel Alves Cookies"
    session[:curso] = "Curso de Ruby on Rails - Gabriel Alves Sessions"
    @nome = params[:nome]
    @curso = params[:curso]
  end
end
