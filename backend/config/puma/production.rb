environment "production"

# スレッド数とWorker数の指定
threads 5, 5
workers 2
preload_app!

# UNIXドメインソケット
app_root = File.expand_path("../..", __FILE__)
bind "unix://#{app_root}/tmp/sockets/puma.sock"

# デーモン化の設定
daemonize

pidfile "#{app_root}/pids/puma.pid"
stdout_redirect "#{app_root}/log/puma.stdout.log", "#{app_root}/log/puma.stderr.log", true

plugin :tmp_restart

# puma_worker_killerの設定をする
