#!/bin/bash

# Batch run both agents to populate traces in Azure AI Foundry
# This script runs multiple work orders through both agents to generate telemetry

set -e

echo "=========================================="
echo "  Batch Agent Execution for Trace Data"
echo "=========================================="
echo ""

# Work order IDs to process (matching actual Cosmos DB data)
WORK_ORDERS=("wo-2024-445" "wo-2024-456" "wo-2024-432" "wo-2024-468" "wo-2024-419")

echo "📊 This script will process ${#WORK_ORDERS[@]} work orders through both agents"
echo "   This will generate traces visible in Azure AI Foundry portal"
echo ""

# Counter for progress
total_runs=$((${#WORK_ORDERS[@]} * 2))
current_run=0

# Run Maintenance Scheduler Agent
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  PART 1: Maintenance Scheduler Agent                       │"
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

for wo in "${WORK_ORDERS[@]}"; do
    ((current_run++))
    echo "[$current_run/$total_runs] Processing $wo with Maintenance Scheduler..."
    
    if python agents/maintenance_scheduler_agent.py "$wo" 2>&1 | grep -E "(✓|✗|===)" ; then
        echo "   ✅ Completed $wo"
    else
        echo "   ⚠️  $wo completed (check output above)"
    fi
    echo ""
    
    # Small delay between runs
    sleep 2
done

echo ""
echo "┌─────────────────────────────────────────────────────────────┐"
echo "│  PART 2: Parts Ordering Agent                              │"
echo "└─────────────────────────────────────────────────────────────┘"
echo ""

for wo in "${WORK_ORDERS[@]}"; do
    ((current_run++))
    echo "[$current_run/$total_runs] Processing $wo with Parts Ordering Agent..."
    
    if python agents/parts_ordering_agent.py "$wo" 2>&1 | grep -E "(✓|✗|===)" ; then
        echo "   ✅ Completed $wo"
    else
        echo "   ⚠️  $wo completed (check output above)"
    fi
    echo ""
    
    # Small delay between runs
    sleep 2
done

echo ""
echo "=========================================="
echo "  ✅ Batch Execution Complete!"
echo "=========================================="
echo ""
echo "📊 Generated $total_runs agent traces across 2 agents"
echo ""
echo "View traces in Azure AI Foundry:"
echo "1. Navigate to: https://ai.azure.com"
echo "2. Select your project"
echo "3. Go to: Tracing → View traces"
echo "4. Filter by agent name:"
echo "   - MaintenanceSchedulerAgent"
echo "   - PartsOrderingAgent"
echo ""
echo "You should see:"
echo "   - ${#WORK_ORDERS[@]} traces from Maintenance Scheduler"
echo "   - ${#WORK_ORDERS[@]} traces from Parts Ordering Agent"
echo "   - Total: $total_runs traces"
echo ""
