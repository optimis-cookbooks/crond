include_recipe "cron::default"

cron "update_in_period" do
  
  user "devel"
  path "/usr/local/rbenv/shims:/usr/local/bin:/usr/bin:/bin:$PATH"
  minute "01"
  command "cd /var/www/datawrangler;RACK_ENV=#{node[:datawrangler][:rack_env]} bundle exec rake update_in_period period=hourly"
end
