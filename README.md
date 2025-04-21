## 🚀 Flutter CI/CD Pipeline with GitHub Actions
### This repository is configured to automate the build and release process of a Flutter application using GitHub Actions.

The workflow handles everything from pulling dependencies, building release APKs, packaging them as ZIPs, and publishing them automatically to GitHub Releases — all triggered on each push or pull request to your main, master, or development branches.

## ⚙️ Workflow Overview
### This setup consists of two main jobs:

## 🏗️ Build Job
### Runs on: macOS

This job automates the build process:

1. Checks out your Flutter project.
2. Sets up Flutter SDK (version 3.19.0 or as configured).
3. Installs dependencies using flutter pub get.
4. Builds a release APK.
5. Packages the APK into a ZIP file.
6. Extracts the app version from pubspec.yaml.
7. Uploads the APK and ZIP as build artifacts for the next job.

## 🚀 Release Job
### Runs on: Ubuntu

This job automates the release process:
1. Tags the commit using the version defined in pubspec.yaml.
2. Creates or updates the Git tag.
3. Publishes a new GitHub Release with the APK and ZIP file attached.
4. Generates release notes automatically.


## 🔥 Benefits of this Setup
✅ No Manual Builds: Every time you push code to main, master, or development, your APK and release package are automatically built and uploaded.

✅ Version-Consistent Tags: GitHub tags are auto-created from the pubspec.yaml version, reducing release versioning errors.

✅ Release Automation: APK & ZIP artifacts are published directly to GitHub Releases — no manual file handling!

✅ Team Efficiency: Enables seamless collaboration for distributed teams — everyone can access consistent builds from the Releases section.


## 💡 Requirements
A valid Flutter project with pubspec.yaml.

## GitHub repository with Actions enabled.

A GitHub secret named TOKEN for authenticating the release (usually your GITHUB_TOKEN or personal access token).

## ✍️ Credits
Created with by Ajinkya Aher
Automated release made easy with GitHub Actions.


