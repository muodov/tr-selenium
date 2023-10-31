# run this inside the crawler directory
HUB_URL="http://10.100.9.21:4444"
NODENV_VERSION=18.16.0 npm run crawl -- --selenium-hub ${HUB_URL} -u https://example.com -v -o ./data

