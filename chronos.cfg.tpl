# MySQL login
mysql_host              	= ${MYSQL_HOST}
mysql_user              	= ${MYSQL_USER}
mysql_pass              	= ${MYSQL_PASS}
mysql_db                	= ${MYSQL_DB}

# Use job log entries up to this age for jitter average calculation
jitter_avg_time         	= 300

# Number of parallel requests per thread
parallel_requests       	= 8192

# Timeout (in seconds) for requests
request_timeout         	= 30

# Maximum size (in bytes) of request body
request_max_size        	= 8192

# Maximum count of subsequent failures before job gets disabled automatically
max_failures         		= 15

# Path scheme for job log databases, %u will be replaced by a path computed from the user ID
user_db_file_path_scheme	= /var/lib/cron-job.org-data/%u

# Scheme for job log databases, %m will be replaced by the month, %d by the month day
user_db_file_name_scheme	= joblog-%m-%d.db

# User-Agent header for requests
user_agent					= Mozilla/4.0 (compatible)

