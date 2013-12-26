include_recipe 'cron::default'

cron 'audit_logs_sync' do
  minute '00'
  hour '30'
  command "s3cmd sync /var/log/td-agent/log_entries.raw_data.*.gz s3://audit-logs-#{node.chef_environment}/archive"
end
