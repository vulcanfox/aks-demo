import json
import os
import requests

# Load Terraform plan JSON
with open('tfplan.json') as f:
    plan = json.load(f)

resource_changes = plan.get("resource_changes", [])

to_add = sum(1 for r in resource_changes if "create" in r["change"]["actions"])
to_change = sum(1 for r in resource_changes if "update" in r["change"]["actions"])
to_destroy = sum(1 for r in resource_changes if "delete" in r["change"]["actions"])

# Build markdown summary
body = f"#### Terraform Plan Summary 📊\n**Plan:** {to_add} to add, {to_change} to change, {to_destroy} to destroy\n\n"

body += "<details><summary>Resources</summary>\n"
for r in resource_changes:
    body += f"""\
- **{r['address']}** ({', '.join(r['change']['actions'])})
"""

# Post to GitHub PR
pr_number = os.environ["PR_NUMBER"]
repo_owner = os.environ["REPO_OWNER"]
repo_name = os.environ["REPO_NAME"]
token = os.environ["GITHUB_TOKEN"]

url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/issues/{pr_number}/comments"
requests.post(url, headers={"Authorization": f"token {token}"}, json={"body": body})
