import asynchttpserver, asyncdispatch

let server = newAsyncHttpServer()

proc callback(req: Request) {.async.} =
  await req.respond(Http200, "Nim says Hello World!")

waitFor server.serve(Port(80), callback)