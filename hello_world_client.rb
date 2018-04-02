$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'grpc'
require 'hello_world_services_pb'

def main
  stub = HelloWorldServer::Stub.new('localhost:8080', :this_channel_is_insecure)
  print "your response #{stub.say_hello(HelloRequest.new(name: "Sahil")).helloMyessage}"
end

main
