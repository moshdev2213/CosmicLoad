
# 🌌 CosmicLoad: GCP Global Load Balancer

<p align="center">
  <img width="720" alt="22 (2)" src="https://github.com/user-attachments/assets/7af82fc9-8f23-4a3a-ad16-169d7066d2df">
</p>

## 🌟 Global LoadBalancer Response

<img width="1210" alt="Group 12" src="https://github.com/user-attachments/assets/90d3d2b0-bdcb-4677-b944-03bc9a4db056">


## 🌟 Project Overview

**CosmicLoad** is a cloud infrastructure project designed to explore and implement 🌐 **Google Cloud Platform's (GCP) Global Load Balancer**. This project demonstrates how to effectively distribute user requests across multiple regions and availability zones, ensuring:
- ✅ High Availability
- 🚀 Fault Tolerance
- ⚡️ Minimal Latency  
by leveraging Google's global infrastructure.

### 🔥 Key Features
1. **Global Load Balancing** 🌎: Distributes traffic between two regions (US Central & Asia Southeast).
2. **Instance Templates** 🖥️: Built with Ubuntu OS.
3. **Instance Groups** 🛠️:
   - **us-central** (Iowa): Includes 4 availability zones.
   - **asia-southeast1** (Singapore): Includes 3 availability zones.
4. **Cloud Armour** 🛡️: Blocks requests originating from India to improve security and control access.(Due to free-account gcp restricts cloud-armour quota)
5. **Auto Scaling** 📈: Dynamically scales instances based on CPU utilization:
   - **us-central**: Min 4 instances, max 8 instances.
   - **asia-southeast1**: Min 3 instances, max 6 instances.
6. **Traffic Distribution** 🔄: Uses the global load balancer to distribute traffic and ensure low-latency access to users worldwide.


## 💻 Components Breakdown

### 1. **Instance Templates** 🖥️
   - Configured GCE Ubuntu instances running **Apache** web server in:
     - **us-central-a** (Iowa)
     - **asia-southeast1-a** (Singapore)

### 2. **Instance Groups** 🚀
   - **us-central**: Autoscaled group across 4 availability zones (a, b, c, f) with **4 minimum** and **8 maximum** instances.
   - **asia-southeast1**: Autoscaled group across 2 availability zones (a, b) with **3 minimum** and **6 maximum** instances.

### 3. **Global Load Balancer** 🌐
   - Configured a **Global Load Balancer** to distribute incoming traffic across the **instance groups** in both regions. This ensures:
     - 📊 **High Availability**: Continues serving traffic even if a region fails.
     - ⚡️ **Low Latency**: Directs users to the region closest to them for faster response times.

### 4. **Cloud Armour** 🛡️
   - Implemented **Cloud Armour** to block traffic from **India**. This helps:
     - 🛠️ Filter out requests from unwanted regions.
     - 🧑‍💻 Maintain security by controlling access based on geographical locations.

### 5. **Auto-Scaling** 📈
   - Autoscaling based on **CPU utilization** to optimize resource usage and reduce costs:
     - **us-central**: Scales between **4** to **8** instances.
     - **asia-southeast1**: Scales between **3** to **6** instances.

---

## 🔨 Steps to Reproduce

### Prerequisites ✅
1. **GCP Account** with billing enabled.
2. Knowledge of GCP services like **Compute Engine**, **Load Balancer**, and **Cloud Armour**.
3. Optional: Familiarity with **Terraform** or **gcloud CLI** for resource management.

### 🛠️ 1. Create Instance Templates
   - Use the GCE Ubuntu image and install the **Apache** web server on the instances in both regions.

### 🛠️ 2. Create Instance Groups
   - Create an **instance group** for each region:
     - **us-central** with autoscaling (min 4, max 8).
     - **asia-southeast1** with autoscaling (min 3, max 6).

### 🛠️ 3. Set Up Global Load Balancer 🌎
   - Configure a GCP **Global Load Balancer** to route incoming traffic across the **instance groups** in both regions.

### 🛠️ 4. Configure Cloud Armour 🛡️
   - Set up **Cloud Armour** to block requests from **India** or any other unwanted geographic location.

### 🛠️ 5. Test and Verify ⚙️
   - Send user traffic from different locations to verify:
     - ✅ Traffic distribution across regions.
     - 🚫 Requests from blocked regions are denied.
     - 📈 Instances are auto-scaling based on load.

---

## 🧰 Tech Stack

- **Google Cloud Platform (GCP)**:
  - 🌍 **Compute Engine**
  - ⚡️ **Global Load Balancer**
  - 🔐 **Cloud Armour**
- **Ubuntu**: Operating system on the instances.
- **Apache Web Server**: Hosting web services on each instance.
- **Terraform**: Optional, for automating infrastructure provisioning.
