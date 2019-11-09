import asynchttpserver, asyncdispatch
import os

var server = newAsyncHttpServer()
proc cb(req: Request) {.async.} =
  let envMessage = getEnv("MESSAGE", "no message")
  let response = "Nim says Hello World!" & envMessage
  await req.respond(Http200, response)

waitFor server.serve(Port(8080), cb)