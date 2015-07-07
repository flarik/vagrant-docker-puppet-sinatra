#!/usr/bin/env bash
#
#

/usr/local/bin/gosu postgres createuser sinatra
/usr/local/bin/gosu postgres createdb sinatra --owner=sinatra
/usr/local/bin/goso postgres psql -c "ALTER USER sinatra WITH PASSWORD  'sinatra';"
