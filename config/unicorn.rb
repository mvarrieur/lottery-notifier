if ENV["RAILS_ENV"] == "production"
  worker_processes 3
else
  worker_processes 1
end
timeout 30