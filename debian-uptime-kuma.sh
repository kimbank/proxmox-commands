apt update && sudo apt upgrade -y

# git
apt install -y git

# nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
apt install -y nodejs
apt install -y npm

# pm2
npm install pm2 -g && pm2 install pm2-logrotate

# clone uptime kuma git repository
if [ ! -d "uptime-kuma" ]; then
  git clone https://github.com/louislam/uptime-kuma.git
fi
cd uptime-kuma
npm run setup

echo
echo "Uptime Kuma installed"
echo "directory: $(pwd)"
echo


cat <<EOF
[ Next Steps for Excute Uptime Kuma ]:

# Option 1. Try it
node server/server.js

# (Recommended) Option 2. Run in the background using PM2
pm2 start server/server.js --name uptime-kuma

Then Uptime Kuma is now running on http://localhost:3001

> More useful PM2 Commands

# If you want to see the current console output
pm2 monit

# If you want to add it to startup
pm2 save && pm2 startup
EOF