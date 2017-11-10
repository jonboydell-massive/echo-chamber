const express = require('express')
const app = express()
const http = require('http')
const bodyParser = require('body-parser')

app.use(bodyParser.json())
app.use(bodyParser.urlencoded({ extended: false }))

const echo = (req, res) => {
  const request = {}
  request.headers = req.headers
  request.body = req.body
  res.status(200).json(request)
}

app.get('/*', (req, res) => {
  echo(req, res)
})

app.post('/*', (req, res) => {
  echo(req, res)
})

const httpServer = http.createServer(app)

const startServer = (server, port) => {
  const normalisedPort = port
  server.listen(normalisedPort)
  server.on('error', (error) => { throw error })
  server.on('listening', () => { console.log(`Server init: started HTTP server on port ${httpServer.address().port}`) })
}

startServer(httpServer, 3000)
