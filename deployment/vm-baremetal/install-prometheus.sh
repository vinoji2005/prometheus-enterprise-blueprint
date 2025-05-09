#!/bin/bash

set -e

echo "🔧 Installing Prometheus on this Linux machine..."

# 1. Create user and directories
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir -p /etc/prometheus /var/lib/prometheus

# 2. Download latest Prometheus
cd /tmp
wget https://github.com/prometheus/prometheus/releases/download/v2.51.1/prometheus-2.51.1.linux-amd64.tar.gz
tar xvf prometheus-*.tar.gz

# 3. Copy binaries
sudo cp prometheus-2.51.1.linux-amd64/prometheus /usr/local/bin/
sudo cp prometheus-2.51.1.linux-amd64/promtool /usr/local/bin/

# 4. Set up config files
sudo cp -r prometheus-2.51.1.linux-amd64/consoles /etc/prometheus
sudo cp -r prometheus-2.51.1.linux-amd64/console_libraries /etc/prometheus

# 5. Set ownership
sudo chown -R prometheus:prometheus /etc/prometheus /var/lib/prometheus /usr/local/bin/prometheus /usr/local/bin/promtool

# 6. Create systemd service
cat <<EOF | sudo tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus Monitoring
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus \\
  --config.file=/etc/prometheus/prometheus.yml \\
  --storage.tsdb.path=/var/lib/prometheus/ \\
  --web.console.templates=/etc/prometheus/consoles \\
  --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF

# 7. Reload and start
sudo systemctl daemon-reexec
sudo systemctl enable --now prometheus

echo "✅ Prometheus installed and running on port 9090"
