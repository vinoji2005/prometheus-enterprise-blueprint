# 📡 Prometheus Enterprise Blueprint

Welcome to the **Prometheus Enterprise Blueprint** — your all-in-one GitHub repository for deploying, scaling, and managing Prometheus monitoring in enterprise environments.

This repo is designed for:

* 🔰 **Beginners** who want a hands-on learning path
* 🏢 **Enterprises** needing scalable, reliable monitoring
* 🧑‍💻 **DevOps/SREs** setting up 5K–10K node observability stacks

---

## 📁 Repository Structure

| Folder          | Purpose                                                      |
| --------------- | ------------------------------------------------------------ |
| `deployment/`   | Install Prometheus via Docker, Kubernetes, or systemd        |
| `exporters/`    | Setup guides for Linux, Windows, DBs, VMware, SNMP, Blackbox |
| `dashboards/`   | Ready-to-import Grafana JSON dashboards                      |
| `alerting/`     | Alertmanager configs and alert rules                         |
| `architecture/` | Design docs: HA setup, sizing, network ports                 |
| `examples/`     | PromQL queries, troubleshooting, and common issues           |
| `scripts/`      | Tools to auto-generate targets or test metrics               |

---

## 🚀 Quick Start (Using Docker Compose)

```bash
git clone https://github.com/vinoji2005/prometheus-enterprise-blueprint.git
cd prometheus-enterprise-blueprint/deployment/docker-compose
sudo docker-compose up -d
```

**Access your tools:**

* Prometheus: [http://localhost:9090](http://localhost:9090)
* Grafana: [http://localhost:3000](http://localhost:3000) (admin/admin)
* Node Exporter: [http://localhost:9100](http://localhost:9100)

---

## 🏗️ Enterprise Architecture Overview

See [`architecture/prometheus-ha.md`](architecture/prometheus-ha.md) for:

* Scalable design (up to 10,000 nodes)
* Hardware sizing (RAM/CPU/Disk)
* HA architecture (Thanos, federation)
* Required network ports (9090, 9100, 9093, etc.)
* Load balancer and multi-DC guidance

---

## 📦 Supported Exporters & Example Metrics

| System           | Exporter           | Example Metric                          |
| ---------------- | ------------------ | --------------------------------------- |
| Linux            | node\_exporter     | `node_cpu_seconds_total`                |
| Windows          | windows\_exporter  | `windows_logical_disk_free_bytes`       |
| MySQL            | mysqld\_exporter   | `mysql_global_status_threads_connected` |
| Oracle           | oracle\_exporter   | `oracle_up`                             |
| VMware           | vmware\_exporter   | `vmware_vm_power_state`                 |
| Network Devices  | snmp\_exporter     | `ifInOctets`                            |
| HTTP/Ping Checks | blackbox\_exporter | `probe_success`                         |

---

## 📊 Dashboards (Grafana)

Prebuilt dashboards are in the `dashboards/` folder:

* Node Exporter (Linux/Windows)
* MySQL, Oracle
* Kubernetes Cluster
* Uptime Probes (Blackbox)

**Import dashboards in Grafana:**

1. Open Grafana
2. Click “+” → Import
3. Upload `.json` file or paste dashboard ID

---

## 🔔 Alerts & Rules

Located in the `alerting/` folder:

* `alertmanager.yml` configuration
* SLA/SLO alert rules
* Notification integrations (Slack, email, PagerDuty)

---

## 📈 PromQL Examples

See `examples/promql-queries.md` for:

| Use Case            | PromQL Example                                                                  |
| ------------------- | ------------------------------------------------------------------------------- |
| CPU usage           | `100 - (avg by(instance)(rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100)` |
| Disk usage          | `node_filesystem_avail_bytes / node_filesystem_size_bytes * 100`                |
| Down targets (ping) | `probe_success == 0`                                                            |
| Pod restarts (K8s)  | `kube_pod_container_status_restarts_total > 5`                                  |

---

## 🛠️ Troubleshooting & Utilities

| File                          | Purpose                                  |
| ----------------------------- | ---------------------------------------- |
| `examples/troubleshooting.md` | Fix common Prometheus issues             |
| `scripts/generate-targets.py` | Auto-generate static\_configs or IP list |
| `scripts/test-endpoints.sh`   | Ping/test targets for reachability       |

---

## 🤝 Contributing

We welcome PRs and issues for:

* New exporters or tools
* Real-world architecture examples
* Community dashboard templates

---

## 📚 References

* [Prometheus Docs](https://prometheus.io/docs/introduction/overview/)
* [Prometheus Exporters List](https://prometheus.io/docs/instrumenting/exporters/)
* [Thanos Project](https://thanos.io/)
* [Grafana Dashboards](https://grafana.com/grafana/dashboards)

---

Let’s build enterprise-grade observability — one metric at a time. 🚀
