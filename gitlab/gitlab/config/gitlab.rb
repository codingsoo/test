## GitLab configuration settings
##! This file is generated during initial installation and **is not** modified
##! during upgrades.
##! Check out the latest version of this file to know about the different
##! settings that can be configured by this file, which may be found at:
##! https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/files/gitlab-config-template/gitlab.rb.template


## GitLab URL
##! URL on which GitLab will be reachable.
##! For more details on configuring external_url see:
##! https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab
# external_url 'GENERATED_EXTERNAL_URL'

## Legend
##! The following notations at the beginning of each line may be used to
##! differentiate between components of this file and to easily select them using
##! a regex.
##! ## Titles, subtitles etc
##! ##! More information - Description, Docs, Links, Issues etc.
##! Configuration settings have a single # followed by a single space at the
##! beginning; Remove them to enable the setting.

##! **Configuration settings below are optional.**
##! **The values currently assigned are only examples and ARE NOT the default
##!   values.**


################################################################################
################################################################################
##                Configuration Settings for GitLab CE and EE                 ##
################################################################################
################################################################################

################################################################################
## gitlab.yml configuration
##! Docs: https://gitlab.com/gitlab-org/omnibus-gitlab/blob/master/doc/settings/gitlab.yml.md
################################################################################
# gitlab_rails['gitlab_ssh_host'] = 'ssh.host_example.com'
# gitlab_rails['time_zone'] = 'UTC'

### Email Settings
# gitlab_rails['gitlab_email_enabled'] = true
# gitlab_rails['gitlab_email_from'] = 'example@example.com'
# gitlab_rails['gitlab_email_display_name'] = 'Example'
# gitlab_rails['gitlab_email_reply_to'] = 'noreply@example.com'
# gitlab_rails['gitlab_email_subject_suffix'] = ''

### GitLab user privileges
# gitlab_rails['gitlab_default_can_create_group'] = true
# gitlab_rails['gitlab_username_changing_enabled'] = true

### Default Theme
# gitlab_rails['gitlab_default_theme'] = 2

### Default project feature settings
# gitlab_rails['gitlab_default_projects_features_issues'] = true
# gitlab_rails['gitlab_default_projects_features_merge_requests'] = true
# gitlab_rails['gitlab_default_projects_features_wiki'] = true
# gitlab_rails['gitlab_default_projects_features_snippets'] = false
# gitlab_rails['gitlab_default_projects_features_builds'] = true
# gitlab_rails['gitlab_default_projects_features_container_registry'] = true

### Automatic issue closing
###! See https://docs.gitlab.com/ce/customization/issue_closing.html for more
###! information about this pattern.
# gitlab_rails['gitlab_issue_closing_pattern'] = "((?:[Cc]los(?:e[sd]?|ing)|[Ff]ix(?:e[sd]|ing)?|[Rr]esolv(?:e[sd]?|ing))(:?) +(?:(?:issues? +)?%{issue_ref}(?:(?:, *| +and +)?)|([A-Z][A-Z0-9_]+-\d+))+)"

### Download location
###! When a user clicks e.g. 'Download zip' on a project, a temporary zip file
###! is created in the following directory.
# gitlab_rails['gitlab_repository_downloads_path'] = 'tmp/repositories'

### Gravatar Settings
# gitlab_rails['gravatar_plain_url'] = 'http://www.gravatar.com/avatar/%{hash}?s=%{size}&d=identicon'
# gitlab_rails['gravatar_ssl_url'] = 'https://secure.gravatar.com/avatar/%{hash}?s=%{size}&d=identicon'

### Auxiliary jobs
###! Periodically executed jobs, to self-heal Gitlab, do external
###! synchronizations, etc.
###! Docs: https://github.com/ondrejbartas/sidekiq-cron#adding-cron-job
###!       https://docs.gitlab.com/ce/ci/yaml/README.html#artifacts:expire_in
# gitlab_rails['stuck_ci_builds_worker_cron'] = "0 0 * * *"
# gitlab_rails['expire_build_artifacts_worker_cron'] = "50 * * * *"
# gitlab_rails['repository_check_worker_cron'] = "20 * * * *"
# gitlab_rails['admin_email_worker_cron'] = "0 0 * * 0"
# gitlab_rails['repository_archive_cache_worker_cron'] = "0 * * * *"

### Webhook Settings
###! Number of seconds to wait for HTTP response after sending webhook HTTP POST
###! request (default: 10)
# gitlab_rails['webhook_timeout'] = 10

### Trusted proxies
###! Customize if you have GitLab behind a reverse proxy which is running on a
###! different machine.
###! **Add the IP address for your reverse proxy to the list, otherwise users
###!   will appear signed in from that address.**
# gitlab_rails['trusted_proxies'] = []

### Reply by email
###! Allow users to comment on issues and merge requests by replying to
###! notification emails.
###! Docs: https://docs.gitlab.com/ce/administration/reply_by_email.html
# gitlab_rails['incoming_email_enabled'] = true

#### Incoming Email Address
####! The email address including the `%{key}` placeholder that will be replaced
####! to reference the item being replied to.
####! **The placeholder can be omitted but if present, it must appear in the
####!   "user" part of the address (before the `@`).**
# gitlab_rails['incoming_email_address'] = "gitlab-incoming+%{key}@gmail.com"

#### Email account username
####! **With third party providers, this is usually the full email address.**
####! **With self-hosted email servers, this is usually the user part of the
####!   email address.**
# gitlab_rails['incoming_email_email'] = "gitlab-incoming@gmail.com"

#### Email account password
# gitlab_rails['incoming_email_password'] = "[REDACTED]"

#### IMAP Settings
# gitlab_rails['incoming_email_host'] = "imap.gmail.com"
# gitlab_rails['incoming_email_port'] = 993
# gitlab_rails['incoming_email_ssl'] = true
# gitlab_rails['incoming_email_start_tls'] = false

#### Incoming Mailbox Settings
####! The mailbox where incoming mail will end up. Usually "inbox".
# gitlab_rails['incoming_email_mailbox_name'] = "inbox"
####! The location where incoming mails will be logged.
# gitlab_rails['incoming_email_log_directory'] = "/var/log/gitlab/mailroom"

### Build Artifacts
# gitlab_rails['artifacts_enabled'] = true
# gitlab_rails['artifacts_path'] = "/mnt/storage/artifacts"

### Git LFS
# gitlab_rails['lfs_enabled'] = true
# gitlab_rails['lfs_storage_path'] = "/mnt/storage/lfs-objects"

### GitLab Mattermost
###! These settings are void if Mattermost is installed on the same omnibus
###! install
# gitlab_rails['mattermost_host'] = "https://mattermost.example.com"

### LDAP Settings
###! Docs: https://docs.gitlab.com/omnibus/settings/ldap.html
###! **Be careful not to break the indentation in the ldap_servers block. It is
###!   in yaml format and the spaces must be retained. Using tabs will not work.**

# gitlab_rails['ldap_enabled'] = false

###! **remember to close this block with 'EOS' below**
# gitlab_rails['ldap_servers'] = YAML.load <<-'EOS'
#   main: # 'main' is the GitLab 'provider ID' of this LDAP server
#     label: 'LDAP'
#     host: '_your_ldap_server'
#     port: 389
#     uid: 'sAMAccountName'
#     method: 'plain' # "tls" or "ssl" or "plain"
#     bind_dn: '_the_full_dn_of_the_user_you_will_bind_with'
#     password: '_the_password_of_the_bind_user'
#     active_directory: true
#     allow_username_or_email_login: false
#     block_auto_created_users: false
#     base: ''
#     user_filter: ''
#     attributes:
#       username: ['uid', 'userid', 'sAMAccountName']
#       email:    ['mail', 'email', 'userPrincipalName']
#       name:       'cn'
#       first_name: 'givenName'
#       last_name:  'sn'
#     ## EE only
#     group_base: ''
#     admin_group: ''
#     sync_ssh_keys: false
#
#   secondary: # 'secondary' is the GitLab 'provider ID' of second LDAP server
#     label: 'LDAP'
#     host: '_your_ldap_server'
#     port: 389
#     uid: 'sAMAccountName'
#     method: 'plain' # "tls" or "ssl" or "plain"
#     bind_dn: '_the_full_dn_of_the_user_you_will_bind_with'
#     password: '_the_password_of_the_bind_user'
#     active_directory: true
#     allow_username_or_email_login: false
#     block_auto_created_users: false
#     base: ''
#     user_filter: ''
#     attributes:
#       username: ['uid', 'userid', 'sAMAccountName']
#       email:    ['mail', 'email', 'userPrincipalName']
#       name:       'cn'
#       first_name: 'givenName'
#       last_name:  'sn'
#     ## EE only
#     group_base: ''
#     admin_group: ''
#     sync_ssh_keys: false
# EOS

### OmniAuth Settings
###! Docs: https://docs.gitlab.com/ce/integration/omniauth.html
# gitlab_rails['omniauth_enabled'] = false
# gitlab_rails['omniauth_allow_single_sign_on'] = ['saml']
# gitlab_rails['omniauth_auto_sign_in_with_provider'] = 'saml'
# gitlab_rails['omniauth_block_auto_created_users'] = true
# gitlab_rails['omniauth_auto_link_ldap_user'] = false
# gitlab_rails['omniauth_auto_link_saml_user'] = false
# gitlab_rails['omniauth_external_providers'] = ['twitter', 'google_oauth2']
# gitlab_rails['omniauth_providers'] = [
#   {
#     "name" => "google_oauth2",
#     "app_id" => "YOUR APP ID",
#     "app_secret" => "YOUR APP SECRET",
#     "args" => { "access_type" => "offline", "approval_prompt" => "" }
#   }
# ]

###! **If you setup Bitbucket importer under omniauth providers you will need to
###!   add the keys which will allow connection between Bitbucket and GitLab.**
###! Docs: https://docs.gitlab.com/ce/integration/bitbucket.html
# gitlab_rails['bitbucket'] = {
#  'known_hosts_key' => 'bitbucket.org,207.223.240.182 ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAubiN81eDcafrgMeLzaFPsw2kNvEcqTKl/VqLat/MaB33pZy0y3rJZtnqwR2qOOvbwKZYKiEO1O6VqNEBxKvJJelCq0dTXWT5pbO2gDXC6h6QDXCaHo6pOHGPUy+YBaGQRGuSusMEASYiWunYN0vCAI8QaXnWMXNMdFP3jHAJH0eDsoiGnLPBlBp4TNm6rYI74nMzgz3B9IikW4WVK+dc8KZJZWYjAuORU3jc1c/NPskD2ASinf8v3xnfXeukU0sJ5N6m5E8VLjObPEO+mN2t/FZTMZLiFqPWc/ALSqnMnnhwrNi2rbfg/rd/IpL8Le3pSBne8+seeFVBoGqzHM9yXw==',
#  'private_key' => '-----BEGIN RSA PRIVATE KEY-----
#   MIIEowIBAAKCAQEAyXxYHwz2KjcwSjTREwlhYHqrf/8U0UM8ej3cqQ551gE4Wo3t
#   -----END RSA PRIVATE KEY-----',
#  'public_key' => 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJfFgfDPYqN git@gitlab.example.com'
# }

### Backup Settings
###! Docs: https://docs.gitlab.com/omnibus/settings/backups.html

# gitlab_rails['manage_backup_path'] = true
# gitlab_rails['backup_path'] = "/var/opt/gitlab/backups"

###! Docs: https://docs.gitlab.com/ce/raketasks/backup_restore.html#backup-archive-permissions
# gitlab_rails['backup_archive_permissions'] = 0644

# gitlab_rails['backup_pg_schema'] = 'public'
# gitlab_rails['backup_keep_time'] = 604800
# gitlab_rails['backup_upload_connection'] = {
#   'provider' => 'AWS',
#   'region' => 'eu-west-1',
#   'aws_access_key_id' => 'AKIAKIAKI',
#   'aws_secret_access_key' => 'secret123'
# }
# gitlab_rails['backup_upload_remote_directory'] = 'my.s3.bucket'
# gitlab_rails['backup_multipart_chunk_size'] = 104857600

###! **Turns on AWS Server-Side Encryption with Amazon S3-Managed Keys for
###!   backups**
# gitlab_rails['backup_encryption'] = 'AES256'

### For setting up different data storing directory
###! Docs: https://docs.gitlab.com/omnibus/settings/configuration.html#storing-git-data-in-an-alternative-directory
###! **If you want to use a single non-default directory to store git data use a
###!   path that doesn't contain symlinks.**
# git_data_dirs({"default" => "/var/opt/gitlab/git-data"})

### For storing GitLab application uploads, eg. LFS objects, build artifacts
###! Docs: https://docs.gitlab.com/ce/development/shared_files.html
# gitlab_rails['shared_path'] = '/var/opt/gitlab/gitlab-rails/shared'


### DEPRECATED: gitlab_rails['satellites_timeout'] = 30

### GitLab Shell settings for GitLab
# gitlab_rails['gitlab_shell_ssh_port'] = 22
# gitlab_rails['git_max_size'] = 20971520
# gitlab_rails['git_timeout'] = 10

### Extra customization
# gitlab_rails['extra_google_analytics_id'] = '_your_tracking_id'
# gitlab_rails['extra_piwik_url'] = '_your_piwik_url'
# gitlab_rails['extra_piwik_site_id'] = '_your_piwik_site_id'

##! Docs: https://docs.gitlab.com/omnibus/settings/environment-variables.html
# gitlab_rails['env'] = {
#   'BUNDLE_GEMFILE' => "/opt/gitlab/embedded/service/gitlab-rails/Gemfile",
#   'PATH' => "/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin"
# }

# gitlab_rails['rack_attack_git_basic_auth'] = {
#   'enabled' => true,
#   'ip_whitelist' => ["127.0.0.1"],
#   'maxretry' => 10,
#   'findtime' => 60,
#   'bantime' => 3600
# }

# gitlab_rails['rack_attack_protected_paths'] = [
#   '/users/password',
#   '/users/sign_in',
#   '/api/#{API::API.version}/session.json',
#   '/api/#{API::API.version}/session',
#   '/users',
#   '/users/confirmation',
#   '/unsubscribes/',
#   '/import/github/personal_access_token'
# ]

###! **We do not recommend changing these directories.**
# gitlab_rails['dir'] = "/var/opt/gitlab/gitlab-rails"
# gitlab_rails['log_directory'] = "/var/log/gitlab/gitlab-rails"

### GitLab application settings
# gitlab_rails['uploads_directory'] = "/var/opt/gitlab/gitlab-rails/uploads"
# gitlab_rails['rate_limit_requests_per_period'] = 10
# gitlab_rails['rate_limit_period'] = 60

#### Change the initial default admin password and shared runner registraion tokens.
####! **Only applicable on initial setup, changing these settings after database
####!   is created and seeded won't yield any change.**
# gitlab_rails['initial_root_password'] = "password"
# gitlab_rails['initial_shared_runners_registration_token'] = "token"

#### Enable or disable automatic database migrations
# gitlab_rails['auto_migrate'] = true

#### This is advanced feature used by large gitlab deployments where loading
#### whole RAILS env takes a lot of time.
# gitlab_rails['rake_cache_clear'] = true

### GitLab database settings
###! Docs: https://docs.gitlab.com/omnibus/settings/database.html
###! **Only needed if you use an external database.**
# gitlab_rails['db_adapter'] = "postgresql"
# gitlab_rails['db_encoding'] = "unicode"
# gitlab_rails['db_collation'] = nil
# gitlab_rails['db_database'] = "gitlabhq_production"
# gitlab_rails['db_pool'] = 10
# gitlab_rails['db_username'] = "gitlab"
# gitlab_rails['db_password'] = nil
# gitlab_rails['db_host'] = nil
# gitlab_rails['db_port'] = 5432
# gitlab_rails['db_socket'] = nil
# gitlab_rails['db_sslmode'] = nil
# gitlab_rails['db_sslrootcert'] = nil


### GitLab Redis settings
###! Connect to your own Redis instance
###! Docs: https://docs.gitlab.com/omnibus/settings/redis.html

#### Redis TCP connection
# gitlab_rails['redis_host'] = "127.0.0.1"
# gitlab_rails['redis_port'] = 6379
# gitlab_rails['redis_password'] = nil
# gitlab_rails['redis_database'] = 0

#### Redis local UNIX socket (will be disabled if TCP method is used)
# gitlab_rails['redis_socket'] = "/var/opt/gitlab/redis/redis.socket"

#### Sentinel support
####! To have Sentinel working, you must enable Redis TCP connection support
####! above and define a few Sentinel hosts below (to get a reliable setup
####! at least 3 hosts).
####! **You don't need to list every sentinel host, but the ones not listed will
####!   not be used in a fail-over situation to query for the new master.**
# gitlab_rails['redis_sentinels'] = [
#   {'host' => '127.0.0.1', 'port' => 26379},
# ]

### GitLab email server settings
###! Docs: https://docs.gitlab.com/omnibus/settings/smtp.html
###! **Use smtp instead of sendmail/postfix.**

# gitlab_rails['smtp_enable'] = true
# gitlab_rails['smtp_address'] = "smtp.server"
# gitlab_rails['smtp_port'] = 465
# gitlab_rails['smtp_user_name'] = "smtp user"
# gitlab_rails['smtp_password'] = "smtp password"
# gitlab_rails['smtp_domain'] = "example.com"
# gitlab_rails['smtp_authentication'] = "login"
# gitlab_rails['smtp_enable_starttls_auto'] = true
# gitlab_rails['smtp_tls'] = false

###! **Can be: 'none', 'peer', 'client_once', 'fail_if_no_peer_cert'**
###! Docs: http://api.rubyonrails.org/classes/ActionMailer/Base.html
# gitlab_rails['smtp_openssl_verify_mode'] = 'none'

# gitlab_rails['smtp_ca_path'] = "/etc/ssl/certs"
# gitlab_rails['smtp_ca_file'] = "/etc/ssl/certs/ca-certificates.crt"

################################################################################
## Container Registry settings
##! Docs: https://docs.gitlab.com/ce/administration/container_registry.html
################################################################################

# registry_external_url 'https://registry.gitlab.example.com'

### Settings used by GitLab application
# gitlab_rails['registry_enabled'] = true
# gitlab_rails['registry_host'] = "registry.gitlab.example.com"
# gitlab_rails['registry_port'] = "5005"
# gitlab_rails['registry_path'] = "/var/opt/gitlab/gitlab-rails/shared/registry"

###! **Do not change the following 3 settings unless you know what you are
###!   doing**
# gitlab_rails['registry_api_url'] = "http://localhost:5000"
# gitlab_rails['registry_key_path'] = "/var/opt/gitlab/gitlab-rails/certificate.key"
# gitlab_rails['registry_issuer'] = "omnibus-gitlab-issuer"

### Settings used by Registry application
# registry['enable'] = true
# registry['username'] = "registry"
# registry['group'] = "registry"
# registry['uid'] = nil
# registry['gid'] = nil
# registry['dir'] = "/var/opt/gitlab/registry"
# registry['registry_http_addr'] = "localhost:5000"
# registry['debug_addr'] = "localhost:5001"
# registry['log_directory'] = "/var/log/gitlab/registry"
# registry['log_level'] = "info"
# registry['rootcertbundle'] = "/var/opt/gitlab/registry/certificate.crt"
# registry['storage_delete_enabled'] = true

### Registry backend storage
###! Docs: https://docs.gitlab.com/ce/administration/container_registry.html#container-registry-storage-driver
# registry['storage'] = {
#   's3' => {
#     'accesskey' => 'AKIAKIAKI',
#     'secretkey' => 'secret123',
#     'bucket' => 'gitlab-registry-bucket-AKIAKIAKI'
#   }
# }


################################################################################
## GitLab Workhorse
##! Docs: https://gitlab.com/gitlab-org/gitlab-workhorse/blob/master/README.md
################################################################################

# gitlab_workhorse['enable'] = true
# gitlab_workhorse['ha'] = false
# gitlab_workhorse['listen_network'] = "unix"
# gitlab_workhorse['listen_umask'] = 000
# gitlab_workhorse['listen_addr'] = "/var/opt/gitlab/gitlab-workhorse/socket"
# gitlab_workhorse['auth_backend'] = "http://localhost:8080"

##! the empty string is the default in gitlab-workhorse option parser
# gitlab_workhorse['auth_socket'] = "''"

##! put an empty string on the command line
# gitlab_workhorse['pprof_listen_addr'] = "''"

##! put an empty string on the command line
# gitlab_workhorse['prometheus_listen_addr'] = "''"

# gitlab_workhorse['dir'] = "/var/opt/gitlab/gitlab-workhorse"
# gitlab_workhorse['log_directory'] = "/var/log/gitlab/gitlab-workhorse"
# gitlab_workhorse['proxy_headers_timeout'] = "1m0s"

##! limit number of concurrent API requests, defaults to 0 which is unlimited
# gitlab_workhorse['api_limit'] = 0

##! limit number of API requests allowed to be queued, defaults to 0 which
##! disables queuing
# gitlab_workhorse['api_queue_limit'] = 0

##! duration after which we timeout requests if they sit too long in the queue
# gitlab_workhorse['api_queue_duration'] = "30s"

# gitlab_workhorse['env'] = {
#   'PATH' => "/opt/gitlab/bin:/opt/gitlab/embedded/bin:/bin:/usr/bin"
# }

################################################################################
## GitLab User Settings
##! Modify default git user.
##! Docs: https://docs.gitlab.com/omnibus/settings/configuration.html#changing-the-name-of-the-git-user-group
################################################################################

# user['username'] = "git"
# user['group'] = "git"
# user['uid'] = nil
# user['gid'] = nil

##! The shell for the git user
# user['shell'] = "/bin/sh"

##! The home directory for the git user
# user['home'] = "/var/opt/gitlab"

# user['git_user_name'] = "GitLab"
# user['git_user_email'] = "gitlab@#{node['fqdn']}"

################################################################################
## GitLab Unicorn
##! Tweak unicorn settings.
##! Docs: https://docs.gitlab.com/omnibus/settings/unicorn.html
################################################################################

# unicorn['worker_timeout'] = 60
###! Minimum worker_processes is 2 at this moment
###! See https://gitlab.com/gitlab-org/gitlab-ce/issues/18771
# unicorn['worker_processes'] = 2

### Advanced settings
# unicorn['listen'] = '127.0.0.1'
# unicorn['port'] = 8080
# unicorn['socket'] = '/var/opt/gitlab/gitlab-rails/sockets/gitlab.socket'
# unicorn['pidfile'] = '/opt/gitlab/var/unicorn/unicorn.pid'
# unicorn['tcp_nopush'] = true
# unicorn['backlog_socket'] = 1024

###! **Make sure somaxconn is equal or higher then backlog_socket**
# unicorn['somaxconn'] = 1024

###! **We do not recommend changing this setting**
# unicorn['log_directory'] = "/var/log/gitlab/unicorn"

### **Only change these settings if you understand well what they mean**
###! Docs: https://about.gitlab.com/2015/06/05/how-gitlab-uses-unicorn-and-unicorn-worker-killer/
###!       https://github.com/kzk/unicorn-worker-killer
# unicorn['worker_memory_limit_min'] = "400 * 1 << 20"
# unicorn['worker_memory_limit_max'] = "650 * 1 << 20"

################################################################################
## GitLab Sidekiq
################################################################################

# sidekiq['log_directory'] = "/var/log/gitlab/sidekiq"
# sidekiq['shutdown_timeout'] = 4
# sidekiq['concurrency'] = 25

################################################################################
## gitlab-shell
################################################################################

# gitlab_shell['audit_usernames'] = false
# gitlab_shell['log_level'] = 'INFO'
# gitlab_shell['http_settings'] = { user: 'username', password: 'password', ca_file: '/etc/ssl/cert.pem', ca_path: '/etc/pki/tls/certs', self_signed_cert: false}
# gitlab_shell['log_directory'] = "/var/log/gitlab/gitlab-shell/"
# gitlab_shell['custom_hooks_dir'] = "/opt/gitlab/embedded/service/gitlab-shell/hooks"

##! **If enabled, git-annex needs to be installed on the server where GitLab is
##!   setup.
##!   For Debian and Ubuntu systems this can be done with:
##!   `sudo apt-get install git-annex`.
##!   For CentOS:
##!   `sudo yum install epel-release && sudo yum install git-annex`**
# gitlab_shell['git_annex_enabled'] = false

# gitlab_shell['auth_file'] = "/var/opt/gitlab/.ssh/authorized_keys"

### Git trace log file.
###! If set, git commands receive GIT_TRACE* environment variables
###! Docs: https://git-scm.com/book/es/v2/Git-Internals-Environment-Variables#Debugging
###! An absolute path starting with / – the trace output will be appended to
###! that file. It needs to exist so we can check permissions and avoid
###! throwing warnings to the users.
# gitlab_shell['git_trace_log_file'] = "/var/log/gitlab/gitlab-shell/gitlab-shell-git-trace.log"

##! **We do not recommend changing this directory.**
# gitlab_shell['dir'] = "/var/opt/gitlab/gitlab-shell"

################################################################
## GitLab PostgreSQL
################################################################

# postgresql['enable'] = true
# postgresql['listen_address'] = nil
# postgresql['port'] = 5432
# postgresql['data_dir'] = "/var/opt/gitlab/postgresql/data"

##! **recommend value is 1/4 of total RAM, up to 14GB.**
# postgresql['shared_buffers'] = "256MB"

### Advanced settings
# postgresql['ha'] = false
# postgresql['dir'] = "/var/opt/gitlab/postgresql"
# postgresql['log_directory'] = "/var/log/gitlab/postgresql"
# postgresql['username'] = "gitlab-psql"
# postgresql['uid'] = nil
# postgresql['gid'] = nil
# postgresql['shell'] = "/bin/sh"
# postgresql['home'] = "/var/opt/gitlab/postgresql"
# postgresql['user_path'] = "/opt/gitlab/embedded/bin:/opt/gitlab/bin:$PATH"
# postgresql['sql_user'] = "gitlab"
# postgresql['sql_ci_user'] = "gitlab_ci"
# postgresql['max_connections'] = 200
# postgresql['md5_auth_cidr_addresses'] = []
# postgresql['trust_auth_cidr_addresses'] = []
# postgresql['shmmax'] =  17179869184 # or 4294967295
# postgresql['shmall'] =  4194304 # or 1048575
# postgresql['work_mem'] = "8MB"
# postgresql['maintenance_work_mem'] = "16MB"
# postgresql['effective_cache_size'] = "1MB"
# postgresql['checkpoint_segments'] = 10
# postgresql['checkpoint_timeout'] = "5min"
# postgresql['checkpoint_completion_target'] = 0.9
# postgresql['checkpoint_warning'] = "30s"
# postgresql['wal_buffers'] = "-1"
# postgresql['autovacuum'] = "on"
# postgresql['log_autovacuum_min_duration'] = "-1"
# postgresql['autovacuum_max_workers'] = "3"
# postgresql['autovacuum_naptime'] = "1min"
# postgresql['autovacuum_vacuum_threshold'] = "50"
# postgresql['autovacuum_analyze_threshold'] = "50"
# postgresql['autovacuum_vacuum_scale_factor'] = "0.02"
# postgresql['autovacuum_analyze_scale_factor'] = "0.01"
# postgresql['autovacuum_freeze_max_age'] = "200000000"
# postgresql['autovacuum_vacuum_cost_delay'] = "20ms"
# postgresql['autovacuum_vacuum_cost_limit'] = "-1"
# postgresql['statement_timeout'] = "0"
# postgresql['log_line_prefix'] = "%a"
# postgresql['track_activity_query_size'] = "1024"
# postgresql['shared_preload_libraries'] = nil

### Replication settings
# postgresql['sql_replication_user'] = "gitlab_replicator"
# postgresql['wal_level'] = "hot_standby"
# postgresql['max_wal_senders'] = 5
# postgresql['wal_keep_segments'] = 10
# postgresql['hot_standby'] = "off"
# postgresql['max_standby_archive_delay'] = "30s"
# postgresql['max_standby_streaming_delay'] = "30s"
# postgresql['max_replication_slots'] = 0
# postgresql['synchronous_commit'] = on
# postgresql['synchronous_standby_names'] = ''

# Backup/Archive settings
# default['gitlab']['postgresql']['archive_mode'] = "off"
# default['gitlab']['postgresql']['archive_command'] = nil
# default['gitlab']['postgresql']['archive_timeout'] = "60"

### Available in PostgreSQL 9.6 and later
# postgresql['min_wal_size'] = 80MB
# postgresql['max_wal_size'] = 1GB

################################################################################
## GitLab Redis
##! **Can be disabled if you are using your own Redis instance.**
##! Docs: https://docs.gitlab.com/omnibus/settings/redis.html
################################################################################

# redis['enable'] = true
# redis['username'] = "gitlab-redis"
# redis['maxclients'] = "10000"
# redis['tcp_timeout'] = "60"
# redis['tcp_keepalive'] = "300"
# redis['uid'] = nil
# redis['gid'] = nil

###! **To enable only Redis service in this machine, uncomment
###!   one of the lines below (choose master or slave instance types).**
###! Docs: https://docs.gitlab.com/omnibus/settings/redis.html
###!       https://docs.gitlab.com/ce/administration/high_availability/redis.html
# redis_master_role['enable'] = true
# redis_slave_role['enable'] = true

### Redis TCP support (will disable UNIX socket transport)
# redis['bind'] = '0.0.0.0' # or specify an IP to bind to a single one
# redis['port'] = 6379
# redis['password'] = 'redis-password-goes-here'

### Redis Sentinel support
###! **You need a master slave Redis replication to be able to do failover**
###! **Please read the documentation before enabling it to understand the
###!   caveats:**
###! Docs: https://docs.gitlab.com/ce/administration/high_availability/redis.html

### Replication support
#### Slave Redis instance
# redis['master'] = false # by default this is true

#### Slave and Sentinel shared configuration
####! **Both need to point to the master Redis instance to get replication and
####!   heartbeat monitoring**
# redis['master_name'] = 'gitlab-redis'
# redis['master_ip'] = nil
# redis['master_port'] = 6379

####! **Master password should have the same value defined in
####!   redis['password'] to enable the instance to transition to/from
####!   master/slave in a failover event.**
# redis['master_password'] = 'redis-password-goes-here'

####! Increase these values when your slaves can't catch up with master
# redis['client_output_buffer_limit_normal'] = '0 0 0'
# redis['client_output_buffer_limit_slave'] = '256mb 64mb 60'
# redis['client_output_buffer_limit_pubsub'] = '32mb 8mb 60'

################################################################################
## GitLab Web server
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#using-a-non-bundled-web-server
################################################################################

##! When bundled nginx is disabled we need to add the external webserver user to
##! the GitLab webserver group.
# web_server['external_users'] = []
# web_server['username'] = 'gitlab-www'
# web_server['group'] = 'gitlab-www'
# web_server['uid'] = nil
# web_server['gid'] = nil
# web_server['shell'] = '/bin/false'
# web_server['home'] = '/var/opt/gitlab/nginx'

################################################################################
## GitLab Nginx
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html
################################################################################

# nginx['enable'] = true
# nginx['client_max_body_size'] = '250m'
# nginx['redirect_http_to_https'] = false
# nginx['redirect_http_to_https_port'] = 80

##! Most root CA's are included by default
# nginx['ssl_client_certificate'] = "/etc/gitlab/ssl/ca.crt"

##! enable/disable 2-way SSL client authentication
# nginx['ssl_verify_client'] = "off"

##! if ssl_verify_client on, verification depth in the client certificates chain
# nginx['ssl_verify_depth'] = "1"

# nginx['ssl_certificate'] = "/etc/gitlab/ssl/#{node['fqdn']}.crt"
# nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/#{node['fqdn']}.key"
# nginx['ssl_ciphers'] = "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256"
# nginx['ssl_prefer_server_ciphers'] = "on"

##! **Recommended by: https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
##!                   https://cipherli.st/**
# nginx['ssl_protocols'] = "TLSv1 TLSv1.1 TLSv1.2"

##! **Recommended in: https://nginx.org/en/docs/http/ngx_http_ssl_module.html**
# nginx['ssl_session_cache'] = "builtin:1000  shared:SSL:10m"

##! **Default according to https://nginx.org/en/docs/http/ngx_http_ssl_module.html**
# nginx['ssl_session_timeout'] = "5m"

# nginx['ssl_dhparam'] = nil # Path to dhparams.pem, eg. /etc/gitlab/ssl/dhparams.pem
# nginx['listen_addresses'] = ['*', '[::]']

##! **Override only if you use a reverse proxy**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#setting-the-nginx-listen-port
# nginx['listen_port'] = nil

##! **Override only if your reverse proxy internally communicates over HTTP**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#supporting-proxied-ssl
# nginx['listen_https'] = nil

# nginx['custom_gitlab_server_config'] = "location ^~ /foo-namespace/bar-project/raw/ {\n deny all;\n}\n"
# nginx['custom_nginx_config'] = "include /etc/nginx/conf.d/example.conf;"
# nginx['proxy_read_timeout'] = 3600
# nginx['proxy_connect_timeout'] = 300
# nginx['proxy_set_headers'] = {
#  "Host" => "$http_host",
#  "X-Real-IP" => "$remote_addr",
#  "X-Forwarded-For" => "$proxy_add_x_forwarded_for",
#  "X-Forwarded-Proto" => "https",
#  "X-Forwarded-Ssl" => "on",
#  "Upgrade" => "$http_upgrade",
#  "Connection" => "$connection_upgrade"
# }
# nginx['proxy_cache_path'] = 'proxy_cache keys_zone=gitlab:10m max_size=1g levels=1:2'
# nginx['proxy_cache'] = 'gitlab'
# nginx['http2_enabled'] = true
# nginx['real_ip_trusted_addresses'] = []
# nginx['real_ip_header'] = nil
# nginx['real_ip_recursive'] = nil
# nginx['custom_error_pages'] = {
#   '404' => {
#     'title' => 'Example title',
#     'header' => 'Example header',
#     'message' => 'Example message'
#   }
# }

### Advanced settings
# nginx['dir'] = "/var/opt/gitlab/nginx"
# nginx['log_directory'] = "/var/log/gitlab/nginx"
# nginx['worker_processes'] = 4
# nginx['worker_connections'] = 10240
# nginx['log_format'] = '$remote_addr - $remote_user [$time_local] "$request" $status $body_bytes_sent "$http_referer" "$http_user_agent"'
# nginx['sendfile'] = 'on'
# nginx['tcp_nopush'] = 'on'
# nginx['tcp_nodelay'] = 'on'
# nginx['gzip'] = "on"
# nginx['gzip_http_version'] = "1.0"
# nginx['gzip_comp_level'] = "2"
# nginx['gzip_proxied'] = "any"
# nginx['gzip_types'] = [ "text/plain", "text/css", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript", "application/json" ]
# nginx['keepalive_timeout'] = 65
# nginx['cache_max_size'] = '5000m'
# nginx['server_names_hash_bucket_size'] = 64

### Nginx status
# nginx['status'] = {
#  "enable" => true,
#  "listen_addresses" => ["127.0.0.1"],
#  "fqdn" => "dev.example.com",
#  "port" => 9999,
#  "options" => {
#    "stub_status" => "on", # Turn on stats
#    "server_tokens" => "off", # Don't show the version of NGINX
#    "access_log" => "on", # Disable logs for stats
#    "allow" => "127.0.0.1", # Only allow access from localhost
#    "deny" => "all" # Deny access to anyone else
#  }
# }

################################################################################
## GitLab Logging
##! Docs: https://docs.gitlab.com/omnibus/settings/logs.html
################################################################################

# logging['svlogd_size'] = 200 * 1024 * 1024 # rotate after 200 MB of log data
# logging['svlogd_num'] = 30 # keep 30 rotated log files
# logging['svlogd_timeout'] = 24 * 60 * 60 # rotate after 24 hours
# logging['svlogd_filter'] = "gzip" # compress logs with gzip
# logging['svlogd_udp'] = nil # transmit log messages via UDP
# logging['svlogd_prefix'] = nil # custom prefix for log messages
# logging['logrotate_frequency'] = "daily" # rotate logs daily
# logging['logrotate_size'] = nil # do not rotate by size by default
# logging['logrotate_rotate'] = 30 # keep 30 rotated logs
# logging['logrotate_compress'] = "compress" # see 'man logrotate'
# logging['logrotate_method'] = "copytruncate" # see 'man logrotate'
# logging['logrotate_postrotate'] = nil # no postrotate command by default
# logging['logrotate_dateformat'] = nil # use date extensions for rotated files rather than numbers e.g. a value of "-%Y-%m-%d" would give rotated files like production.log-2016-03-09.gz

################################################################################
## Logrotate
##! Docs: https://docs.gitlab.com/omnibus/settings/logs.html#logrotate
##! You can disable built in logrotate feature.
################################################################################
# logrotate['enable'] = true

################################################################################
## Users and groups accounts
##! Disable management of users and groups accounts.
##! **Set only if creating accounts manually**
##! Docs: https://docs.gitlab.com/omnibus/settings/configuration.html#disable-user-and-group-account-management
################################################################################

# manage_accounts['enable'] = false

################################################################################
## Storage directories
##! Disable managing storage directories
##! Docs: https://docs.gitlab.com/omnibus/settings/configuration.html#disable-storage-directories-management
################################################################################

##! **Set only if the select directories are created manually**
# manage_storage_directories['enable'] = false
# manage_storage_directories['manage_etc'] = false

################################################################################
## Git
##! Advanced setting for configuring git system settings for omnibus-gitlab
##! internal git
################################################################################

##! For multiple options under one header use array of comma separated values,
##! eg.:
##! { "receive" => ["fsckObjects = true"], "alias" => ["st = status", "co = checkout"] }

# omnibus_gitconfig['system'] = {
#  "pack" => ["threads = 1"],
#  "receive" => ["fsckObjects = true"],
#  "repack" => ["writeBitmaps = true"],
#  "transfer" => ["hideRefs=^refs/tmp/", "hideRefs=^refs/keep-around/"],
# }

################################################################################
## GitLab Pages
##! Docs: https://docs.gitlab.com/ce/pages/administration.html
################################################################################

##! Define to enable GitLab Pages
# pages_external_url "http://pages.example.com/"
# gitlab_pages['enable'] = false

##! Configure to expose GitLab Pages on external IP address, serving the HTTP
# gitlab_pages['external_http'] = nil

##! Configure to expose GitLab Pages on external IP address, serving the HTTPS
# gitlab_pages['external_https'] = nil

# gitlab_pages['listen_proxy'] = "localhost:8090"
# gitlab_pages['redirect_http'] = true
# gitlab_pages['use_http2'] = true
# gitlab_pages['dir'] = "/var/opt/gitlab/gitlab-pages"
# gitlab_pages['log_directory'] = "/var/log/gitlab/gitlab-pages"

##! Prometheus metrics for Pages docs: https://gitlab.com/gitlab-org/gitlab-pages/#enable-prometheus-metrics
# gitlab_pages['metrics_address'] = "localhost:1234"

################################################################################
## GitLab Pages NGINX
################################################################################

# pages_nginx['enable'] = false
# pages_nginx['redirect_http_to_https'] = false
# pages_nginx['redirect_http_to_https_port'] = 80
# pages_nginx['ssl_certificate'] = "/etc/gitlab/ssl/#{node['fqdn']}.crt"
# pages_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/#{node['fqdn']}.key"
# pages_nginx['ssl_ciphers'] = "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256"
# pages_nginx['ssl_prefer_server_ciphers'] = "on"

##! Recommended by : https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
##!                  https://cipherli.st/
# pages_nginx['ssl_protocols'] = "TLSv1 TLSv1.1 TLSv1.2"

##! Recommended in https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# pages_nginx['ssl_session_cache'] = "builtin:1000  shared:SSL:10m"

##! Default according to https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# pages_nginx['ssl_session_timeout'] = "5m"

##! Path to ci_dhparams.pem, eg. /etc/gitlab/ssl/ci_dhparams.pem
# pages_nginx['ssl_dhparam'] = nil

# pages_nginx['listen_addresses'] = ['*', '[::]']

##! **Override only if you use a reverse proxy**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#setting-the-nginx-listen-port
# pages_nginx['listen_port'] = nil

##! **Override only if your reverse proxy internally communicates over HTTP**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#supporting-proxied-ssl
# pages_nginx['listen_https'] = nil

# pages_nginx['custom_gitlab_server_config'] = "location ^~ /foo-namespace/bar-project/raw/ {\n deny all;\n}\n"

### Advanced settings
# pages_nginx['dir'] = "/var/opt/gitlab/nginx"
# pages_nginx['log_directory'] = "/var/log/gitlab/nginx"

# gitlab_rails['pages_path'] = "/mnt/storage/pages"

################################################################################
## GitLab CI
##! Docs: https://docs.gitlab.com/omnibus/gitlab-ci/README.html
################################################################################

# gitlab_ci['gitlab_ci_all_broken_builds'] = true
# gitlab_ci['gitlab_ci_add_pusher'] = true
# gitlab_ci['builds_directory'] = '/var/opt/gitlab/gitlab-ci/builds'

### DEPRECATED: ci_external_url 'http://ci.example.com'

################################################################################
## GitLab Mattermost
##! Docs: https://docs.gitlab.com/omnibus/gitlab-mattermost
################################################################################

# mattermost_external_url 'http://mattermost.example.com'

# mattermost['enable'] = false
# mattermost['username'] = 'mattermost'
# mattermost['group'] = 'mattermost'
# mattermost['uid'] = nil
# mattermost['gid'] = nil
# mattermost['home'] = '/var/opt/gitlab/mattermost'
# mattermost['database_name'] = 'mattermost_production'

# mattermost['service_use_ssl'] = false
# mattermost['service_address'] = "127.0.0.1"
# mattermost['service_port'] = "8065"
# mattermost['service_site_url'] = nil
# mattermost['service_maximum_login_attempts'] = 10
# mattermost['service_segment_developer_key'] = nil
# mattermost['service_google_developer_key'] = nil
# mattermost['service_enable_incoming_webhooks'] = true
# mattermost['service_enable_post_username_override'] = true
# mattermost['service_enable_post_icon_override'] = true
# mattermost['service_enable_testing'] = false
# mattermost['service_enable_security_fix_alert'] = true
# mattermost['service_enable_insecure_outgoing_connections'] = false
# mattermost['service_allow_cors_from'] = ""
# mattermost['service_enable_outgoing_webhooks'] = true
# mattermost['service_enable_commands'] = true
# mattermost['service_enable_custom_emoji'] = false
# mattermost['service_enable_only_admin_integrations'] = true
# mattermost['service_enable_oauth_service_provider'] = false
# mattermost['service_enable_developer'] = false
# mattermost['service_session_length_web_in_days'] = 30
# mattermost['service_session_length_mobile_in_days'] = 30
# mattermost['service_session_length_sso_in_days'] = 30
# mattermost['service_session_cache_in_minutes'] = 10
# mattermost['service_connection_security'] = nil
# mattermost['service_tls_cert_file'] = nil
# mattermost['service_tls_key_file'] = nil
# mattermost['service_use_lets_encrypt'] = false
# mattermost['service_lets_encrypt_cert_cache_file'] = "./config/letsencrypt.cache"
# mattermost['service_forward_80_to_443'] = false
# mattermost['service_read_timeout'] = 300
# mattermost['service_write_timeout'] = 300

# mattermost['team_site_name'] = "GitLab Mattermost"
# mattermost['team_max_users_per_team'] = 150
# mattermost['team_enable_team_creation'] = true
# mattermost['team_enable_user_creation'] = true
# mattermost['team_enable_open_server'] = false
# mattermost['team_allow_public_link'] = true
# mattermost['team_allow_valet_default'] = false
# mattermost['team_restrict_creation_to_domains'] = "gmail.com"
# mattermost['team_restrict_team_names'] = true
# mattermost['team_restrict_direct_message'] = "any"
# mattermost['team_max_channels_per_team'] = 2000

# mattermost['sql_driver_name'] = 'mysql'
# mattermost['sql_data_source'] = "mmuser:mostest@tcp(dockerhost:3306)/mattermost_test?charset=utf8mb4,utf8"
# mattermost['sql_data_source_replicas'] = ["mmuser:mostest@tcp(dockerhost:3306)/mattermost_test?charset=utf8mb4,utf8"]
# mattermost['sql_max_idle_conns'] = 10
# mattermost['sql_max_open_conns'] = 10
# mattermost['sql_trace'] = false

# mattermost['log_file_directory'] = '/var/log/gitlab/mattermost'
# mattermost['log_console_enable'] = true
# mattermost['log_console_level'] = 'INFO'
# mattermost['log_enable_file'] = false
# mattermost['log_file_level'] = 'INFO'
# mattermost['log_file_format'] = nil
# mattermost['log_enable_diagnostics'] = true

# mattermost['gitlab_enable'] = false
# mattermost['gitlab_id'] = "12345656"
# mattermost['gitlab_secret'] = "123456789"
# mattermost['gitlab_scope'] = ""
# mattermost['gitlab_auth_endpoint'] = "http://gitlab.example.com/oauth/authorize"
# mattermost['gitlab_token_endpoint'] = "http://gitlab.example.com/oauth/token"
# mattermost['gitlab_user_api_endpoint'] = "http://gitlab.example.com/api/v3/user"

# mattermost['aws'] = {'S3AccessKeyId' => '123', 'S3SecretAccessKey' => '123', 'S3Bucket' => 'aa', 'S3Region' => 'bb'}

# mattermost['email_enable_sign_up_with_email'] = true
# mattermost['email_enable_sign_in_with_email'] = true
# mattermost['email_enable_sign_in_with_username'] = false
# mattermost['email_send_email_notifications'] = false
# mattermost['email_require_email_verification'] = false
# mattermost['email_smtp_username'] = nil
# mattermost['email_smtp_password'] = nil
# mattermost['email_smtp_server'] = nil
# mattermost['email_smtp_port'] = nil
# mattermost['email_connection_security'] = nil
# mattermost['email_feedback_name'] = nil
# mattermost['email_feedback_email'] = nil
# mattermost['email_feedback_organization'] = nil
# mattermost['email_send_push_notifications'] = true
# mattermost['email_push_notification_server'] = ""
# mattermost['email_push_notification_contents'] = "generic"
# mattermost['email_enable_batching'] = false
# mattermost['email_batching_buffer_size'] = 256
# mattermost['email_batching_interval'] = 30

# mattermost['file_max_file_size'] = 52428800
# mattermost['file_driver_name'] = "local"
# mattermost['file_directory'] = "/var/opt/gitlab/mattermost/data"
# mattermost['file_enable_public_link'] = true
# mattermost['file_thumbnail_width'] = 120
# mattermost['file_thumbnail_height'] = 100
# mattermost['file_preview_width'] = 1024
# mattermost['file_preview_height'] = 0
# mattermost['file_profile_width'] = 128
# mattermost['file_profile_height'] = 128
# mattermost['file_initial_font'] = 'luximbi.ttf'
# mattermost['file_amazon_s3_access_key_id'] = nil
# mattermost['file_amazon_s3_bucket'] = nil
# mattermost['file_amazon_s3_secret_access_key'] = nil
# mattermost['file_amazon_s3_region'] = nil
# mattermost["file_amazon_s3_endpoint"] = nil
# mattermost["file_amazon_s3_bucket_endpoint"] = nil
# mattermost["file_amazon_s3_location_constraint"] = false
# mattermost["file_amazon_s3_lowercase_bucket"] = false
# mattermost["file_amazon_s3_ssl"] = true

# mattermost['ratelimit_enable_rate_limiter'] = false
# mattermost['ratelimit_per_sec'] = 10
# mattermost['ratelimit_memory_store_size'] = 10000
# mattermost['ratelimit_vary_by_remote_addr'] = true
# mattermost['ratelimit_vary_by_header'] = nil
# mattermost['ratelimit_max_burst'] = 100

# mattermost['support_terms_of_service_link'] = "/static/help/terms.html"
# mattermost['support_privacy_policy_link'] = "/static/help/privacy.html"
# mattermost['support_about_link'] = "/static/help/about.html"
# mattermost['support_report_a_problem_link'] =  "/static/help/report_problem.html"
# mattermost['support_email'] =  "support@example.com"

# mattermost['privacy_show_email_address'] = true
# mattermost['privacy_show_full_name'] = true

# mattermost['localization_server_locale'] = "en"
# mattermost['localization_client_locale'] = "en"
# mattermost['localization_available_locales'] = "en,es,fr,ja,pt-BR"

# mattermost['webrtc_enable'] = false
# mattermost['webrtc_gateway_websocket_url'] = nil
# mattermost['webrtc_gateway_admin_url'] = nil
# mattermost['webrtc_gateway_admin_secret'] = nil
# mattermost['webrtc_gateway_stun_uri'] = nil
# mattermost['webrtc_gateway_turn_uri'] = nil
# mattermost['webrtc_gateway_turn_username'] = nil
# mattermost['webrtc_gateway_turn_shared_key'] = ni

################################################################################
## Mattermost NGINX
################################################################################

# mattermost_nginx['enable'] = false
# mattermost_nginx['client_max_body_size'] = '250m'
# mattermost_nginx['redirect_http_to_https'] = false
# mattermost_nginx['redirect_http_to_https_port'] = 80
# mattermost_nginx['ssl_certificate'] = "/etc/gitlab/ssl/#{node['fqdn']}.crt"
# mattermost_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/#{node['fqdn']}.key"
# mattermost_nginx['ssl_ciphers'] = "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256"
# mattermost_nginx['ssl_prefer_server_ciphers'] = "on"

##! Recommended by: https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
##!                 https://cipherli.st/
# mattermost_nginx['ssl_protocols'] = "TLSv1 TLSv1.1 TLSv1.2"

##! Recommended in https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# mattermost_nginx['ssl_session_cache'] = "builtin:1000  shared:SSL:10m"

##! Default according to https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# mattermost_nginx['ssl_session_timeout'] = "5m"

##! Path to ci_dhparams.pem, eg. /etc/gitlab/ssl/ci_dhparams.pem
# mattermost_nginx['ssl_dhparam'] = nil

# mattermost_nginx['listen_addresses'] = ['*', '[::]']

##! **Override only if you use a reverse proxy**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#setting-the-nginx-listen-port
# mattermost_nginx['listen_port'] = nil

##! **Override only if your reverse proxy internally communicates over HTTP**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#supporting-proxied-ssl
# mattermost_nginx['listen_https'] = nil

# mattermost_nginx['custom_gitlab_mattermost_server_config'] = "location ^~ /foo-namespace/bar-project/raw/ {\n deny all;\n}\n"
# mattermost_nginx['proxy_set_headers'] = {
#   "Host" => "$http_host",
#   "X-Real-IP" => "$remote_addr",
#   "X-Forwarded-For" => "$proxy_add_x_forwarded_for",
#   "X-Frame-Options" => "SAMEORIGIN",
#   "X-Forwarded-Proto" => "https",
#   "X-Forwarded-Ssl" => "on",
#   "Upgrade" => "$http_upgrade",
#   "Connection" => "$connection_upgrade"
# }
# mattermost_nginx['real_ip_trusted_addresses'] = []
# mattermost_nginx['real_ip_header'] = nil
# mattermost_nginx['real_ip_recursive'] = nil

### Advanced settings
# mattermost_nginx['dir'] = "/var/opt/gitlab/nginx"
# mattermost_nginx['log_directory'] = "/var/log/gitlab/nginx"
# mattermost_nginx['worker_processes'] = 4
# mattermost_nginx['worker_connections'] = 10240
# mattermost_nginx['sendfile'] = 'on'
# mattermost_nginx['tcp_nopush'] = 'on'
# mattermost_nginx['tcp_nodelay'] = 'on'
# mattermost_nginx['gzip'] = "on"
# mattermost_nginx['gzip_http_version'] = "1.0"
# mattermost_nginx['gzip_comp_level'] = "2"
# mattermost_nginx['gzip_proxied'] = "any"
# mattermost_nginx['gzip_types'] = [ "text/plain", "text/css", "application/x-javascript", "text/xml", "application/xml", "application/xml+rss", "text/javascript", "application/json" ]
# mattermost_nginx['keepalive_timeout'] = 65
# mattermost_nginx['cache_max_size'] = '5000m'

################################################################################
## Registry NGINX
################################################################################

# registry_nginx['enable'] = false
# registry_nginx['redirect_http_to_https'] = false
# registry_nginx['redirect_http_to_https_port'] = 80
# registry_nginx['ssl_ciphers'] = "ECDHE-RSA-AES256-GCM-SHA384:ECDHE-RSA-AES128-GCM-SHA256"
# registry_nginx['ssl_prefer_server_ciphers'] = "on"
# registry_nginx['ssl_certificate'] = "/etc/gitlab/ssl/certificate.pem"
# registry_nginx['ssl_certificate_key'] = "/etc/gitlab/ssl/certificate.key"

##! **Override only if you use a reverse proxy**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#setting-the-nginx-listen-port
# registry_nginx['listen_port'] = nil

##! **Override only if your reverse proxy internally communicates over HTTP**
##! Docs: https://docs.gitlab.com/omnibus/settings/nginx.html#supporting-proxied-ssl
# registry_nginx['listen_https'] = nil

# registry_nginx['proxy_set_headers'] = {
#  "Host" => "$http_host",
#  "X-Real-IP" => "$remote_addr",
#  "X-Forwarded-For" => "$proxy_add_x_forwarded_for",
#  "X-Forwarded-Proto" => "https",
#  "X-Forwarded-Ssl" => "on"
# }

##! Recommended by : https://raymii.org/s/tutorials/Strong_SSL_Security_On_nginx.html
##!                  https://cipherli.st/
# registry_nginx['ssl_protocols'] = "TLSv1 TLSv1.1 TLSv1.2"

##! Recommended in https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# registry_nginx['ssl_session_cache'] = "builtin:1000  shared:SSL:10m"

##! Default according to https://nginx.org/en/docs/http/ngx_http_ssl_module.html
# registry_nginx['ssl_session_timeout'] = "5m"

##! Path to ci_dhparams.pem, eg. /etc/gitlab/ssl/ci_dhparams.pem
# registry_nginx['ssl_dhparam'] = nil

# registry_nginx['listen_addresses'] = ['*', '[::]']

### Advanced settings
# registry_nginx['log_directory'] = "/var/log/gitlab/nginx"

# registry_nginx['custom_gitlab_server_config'] = "location ^~ /foo-namespace/bar-project/raw/ {\n deny all;\n}\n"

################################################################################
## Prometheus
##! Docs: https://docs.gitlab.com/ce/administration/monitoring/performance/prometheus.html
################################################################################

# prometheus['enable'] = false
# prometheus['username'] = 'gitlab-prometheus'
# prometheus['uid'] = nil
# prometheus['gid'] = nil
# prometheus['shell'] = '/bin/sh'
# prometheus['home'] = '/var/opt/gitlab/prometheus'
# prometheus['log_directory'] = '/var/log/gitlab/prometheus'
# prometheus['scrape_interval'] = 15
# prometheus['scrape_timeout'] = 15
# prometheus['flags'] = {
#   'storage.local.path' => "#{node['gitlab']['prometheus']['home']}/data",
#   'storage.local.memory-chunks' => '50000',
#   'storage.local.max-chunks-to-persist' => '40000',
#   'config.file' => "#{node['gitlab']['prometheus']['home']}/prometheus.yml"
# }

##! Advanced settings. Should be changed only if absolutely needed.
# prometheus['listen_address'] = 'localhost:9090'

################################################################################
## Prometheus Node Exporter
##! Docs: https://docs.gitlab.com/ce/administration/monitoring/performance/prometheus.html
################################################################################

# node_exporter['enable'] = false
# node_exporter['home'] = '/var/opt/gitlab/node-exporter'
# node_exporter['log_directory'] = '/var/log/gitlab/node-exporter'
# node_exporter['flags'] = {
#   'collector.textfile.directory' => "#{node['gitlab']['node-exporter']['home']}/textfile_collector"
# }

##! Advanced settings. Should be changed only if absolutely needed.
# node_exporter['listen_address'] = 'localhost:9100'

################################################################################
## Prometheus Redis exporter
##! Docs: https://docs.gitlab.com/ce/administration/monitoring/performance/prometheus.html
################################################################################

# redis_exporter['enable'] = false
# redis_exporter['log_directory'] = "/var/log/gitlab/redis-exporter"
# redis_exporter['flags'] = {
#   'redis.addr' => "unix://#{node['gitlab']['gitlab-rails']['redis_socket']}",
# }

##! Advanced settings. Should be changed only if absolutely needed.
# redis_exporter['listen_address'] = 'localhost:9121'

################################################################################
## Postgres exporter
##! Docs: https://docs.gitlab.com/ce/administration/monitoring/performance/prometheus.html
################################################################################

# postgres_exporter['enable'] = false
# postgres_exporter['log_directory'] = "/var/log/gitlab/postgres-exporter"
# postgres_exporter['flags'] = {}
# postgres_exporter['listen_address'] = 'localhost:9187'

################################################################################
## Gitlab monitor
##! Docs: https://docs.gitlab.com/ce/administration/monitoring/performance/prometheus.html
################################################################################


# gitlab_monitor['enable'] = false
# gitlab_monitor['log_directory'] = "/var/log/gitlab/gitlab-monitor"
# gitlab_monitor['home'] = "/var/opt/gitlab/gitlab-monitor"

##! Advanced settings. Should be changed only if absolutely needed.
# gitlab_monitor['listen_address'] = 'localhost:9168'


################################################################################
################################################################################
##                  Configuration Settings for GitLab EE only                 ##
################################################################################
################################################################################


################################################################################
## Auxiliary cron jobs applicable to GitLab EE only
################################################################################
#
# gitlab_rails['geo_bulk_notify_worker_cron'] = "*/10 * * * * *"
# gitlab_rails['ldap_sync_worker_cron'] = "30 1 * * *"
# gitlab_rails['historical_data_worker_cron'] = "0 12 * * *"

################################################################################
## Kerberos (EE Only)
##! Docs: https://docs.gitlab.com/ee/integration/kerberos.html#http-git-access
################################################################################

# gitlab_rails['kerberos_enabled'] = true
# gitlab_rails['kerberos_keytab'] = /etc/http.keytab
# gitlab_rails['kerberos_service_principal_name'] = HTTP/gitlab.example.com@EXAMPLE.COM
# gitlab_rails['kerberos_use_dedicated_port'] = true
# gitlab_rails['kerberos_port'] = 8443
# gitlab_rails['kerberos_https'] = true

################################################################################
## GitLab Sentinel (EE Only)
##! Docs: http://docs.gitlab.com/ce/administration/high_availability/redis.html#high-availability-with-sentinel
################################################################################

##! **Make sure you configured all redis['master_*'] keys above before
##!   continuing.**

##! To enable Sentinel and disable all other services in this machine,
##! uncomment the line below (if you've enabled Redis role, it will keep it).
##! Docs: https://docs.gitlab.com/ce/administration/high_availability/redis.html
# redis_sentinel_role['enable'] = true

# sentinel['enable'] = true

##! Bind to all interfaces, uncomment to specify an IP and bind to a single one
# sentinel['bind'] = '0.0.0.0'

##! Uncomment to change default port
# sentinel['port'] = 26379

##! Quorum must reflect the amount of voting sentinels it take to start a
##! failover.
##! **Value must NOT be greater then the amount of sentinels.**
##! The quorum can be used to tune Sentinel in two ways:
##! 1. If a the quorum is set to a value smaller than the majority of Sentinels
##!    we deploy, we are basically making Sentinel more sensible to master
##!    failures, triggering a failover as soon as even just a minority of
##!    Sentinels is no longer able to talk with the master.
##! 2. If a quorum is set to a value greater than the majority of Sentinels, we
##!    are making Sentinel able to failover only when there are a very large
##!    number (larger than majority) of well connected Sentinels which agree
##!    about the master being down.
# sentinel['quorum'] = 1

### Consider unresponsive server down after x amount of ms.
# sentinel['down_after_milliseconds'] = 10000

### Specifies the failover timeout in milliseconds.
##! It is used in many ways:
##!
##! - The time needed to re-start a failover after a previous failover was
##!   already tried against the same master by a given Sentinel, is two
##!   times the failover timeout.
##!
##! - The time needed for a slave replicating to a wrong master according
##!   to a Sentinel current configuration, to be forced to replicate
##!   with the right master, is exactly the failover timeout (counting since
##!   the moment a Sentinel detected the misconfiguration).
##!
##! - The time needed to cancel a failover that is already in progress but
##!   did not produced any configuration change (SLAVEOF NO ONE yet not
##!   acknowledged by the promoted slave).
##!
##! - The maximum time a failover in progress waits for all the slaves to be
##!   reconfigured as slaves of the new master. However even after this time
##!   the slaves will be reconfigured by the Sentinels anyway, but not with
##!   the exact parallel-syncs progression as specified.
# sentinel['failover_timeout'] = 60000

################################################################################
## Logging (Additional, EE Only features)
##! Docs: http://docs.gitlab.com/omnibus/settings/logs.html#udp-log-shipping-gitlab-enterprise-edition-only-
################################################################################

##! remote host to ship log messages to via UDP
# logging['udp_log_shipping_host'] = nil

##! remote port to ship log messages to via UDP
# logging['udp_log_shipping_port'] = 514

################################################################################
## GitLab Sidekiq Cluster (EE only)
################################################################################

##! GitLab Enterprise Edition allows one to start an extra set of Sidekiq processes
##! besides the default one. These processes can be used to consume a dedicated set
##! of queues. This can be used to ensure certain queues always have dedicated
##! workers, no matter the amount of jobs that need to be processed.

# sidekiq_cluster['enable'] = false
# sidekiq_cluster['ha'] = false
# sidekiq_cluster['log_directory'] = "/var/log/gitlab/sidekiq-cluster"
# sidekiq_cluster['interval'] = 5 # The number of seconds to wait between worker checks

##! Each entry in the queue_groups array denotes a group of queues that have to be processed by a
##! Sidekiq process. Multiple queues can be processed by the same process by
##! separating them with a comma within the group entry

# sidekiq_cluster['queue_groups'] = [
#   "process_commit,post_receive",
#   "gitlab_shell"
# ]
