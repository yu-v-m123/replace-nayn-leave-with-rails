#!/bin/bash
set -e

rm -f /api/tmp/pids/server.pid

rails db:create RAILS_ENV=production
rails db:migrate RAILS_ENV=production

exec "$@"
