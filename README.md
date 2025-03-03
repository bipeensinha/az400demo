
<img width="752" alt="image" src="https://github.com/user-attachments/assets/4c9dd625-1f3b-42df-b8f4-06c84eea3950" />

STEP 1: Build Pipeline — Publish Artifacts
✅ YAML for Build Pipeline (azure-pipelines.yml):
yaml
Copy
Edit
trigger:
- master  # Triggers on pushes to master

pool:
  name: 'mypool'  # Your self-hosted agent pool

stages:
# 🚀 BUILD STAGE
- stage: Build
  displayName: 'Build Stage'
  jobs:
  - job: BuildJob
    displayName: 'Build Job'
    steps:
    - script: echo "🚀 Build Stage Started"
    - script: echo "Hello from Build Stage! ✅"
    - script: echo "Build Completed Successfully"
    
    # 📁 Publish Artifact for Release Pipeline
    - task: PublishBuildArtifacts@1
      inputs:
        PathtoPublish: '$(Build.SourcesDirectory)'  # Change path if needed
        ArtifactName: 'drop'
        publishLocation: 'Container'
💡 What This Does:
Runs the Build job.
Publishes an artifact named drop that the Release pipeline will pick up.
📂 STEP 2: Create Release Pipeline — Consume Artifacts
Go to Azure DevOps → Pipelines → Releases.
Click + New Pipeline.
Select "Empty Job" for simplicity.
🛠️ Add Artifact:
In the Artifacts section, click Add an artifact.
Select Source Type → Build.
Choose your project and build pipeline.
Source Alias: Keep it as drop or rename as needed.
Click "Add".
🚀 Configure Release Stage:
In the Stage section, click 1 job, 0 task.
Add a task:
Agent job → Command Line Script
Script:
bash
Copy
Edit
echo "📦 Release Stage Started"
echo "Deploying Artifact..."
echo "Artifact Path: $(System.DefaultWorkingDirectory)/drop"
echo "🎉 Release Completed Successfully"
Save & Create Release.
⚡ STEP 3: Run It All Together
Run the Build Pipeline.
Once it completes, go to Releases → Create Release.
Pick the latest build and Deploy.
📊 Summary of Flow:
Build Pipeline:

Runs the build.
Publishes artifacts.
Release Pipeline:

Pulls artifacts from the build.
Runs a separate deployment process.
🎉 Done! You now have fully separated Build & Release pipelines.

Want me to add a real deployment step (like Azure Web App, VM, etc.) to the Release pipeline? 🚀
