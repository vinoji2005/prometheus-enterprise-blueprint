# 📊 PromQL Query Examples (Real-World Scenarios)

These are production-grade PromQL queries to help you understand and monitor your systems using Prometheus.

---

## ✅ CPU, Memory, and Disk

### 🔸 Memory Available Percentage

(node_memory_MemAvailable_bytes / node_memory_MemTotal_bytes) * 100

### 🔸 Disk Usage on Root
100 - (node_filesystem_avail_bytes{mountpoint="/"} / node_filesystem_size_bytes{mountpoint="/"} * 100)


### 🔸 CPU Usage (All Nodes)

100 - (avg by (instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)

🧠 Node Health and Exporter Uptime
