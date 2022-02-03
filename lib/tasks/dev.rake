namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      
      show_spinner("Apagando bd") { %x(rails db:drop) }
      show_spinner("Criando bd") {%x(rails db:create)}
      show_spinner("Migrando bd") {%x(rails db:migrate)}
      show_spinner("Populando bd") {%x(rails db:seed)}
    
    else
      puts "Você não está no modo de desenvolvimento"
    end
  end
  
  private
  
  def show_spinner(msg_start, msg_end = "Concluido")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("#{msg_end}")
  end

end
