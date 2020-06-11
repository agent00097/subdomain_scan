for web in $(cat subdomains_sublister.txt);do curl -s -o /dev/null -I -w "%{http_code}" https://$web --max-time 5; printf " - $web \n" & done > curl_results.txt

