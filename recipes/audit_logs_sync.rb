include_recipe 'cron::default'

cron 'audit_logs_sync' do
  minute '30'
  hour '00'
  command "s3cmd sync /var/log/td-agent/log_entries.raw_data.*.gz s3://audit-logs-#{node.chef_environment}/archive"
end

cron 'audit_logs_purge' do
  minute '00'
  hour '01'
  command 'find /var/logs/td-agent/log_entries.*.gz -mtime +90 -exec rm {} \;'
end
