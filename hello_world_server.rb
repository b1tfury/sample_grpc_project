$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'grpc'
require 'hello_world_services_pb'

class HellWorldServer < HelloWorldServer::Service
  def say_hello(say_hello_request, _unused_call)
    return HelloResponse.new(helloMessage: "Hello, how are you #{say_hello_request.name}")
  end
end


def main
  s = GRPC::RpcServer.new
  s.add_http2_port('0.0.0.0:8080', :this_port_is_insecure)
  s.handle(HellWorldServer)
  s.run_till_terminated
end

main
