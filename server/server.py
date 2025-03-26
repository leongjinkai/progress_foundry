from http.server import SimpleHTTPRequestHandler
import socketserver

PORT = 9000
DIRECTORY = "build/web"

class MyRequestHandler(SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=DIRECTORY, **kwargs)
        
    def do_GET(self):
        if '.' not in self.path:
            self.path = '/'
        return SimpleHTTPRequestHandler.do_GET(self)

server = socketserver.TCPServer(('', PORT), MyRequestHandler)
print("Serving at PORT : " + str(PORT))
server.serve_forever()