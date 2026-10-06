
import os
import sys
import asyncio

# Setup path
workspace_root = os.path.dirname(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
challenge1_agents_path = os.path.join(workspace_root, "challenge-1", "agents")
if challenge1_agents_path not in sys.path:
    sys.path.append(challenge1_agents_path)

import anomaly_classification_agent

async def main():
    print("Calling create_agent...")
    try:
        client, agent = await anomaly_classification_agent.create_agent()
        print(f"Success. Agent type: {type(agent)}")
    except Exception as e:
        print(f"Error: {e}")
        import traceback
        traceback.print_exc()

if __name__ == "__main__":
    asyncio.run(main())
