#!/bin/bash
set -e

rm -f /api/tmp/pids/server.pid

bundle exec rails db:create # 初回起動時のみ
bundle exec rails db:migrate
bundle exec rails db:seed
bundle exec rails s -p 3001 -b '0.0.0.0'

exec "$@"
