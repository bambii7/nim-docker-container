import asynchttpserver, asyncdispatch
import os
import db_postgres

var server = newAsyncHttpServer()

proc callback(req: Request) {.async.} =
  let db = open("localhost", "", "", "awesome_sauce")
  let query = db.prepare("Get PG Version", sql"SELECT version();", 0)
  let dbResult = db.getValue(query)

  let envMessage = getEnv("MESSAGE", "no message")

  let response = "Nim says Hello World! \n" & envMessage & "\n" & $dbResult
  await req.respond(Http200, response)

waitFor server.serve(Port(8080), callback)