You are an AI coding assistant tasked with building a multi-agent predictive maintenance solution for automotive tyres using Azure services. Follow these instructions:

1. **Architecture Context**
   - Multi-agent system with these components:
     * Anomaly Detection Agent (IoT + Azure Anomaly Detector)
     * Fault Diagnosis Agent (Root Cause Analysis using Azure Foundry + Cognitive Search)
     * Repair Planner Agent (Generates work orders using Azure Foundry + Cosmos DB)
     * Maintenance Scheduler Agent (Integrates with Microsoft 365 Calendar APIs)
     * Orchestration (using the Microsoft Agent Framework)

2. **Coding Requirements**
   - Language: Python
   - Use Azure SDKs for Cosmos DB, AI Search, and Foundry.
   - Implement modular functions for each agent.
   - Include an Azure Function trigger for anomaly detection based on IoT telemetry.
   - Fetch thresholds from Cosmos DB and apply logic: `if currentValue >= threshold - 1`.
   - For orchestration, design a workflow that calls sub-agents sequentially.

3. **Deliverables**
   - Code snippets for:
     * Anomaly detection logic (threshold).
     * Cosmos DB query for thresholds and historical data.
     * Microsoft Foundry Models integration for diagnosis and repair plan generation.
   - Include comments explaining each step.
   - Provide sample JSON schema for tyre telemetry and Cosmos DB thresholds.

4. **Best Practices**
   - Use environment variables for keys and endpoints.
   - Add error handling and logging.
   - Make code extensible for future agents (e.g., inventory or compliance).


## The Use Case:
# End-to-End Intelligent Maintenance Architecture

This document provides a detailed, long-form explanation of the intelligent maintenance architecture shown in the diagram. It describes how factory machinery, multi-agent systems, and enterprise applications work together to automate anomaly detection, fault diagnosis, repair planning, scheduling, and logistics.

---

## 1. Factory Layer – Machines, Operators, and Sensors

At the foundation of the architecture is the **Factory** environment where machines operate under the supervision of human operators. Each machine is equipped with **sensors** that continuously stream telemetry such as temperature, vibration, pressure, or acoustic signals. These signals serve as the raw input for the anomaly detection process.

The telemetry is forwarded to the **Agent Platform**, which monitors the machine’s condition in real time. As soon as the machine’s behavior deviates from expected patterns, the system begins the automated maintenance workflow.

---

## 2. Agent Platform – Intelligence Layer

The Agent Platform hosts multiple specialized AI agents, machine learning models, and a hot data store. Each agent plays a role in a sequential workflow that transforms raw telemetry into actionable maintenance planning.

### 2.1 Anomaly Detection Model & Agent (Steps 1–2)

Incoming telemetry is evaluated by an **Anomaly Detection Model**. When abnormal behavior occurs, the **Anomaly Detection Agent** is activated.  
Its responsibilities include:
- Identifying deviations from normal behavior  
- Labeling potential issues  
- Triggering deeper diagnostic workflows  

This agent acts as the system’s early warning mechanism.

---

### 2.2 Fault Diagnosis Agent (Step 3)

Once an anomaly is confirmed, the **Fault Diagnosis Agent** determines the root cause. It connects to multiple core systems such as:
- **KB** (Knowledge Base) for troubleshooting documentation  
- **PLM** for machine component information  
- **CMSS** for repair history  
- **QMS** for technical bulletins  

The agent produces a clear description of the issue and references relevant past cases.

---

### 2.3 Repair Planner Agent (Step 4)

The **Repair Planner Agent** determines what must be done to fix the diagnosed fault. To do this, it consults:
- **ERP** to create a Work Order  
- **HR** to find technicians with the required skills  
- **MES** to check machine downtime windows  
- **WMS / SCM** to verify parts availability  

The output is a structured repair plan covering tasks, resources, parts, and timing.

---

### 2.4 Maintenance Scheduler Agent (Step 5)

The last intelligent component is the **Maintenance Scheduler Agent**. It arranges all logistics needed for the repair:
- Booking a technician  
- Confirming the time slot  
- Ensuring parts are available  
- Triggering supply chain orders if needed  

After this agent completes its work, the repair process is ready for execution.

---

## 3. Core Systems – The Digital Backbone

The architecture integrates deeply with enterprise systems that supply the data and actions needed by the agents. These include:

- **CMSS – Computerized Maintenance System:** Repair history, maintenance logs  
- **KB – Knowledge Base:** Troubleshooting guides and documentation  
- **PLM – Product Lifecycle Management:** Engineering and component data  
- **QMS – Quality Management System:** Technical bulletins and alerts  
- **ERP – Enterprise Resource Planning:** Work Orders and operational triggers  
- **HR – Human Resource Information System:** Technician skills and availability  
- **MES – Manufacturing Execution System:** Production schedule and downtime windows  
- **WMS – Warehouse Management System:** Spare parts inventory  
- **SCM – Supply Chain Management:** Supplier ordering and replenishment  

These systems make agent decisions accurate, contextual, and aligned with operational constraints. In practicdal terms, these will all be created by you and structured into a CosmosDB service.

---

## 4. Warehouse & Supplier Ecosystem

The architecture extends beyond the factory into logistics:
- **Warehouse:** Holds spare parts and updates stock levels  
- **Supplier:** Provides new components when stocks are low  

Using WMS and SCM integrations, the platform ensures that repairs never stall due to missing materials.

---

## 5. Human Roles in the Loop

Humans remain essential participants:
- The **machine operator** oversees daily machine use  
- The **technician** performs the physical repair after being dispatched  

By automating diagnostics and planning, the system frees humans to focus on skilled tasks.

---

## 6. Workflow Summary

1. Sensors detect abnormal signals.  
2. The Anomaly Detection Agent identifies the issue.  
3. The Fault Diagnosis Agent determines the root cause.  
4. The Repair Planner Agent builds the repair plan and Work Order.  
5. The Maintenance Scheduler Agent coordinates logistics.  
6. A technician is dispatched to perform the repair.  
7. Core systems synchronize data to close the loop.

---

## Conclusion

This architecture showcases a modern AI-powered maintenance ecosystem. It unifies physical machine telemetry, specialized AI agents, enterprise systems, and supply chain operations into a fully automated predictive maintenance workflow. The result is reduced downtime, better resource usage, and more resilient factory operations.

