require 'socket'
require 'colorize'


class Pessoa
  attr_reader :nome
  
  def initialize(n)
    @nome = n
  end
end

puts "qual é o seu nome".green
nomep = gets.chomp
pessoa = Pessoa.new("#{nomep}")
nome = pessoa.nome


#limpa a tela
sleep 0.5
system("clear")

#abre a conexão com o servidor (server.rb)
server = TCPSocket.open('localhost',8000)
nomeC = server.send(nome, 10000)
nomeS = server.recvfrom(10000)


loop do
  msg = gets.chomp
  server.puts "#{nome}: #{msg}"
  resposta = server.recvfrom(10000)
  puts resposta
end

#leia os comentários do server.rb
#estou com preguiça de fazer os comentários dnv kkkk
