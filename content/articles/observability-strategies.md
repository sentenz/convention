# Observability Strategies

Observability strategies are approaches and methodologies used to design, implement, and maintain systems that are observable. Observability is the ability to understand the internal state of a system based on its external outputs, such as logs, metrics, and traces. Effective observability strategies enable organizations to monitor, troubleshoot, and optimize their systems efficiently.

- [1. Category](#1-category)
  - [1.1. USE](#11-use)
    - [1.1.1. CPU](#111-cpu)
    - [1.1.2. Memory](#112-memory)
    - [1.1.3. Network](#113-network)
    - [1.1.4. Disk I/O](#114-disk-io)
    - [1.1.5. Storage](#115-storage)
  - [1.2. RED](#12-red)
    - [1.2.1. HTTP](#121-http)
  - [1.3. The Four Golden Signals](#13-the-four-golden-signals)
    - [1.3.1. Microservice](#131-microservice)
- [2. References](#2-references)

## 1. Category

### 1.1. USE

The [USE (Utilization, Saturation, Errors)](https://www.brendangregg.com/usemethod.html) method is a framework for analyzing infrastructure performance.

- Utilization
  > The amount of a resource currently in use (e.g., CPU, memory, disk I/O, or network).

- Saturation
  > The degree to which extra work is queued because a resource is near capacity (e.g., load average, CPU run queue, or disk I/O queue).

- Errors
  > The number of failures observed (e.g., software, hardware, or network errors).

#### 1.1.1. CPU

PromQL queries for CPU in Grafana dashboards using Prometheus and Node Exporter.

> [!NOTE]
> The metrics available may depend on the exact version of the Node Exporter and the enabled collectors. Check the metrics exposed by the Node Exporter by accessing its `/metrics` endpoint.

1. Utilization

    - Queries

      - CPU Utilization
        > The percentage of CPU time that is not idle, which can be used as a proxy for CPU utilization.

        ```promql
        100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[$__rate_interval])) * 100)
        ```

    - Alerts

      - High CPU Utilization
        > The metric represents the percentage of CPU utilization. High values can indicate potential CPU saturation, which may lead to degraded performance or system instability.

        ```promql
        - alert: HighCPUUtilization
          expr: 100 - (avg by(instance) (rate(node_cpu_seconds_total{mode="idle"}[5m])) * 100) > 80
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High CPU utilization (instance {{ $labels.instance }})"
            description: "CPU utilization is above 80% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

2. Saturation

    > [!NOTE]
    > The metrics are just proxies for saturation and may not indicate an actual saturation state. Always interpret these metrics in the context of the system performance and other indicators.

    - Queries

      - CPU Saturation (System Load)
        > The system load average over 1 minute periods divided by the number of CPU cores can be used as a proxy for CPU saturation. A load average of 1.0 per CPU core indicates that the CPU is fully utilized.

        ```promql
        node_load1 / count without(cpu, mode) (node_cpu_seconds_total{mode="system"})
        ```

      - CPU Saturation (Load Average)
        > The system load average over 1 minute periods can be used as a proxy for CPU saturation. A load average of 1.0 per CPU core indicates that the CPU is fully utilized.

        ```promql
        node_load1
        ```

      - CPU Saturation (Run Queue Length)
        > The number of tasks in the runnable or uninterruptible state. A high run queue length can indicate CPU saturation.

        ```promql
        node_procs_running
        ```

      - CPU Saturation (I/O Wait)
        > The amount of time the CPU is idle due to waiting to handle I/O operations. High I/O wait times can indicate CPU saturation.

        ```promql
        sum(rate(node_cpu_seconds_total{mode="iowait"}[$__rate_interval]))
        ```

    - Alerts

      - High CPU Load Average
        > The metric represents the system load average over 1 minute periods. High values compared to the number of available CPU cores can indicate potential CPU saturation, which may lead to degraded performance or system instability.

        ```promql
        - alert: HighCPULoadAverage
          expr: node_load1 > count(count(node_cpu_seconds_total) by (cpu))
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High CPU load average (instance {{ $labels.instance }})"
            description: "CPU load average is above the number of CPU cores for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

3. Errors

    > [!NOTE]
    > The metrics are just proxies for errors and may not indicate an actual error state. Always interpret these metrics in the context of the system performance and other indicators.

    - Queries

      - CPU Errors (Context Switches)
        > Context switches can be a sign of CPU contention or other issues. A high rate of context switches may indicate that the CPU is experiencing performance problems.

        ```promql
        rate(node_context_switches_total[$__rate_interval])
        ```

      - CPU Errors (Steal Time)
        > In virtualized environments, steal time refers to the time a virtual CPU waits for a real CPU while the hypervisor is servicing another virtual processor. High steal time can indicate that the host machine is overloaded.

        ```promql
        sum(rate(node_cpu_seconds_total{mode="steal"}[$__rate_interval]))
        ```

      - CPU Errors (Soft Lockups)
        > Soft lockups occur when a CPU is stuck in a loop and cannot schedule other tasks. A high rate of soft lockups can indicate CPU issues.

        ```promql
        sum(rate(node_softnet_times_squeezed_total[$__rate_interval]))
        ```

      - CPU Errors (Guest Time)
        > In virtualized environments, this refers to the time a CPU was busy executing a virtual CPU for guest operating systems under the control of the Linux kernel. High guest time can indicate that the virtual machine is experiencing performance issues.

        ```promql
        sum(rate(node_cpu_guest_seconds_total[$__rate_interval]))
        ```

    - Alerts

      - CPU Errors (Potential Disk Issues)
        > The metric represents the rate of CPU context switches. High values can indicate potential CPU contention or other issues that may lead to degraded performance or system instability.

        ```promql
        - alert: HighCPUContextSwitches
          expr: rate(node_context_switches_total[5m]) > 1000
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High CPU context switches (instance {{ $labels.instance }})"
            description: "CPU context switches are above 1000 per second for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

#### 1.1.2. Memory

PromQL queries for Memory in Grafana dashboards using Prometheus and Node Exporter.

> [!NOTE]
> The metrics available may depend on the exact version of the Node Exporter and the enabled collectors. Check the metrics exposed by the Node Exporter by accessing its `/metrics` endpoint.

1. Utilization

    - Queries

      - Memory Utilization
        > The percentage of memory in use, calculated as the total memory minus the free memory, cached memory, buffers, and reclaimable memory, divided by the total memory.

        ```promql
        <!-- A -->
        node_memory_MemTotal_bytes - (node_memory_MemFree_bytes + node_memory_Cached_bytes + node_memory_Buffers_bytes + node_memory_SReclaimable_bytes)
        <!-- B -->
        node_memory_MemTotal_bytes
        ```

    - Alerts

      - High Memory Utilization
        > The metric represents the percentage of memory in use. High values can indicate potential memory saturation, which may lead to degraded performance or system instability.

        ```promql
        - alert: HighMemoryUtilization
          expr: (node_memory_MemTotal_bytes - node_memory_MemAvailable_bytes) / node_memory_MemTotal_bytes * 100 > 80
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High memory utilization (instance {{ $labels.instance }})"
            description: "Memory utilization is above 80% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

2. Saturation

    > [!NOTE]
    > Measuring memory saturation can be complex and often requires taking multiple factors into account. Depending on the system and workload, different metrics might be more or less relevant.

    - Queries

      - Memory Saturation (SWAP)
        > The degree to which the extra workload will be queued using swap usage as a proxy. High swap usage can indicate memory pressure and potential performance issues.

        ```promql
        100 * (node_memory_SwapTotal_bytes - node_memory_SwapFree_bytes) / node_memory_SwapTotal_bytes
        ```

      - Memory Saturation (Page Swap Activity)
        > The rate of page swaps can indicate memory pressure. High rates of page swapping can lead to performance degradation.

        ```promql
        rate(node_vmstat_pswpin[$__rate_interval]), rate(node_vmstat_pswpout[$__rate_interval])
        ```

      - Memory Saturation (Memory Buffer Size)
        > The amount of memory used for buffers can indicate memory pressure. High buffer usage can lead to performance degradation.

        ```promql
        node_memory_Buffers_bytes
        ```

    - Alerts

      - High Memory Swap Saturation
        > The metric represents the percentage of swap memory in use. High values can indicate potential memory pressure, which may lead to degraded performance or system instability.

        ```promql
        - alert: HighMemorySwapSaturation
          expr: (node_memory_SwapTotal_bytes - node_memory_SwapFree_bytes) / node_memory_SwapTotal_bytes * 100 > 50
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High memory swap saturation (instance {{ $labels.instance }})"
            description: "Memory swap saturation is above 50% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

3. Errors

    - Queries

      - Memory Errors (OOM Kills)
        > The metric represents the number of Out-Of-Memory (OOM) kills that have occurred. OOM kills happen when the system runs out of memory and the kernel terminates processes to free up memory. High values can indicate potential memory issues.

        ```promql
        rate(node_vmstat_oom_kill[$__rate_interval])
        ```

      - Memory Errors (Memory Page Faults)
        > The metric represents the rate of major page faults. High values can indicate potential memory issues, such as insufficient memory or memory leaks.

        ```promql
        rate(node_vmstat_pgmajfault[$__rate_interval])
        ```

    - Alerts

      - OOM Kills Detected
        > The metric represents the number of Out-Of-Memory (OOM) kills that have occurred. OOM kills happen when the system runs out of memory and the kernel terminates processes to free up memory. High values can indicate potential memory issues.

        ```promql
        - alert: OOMKillsDetected
          expr: increase(node_vmstat_oom_kill[5m]) > 0
          for: 5m
          labels:
            severity: critical
          annotations:
            summary: "OOM kills detected (instance {{ $labels.instance }})"
            description: "OOM kills have occurred in the last 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

      - High Memory Page Faults (Potential Memory Issues)
        > The metric represents the rate of major page faults. High values can indicate potential memory issues, such as insufficient memory or memory leaks.

        ```promql
        - alert: HighMemoryPageFaults
          expr: rate(node_vmstat_pgmajfault[5m]) > 1000
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High memory page faults (instance {{ $labels.instance }})"
            description: "Memory page faults are above 1000 per second for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

#### 1.1.3. Network

PromQL queries for Network in Grafana dashboards using Prometheus and Node Exporter.

> [!NOTE]
> The metrics available may depend on the exact version of the Node Exporter and the enabled collectors. Check the metrics exposed by the Node Exporter by accessing its `/metrics` endpoint.

1. Utilization

    - Queries

      - Traffic Receive
        > The fraction of time that the network is being used.

        ```promql
        sum(rate(node_network_receive_bytes_total[$__rate_interval])) by (device)
        ```

      - Traffic Transmit
        > The fraction of time that the network is being used.

        ```promql
        sum(rate(node_network_transmit_bytes_total[$__rate_interval])) by (device)
        ```

      - Traffic Bandwidth
        > Measured as the amount of data sent or received per unit time. High rates can indicate that the network interface is heavily utilized.

        ```promql
        (rate(node_network_transmit_bytes_total[$__rate_interval]) + rate(node_network_receive_bytes_total[$__rate_interval])) by (device)
        ```

      - Packet Rate
        > The rate of packets sent or received can be indicative of network utilization.

        ```promql
        (rate(node_network_transmit_packets_total[$__rate_interval]) + rate(node_network_receive_packets_total[$__rate_interval])) by (device)
        ```

    - Alerts

      - High Network Utilization
        > The metric represents the fraction of time that the network is being used. High values can indicate that the network interface is heavily utilized.

        ```promql
        - alert: HighNetworkUtilization
          expr: sum by(instance, device) (rate(node_network_receive_bytes_total[5m]) + rate(node_network_transmit_bytes_total[5m])) / 1024 / 1024 > 100
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High network utilization (instance {{ $labels.instance }}, device {{ $labels.device }})"
            description: "Network utilization is above 100 MB/s for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

2. Saturation

    - Queries

      - Network Saturation (Traffic Drop)
        > The number of received/transmitted network packets that are dropped as a proxy to indicate network saturation.

        ```promql
        (rate(node_network_receive_drop_total[$__rate_interval]) + rate(node_network_transmit_drop_total[$__rate_interval])) by (device)
        ```

      - Network Saturation (Transmit Queue Length)
        > Indicates if the network interface is saturated. A growing queue length can indicate higher saturation levels.

        ```promql
        avg(node_network_transmit_queue_length) by (device)
        ```

    - Alerts

      - High Network Dropped Packets
        > The metric represents the number of network packets that were dropped. High values can indicate network congestion or hardware issues.

        ```promql
        - alert: HighNetworkDroppedPackets
          expr: sum by(instance, device) (rate(node_network_receive_drop_total[5m]) + rate(node_network_transmit_drop_total[5m])) > 10
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High network dropped packets (instance {{ $labels.instance }}, device {{ $labels.device }})"
            description: "Network dropped packets are above 10 per second for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

3. Errors

    - Queries

      - Network Errors (Traffic Errors)
        > Error counts can be a sign of network problems.

        ```promql
        rate(node_network_receive_errs_total[$__rate_interval]) + rate(node_network_transmit_errs_total[$__rate_interval])
        ```

    - Alerts

      - High Network Errors
        > The metric represents the number of network errors that have occurred. High values can indicate network hardware issues, configuration problems, or other network-related errors.

        ```promql
        - alert: HighNetworkErrors
          expr: sum by(instance, device) (rate(node_network_receive_errs_total[5m]) + rate(node_network_transmit_errs_total[5m])) > 10
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High network errors (instance {{ $labels.instance }}, device {{ $labels.device }})"
            description: "Network errors are above 10 per second for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

#### 1.1.4. Disk I/O

PromQL queries for Disk I/O in Grafana dashboards using Prometheus and Node Exporter.

> [!NOTE]
> The metrics available may depend on the exact version of the Node Exporter and the enabled collectors. Check the metrics exposed by the Node Exporter by accessing its `/metrics` endpoint.

1. Utilization

    - Queries

      - Disk I/O Utilization
        > The percentage of time a disk device is busy servicing I/O.

        ```promql
        100 * rate(node_disk_io_time_seconds_total[$__rate_interval])
        ```

    - Alerts

      - High Disk I/O Utilization
        > The metric represents the percentage of time a disk device is busy servicing I/O. High values can indicate that the disk is heavily utilized, which may lead to performance degradation.

        ```promql
        - alert: HighDiskIOUtilization
          expr: rate(node_disk_io_time_seconds_total[5m]) / rate(node_disk_io_time_weighted_seconds_total[5m]) > 0.8
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High disk I/O utilization (instance {{ $labels.instance }})"
            description: "Disk I/O utilization is above 80% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

2. Saturation

    > [!NOTE]
    > The metrics are just proxies for saturation and may not indicate an actual saturation state. Always interpret these metrics in the context of the system performance and other indicators.

    - Queries

      - Disk I/O Saturation (I/O Weighted Time)
        > The degree to which the extra workload will be queued.

        ```promql
        rate(node_disk_io_time_weighted_seconds_total[$__rate_interval])
        ```

      - Disk I/O Saturation (I/O Wait Time)
        > The time operations had to wait for disk access.

        ```promql
        100 * sum by (instance) (rate(node_cpu_seconds_total{mode="iowait"}[$__rate_interval])) / sum by (instance) (rate(node_cpu_seconds_total[$__rate_interval]))
        ```

      - Disk I/O Saturation (I/O Service Time)
        > The time it takes to service I/O requests can indicate saturation. A high service time can mean that the disk is saturated with requests.

        ```promql
        rate(node_disk_io_time_seconds_total[$__rate_interval]) / rate(node_disk_io_time_weighted_seconds_total[$__rate_interval])
        ```

      - Disk I/O Saturation (I/O Queue Operations)
        > The metric represents the number of I/O operations currently in progress for a given disk. A high value may suggest a high load or potentially a performance issue.

        ```promql
        node_disk_io_now
        ```

    - Alerts

      - High Disk I/O Wait
        > The metric represents the percentage of time that I/O operations had to wait for disk access. High values can indicate that the disk is experiencing high latency or contention.

        ```promql
        - alert: HighDiskIOWait
          expr: rate(node_disk_io_time_seconds_total[5m]) / rate(node_disk_io_time_weighted_seconds_total[5m]) > 0.2
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "High disk I/O wait (instance {{ $labels.instance }})"
            description: "Disk I/O wait is above 20% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

3. Errors

    > [!NOTE]
    > The metrics are just proxies for errors and may not indicate an actual error state. Always interpret these metrics in the context of the system performance and other indicators.

    - Queries

      - Disk IO Errors (Read Errors)
        > Read metric with a status label indicating failure, or another dedicated error metric provided by the node exporter.

        ```promql
        rate(node_disk_reads_completed_total{status="fail"}[$__rate_interval])
        ```

      - Disk IO Errors (Write Errors)
        > Write metrics with a status label indicating failure, or another dedicated error metric provided by the node exporter.

        ```promql
        rate(node_disk_writes_completed_total{status="fail"}[$__rate_interval])
        ```

    - Alerts

      - Low Disk Read Rate (Potential Disk Issues)
        > The metric represents the number of disk read operations completed per second. Low values can indicate potential disk issues or underutilization.

        ```promql
        - alert: LowDiskReadRate
          expr: rate(node_disk_reads_completed_total[5m]) < 100
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Low disk read rate (instance {{ $labels.instance }})"
            description: "Disk read rate is below 100 ops/sec for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

      - Low Disk Write Rate (Potential Disk Issues)
        > The metric represents the number of disk write operations completed per second. Low values can indicate potential disk issues or underutilization.

        ```promql
        - alert: LowDiskWriteRate
          expr: rate(node_disk_writes_completed_total[5m]) < 100
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Low disk write rate (instance {{ $labels.instance }})"
            description: "Disk write rate is below 100 ops/sec for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

#### 1.1.5. Storage

PromQL queries for Storage in Grafana dashboards using Prometheus and Node Exporter.

> [!NOTE]
> The metrics available may depend on the exact version of the Node Exporter and the enabled collectors. Check the metrics exposed by the Node Exporter by accessing its `/metrics` endpoint.

1. Utilization

    - Queries

      - Storage Utilization
        > The percentage of disk space used on the filesystem.

        ```promql
        100 * (1 - node_filesystem_free_bytes / node_filesystem_size_bytes)
        ```

    - Alerts

      - Low Disk Space
        > The metric represents the available disk space as a percentage of the total disk space. Low values can indicate that the disk is running out of space, which may lead to performance degradation or system instability.

        ```promql
        - alert: LowDiskSpace
          expr: node_filesystem_avail_bytes{mountpoint="/", fstype !~ "tmpfs|shmpfs|overlay"} / node_filesystem_size_bytes{mountpoint="/", fstype !~ "tmpfs|shmpfs|overlay"} * 100 < 20
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Low disk space (instance {{ $labels.instance }})"
            description: "Disk space is below 20% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

2. Saturation

    - Queries

      - Storage Saturation
        > The metric represents the percentage of time a disk device is busy servicing I/O. High values can indicate that the disk is heavily utilized, which may lead to performance degradation.

        ```promql
        rate(node_disk_io_time_seconds_total[$__rate_interval])
        ```

    - Alerts

      - Low Free File Nodes (Potential Inode Exhaustion)
        > The metric represents the percentage of free inodes on the filesystem. Low values can indicate potential inode exhaustion, which may lead to the inability to create new files.

        ```promql
        - alert: LowFreeInodes
          expr: node_filesystem_files_free{mountpoint="/", fstype !~ "tmpfs|shmpfs|overlay"} / node_filesystem_files{mountpoint="/", fstype !~ "tmpfs|shmpfs|overlay"} * 100 < 10
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Low free inodes (instance {{ $labels.instance }})"
            description: "Free inodes are below 10% for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

3. Errors

    - Queries

      - Storage Errors
        > The metric represents the number of disk or filesystem errors that have occurred. High values can indicate potential hardware issues, configuration problems, or other storage-related errors.

        ```promql
        rate(node_filesystem_device_error[$__rate_interval])
        ```

    - Alerts

      - Disk Filesystem Error (Potential Permissions or Configuration Issues)
        > The metric represents the number of disk or filesystem errors that have occurred. High values can indicate potential hardware issues, configuration problems, or other storage-related errors.

        ```promql
        - alert: DiskFilesystemError
          expr: node_filesystem_device_error{mountpoint="/", fstype !~ "tmpfs|shmpfs|overlay"} > 0
          for: 5m
          labels:
            severity: warning
          annotations:
            summary: "Disk/Filesystem error (instance {{ $labels.instance }})"
            description: "Disk or filesystem errors have occurred for 5 minutes\n  VALUE = {{ $value }}\n  LABELS: {{ $labels }}"
        ```

### 1.2. RED

[RED (Rate, Errors, Duration)](https://grafana.com/blog/2018/08/02/the-red-method-how-to-instrument-your-services/) is a method for monitoring services that focuses on the health and performance of services.

- Rate
  > Number of requests that are coming in per second. Requests per second, network I/O rate, or transactions per second.

- Errors
  > Rate of requests that are failing. Percentage of requests that are failing, or the number of errors per second.

- Duration
  > Amount of time it takes to process a request. Average request duration, 95th percentile request duration, or the maximum request duration.

#### 1.2.1. HTTP

1. Rate

    - Queries

      - HTTP Rate
        > The rate of incoming HTTP requests per second.

        ```promql
        sum(rate(http_requests_total[$__interval])) by (service)
        ```

2. Errors

    - Queries

      - HTTP Error Ratio (5xx)
        > Percentage of HTTP 5xx errors over a period of time.

        ```promql
        sum(rate(http_requests_total{status=~"5.."}[$__interval])) / sum(rate(http_requests_total[$__interval]))
        ```

      - HTTP Error Rate (5xx)
        > The metric represents the rate of HTTP 5xx errors over a period of time.

        ```promql
        sum(rate(http_requests_total{status=~"5.."}[$__interval])) by (service)
        ```

      - HTTP Error Rate (4xx)
        > The metric represents the rate of HTTP 4xx errors over a period of time.

        ```promql
        sum(rate(http_requests_total{status=~"4.."}[$__interval])) by (service)
        ```

3. Duration

    - Queries

      - HTTP Duration
        > The amount of time taken to process requests, usually visualized as the 95th or 99th percentile.

        ```promql
        histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[$__interval])) by (le, service))
        ```

### 1.3. The Four Golden Signals

[The Four Golden Signals](https://sre.google/sre-book/monitoring-distributed-systems/#xref_monitoring_golden-signals) are a set of key monitoring metrics recommended by Google in Site Reliability Engineering (SRE) practices. They provide a high-level overview of distributed system health and performance.

> [!NOTE]
> The signals are considered `golden` because they offer a broad yet detailed view of a system's health and performance from the perspective of end-users. They help SREs and DevOps teams to quickly diagnose and address issues, ensuring that the system remains reliable and available for users.

- Latency
  > The time it takes to service a request. It's important to distinguish between the latency of successful requests and the latency of failed requests. Usually visualized as the 95th or 99th percentile.

- Traffic
  > The amount of demand being placed on the system, often measured in HTTP requests per second, an audio streaming system on network I/O rate or concurrent sessions, a key-value storage system on transactions and retrievals per second, or the number of concurrently active users.

- Errors
  > The rate of failed requests, due to internal server errors, failed requests, policy, condition result in an HTTP 500/400 status code. Typically measured as a fraction of total requests.

- Saturation
  > The degree to which the system is overloaded. For example, CPU saturation can be measured by the percentage of time the CPU is busy, while disk saturation can be measured by the percentage of time the disk is busy servicing I/O requests.

#### 1.3.1. Microservice

1. Latency

    - Queries

      - HTTP
        > The time taken to respond to requests.

        ```promql
        histogram_quantile(0.95, sum(rate(http_request_duration_seconds_bucket[$__interval])) by (le, service))
        ```

2. Traffic

    - Queries

      - HTTP
        > The rate of requests per second.

        ```promql
        sum(rate(http_requests_total[$__interval])) by (service)
        ```

      - Network
        > Network I/O rate over the last minute.

        ```promql
        sum(rate(network_io_bytes[1m]))
        ```

      - Transaction
        > Transactions per second over the last minute.

        ```promql
        sum(rate(transactions_total[1m]))
        ```

3. Errors

    - Queries

      - HTTP
        > Percentage of HTTP 5xx errors over the last 5 minutes.

        ```promql
        sum(rate(http_requests_total{status=~"5.."}[$__interval])) / sum(rate(http_requests_total[$__interval]))
        ```

      - HTTP
        > Rate of HTTP 5xx errors over the last minute.

        ```promql
        sum(rate(http_requests_total{status=~"5.."}[1m])) by (service)
        ```

      - HTTP
        > Rate of HTTP 4xx errors over the last minute.

        ```promql
        sum(rate(http_requests_total{status=~"4.."}[1m])) by (service)
        ```

4. Saturation

    - Queries

      - CPU
        > The metric represents the percentage of CPU utilization. High values can indicate potential CPU saturation, which may lead to degraded performance or system instability.

        ```promql
        100 - (avg by (instance) (irate(node_cpu_seconds_total{mode="idle"}[$__rate_interval])) * 100)
        ```

## 2. References

- Google [SRE](https://landing.google.com/sre/book.html) book.
- Prometheus [Exporters](https://prometheus.io/docs/instrumenting/exporters/) page.
- Grafana [Dashboards Best Practice](https://grafana.com/docs/grafana/latest/dashboards/build-dashboards/best-practices/) page.
- Grafana Play [The Four Golden Signals](https://play.grafana.org/d/000000109/the-four-golden-signals?orgId=1) page.
