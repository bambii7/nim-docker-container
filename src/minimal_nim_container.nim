import asynchttpserver, asyncdispatch
import os
import db_postgres

var server = newAsyncHttpServer()

# proc queryDB():string =
#   try:
#     let db = open("", "", "", "dbname=POSTGRES host=172.17.0.0/16 port=5432")
#     let query = db.prepare("Get PG Version", sql"SELECT version();", 0)
#     result = db.getValue(query)
#   except:
#     result = "No DB Found"

proc callback(req: Request) {.async.} =
  # let dbResult = queryDB()
  # let envMessage = getEnv("MESSAGE", "no message")

  let response = "Nim says Hello Worldzzz! \n"
  await req.respond(Http200, response)

waitFor server.serve(Port(80), callback)