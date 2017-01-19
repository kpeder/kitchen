control 'operating_system' do
 describe command('cat /etc/issue | grep Ubuntu | awk \'{print $1}\'') do
  its('stdout') { should match (/Ubuntu/) }
 end
end
