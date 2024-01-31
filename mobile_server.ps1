# get IP address and set URL
ip=$(ipconfig | grep -oP 'IPv4[^:]*:\s*\K[0-9.]+')
url="http://${ip}"
# set the baseURL in the hugo.toml for mobile
sed -i -E "s|http://[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}|${url}|g" ./hugo.toml
# run hugo for mobile
hugo server --environment mobile --bind 0.0.0.0 --baseURL $url
