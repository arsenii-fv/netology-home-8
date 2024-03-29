server {
	listen 80 default_server;
	listen [::]:80 default_server;

	root /opt/lighthouse/lighthouse-master;

	# Add index.php to the list if you are using PHP
	index index.html index.htm index.nginx-debian.html;

	#server_name_;

	location / {
		# First attempt to serve request as file, then
		# as directory, then fall back to displaying a 404.
		try_files $uri $uri/ =404;
	}

}

