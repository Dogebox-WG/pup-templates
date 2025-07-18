const http = require('http');

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  res.end("<div style='text-align: center; font-size: 2em; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);'>This is my Node.js Pup</div>");
});

server.listen(8080, '0.0.0.0', () => {
  console.log('Server running at http://0.0.0.0:8080/');
}); 