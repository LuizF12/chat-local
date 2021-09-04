require 'socket'
require 'colorize'


#classe para mudar o nome do usuário
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

#cria um tcp server
server = TCPServer.open("localhost",8000)

#aceita a conexão com o client (client.rb)
client = server.accept
client.send(nome, 10000)#envia o nome para o client
client.recvfrom(10000)#recebe o nome do client


loop do
  msgClient = client.recvfrom(10000)#recebe a mensagem do client
  puts msgClient


  msg = gets.chomp#envia uma mensagem ao client
  if msg.eql?("quit")
    client.close()
  else
    client.puts "#{nome}: #{msg}"
  end
end