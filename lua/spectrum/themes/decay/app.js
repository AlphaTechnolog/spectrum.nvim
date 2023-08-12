import http from 'http'

const server = http.createServer((req, res) => {
  res.statusCode = 200
  res.setHeader("Content-Type", "application/json")
  res.end(JSON.stringify({ hello: 'world' }))
})

server.listen(8000, () => {
  console.log("Server is listening on port 8000")
})
