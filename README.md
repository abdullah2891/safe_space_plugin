# safe_space_plugin

MySafeSpace plugin.

## Getting Started

# Windows setup
* Run this command and enable developer mode
    ```
    start ms-settings:developers
    ```
* Git
  * Install latest Git from https://git-scm.com/downloads. 
  * Select 'Enable symbolic link' support during install.
* Java
  * Install JDK from https://www.oracle.com/java/technologies/downloads/#jdk19-windows
* Android Studio
  * Install latest Android Studio https://developer.android.com/studio
  * Install the following in SDK Manager
    * SDK Platform for Andrid 13.0
    * Android SDK Build-Tools
    * Android SDK Command-line Tools
    * Android SDK Platform-Tools
  * Create a new virtual device in Virtual Device Manager
* Flutter
  * Download latest flutter from https://docs.flutter.dev/get-started/install/windows.
  * Extract to c:\dev
  * Add c:\dev\flutter\bin to PATH
  * Run the following commands in a new terminal
    ```
    flutter config "--android-studio-dir=C:\Program Files\Android\Android Studio"
    flutter doctor --android-licenses
    ```
  * If 'flutter doctor' gives error 'Unable to find bundled Java version'
    * delete folder "C:\Program Files\Android\Android Studio\jre" as Admin
    * open CMD as Admin and run these commands
      ```
      cd C:\Program Files\Android\Android Studio
      mklink /D "jre" "jbr"      
      ```
  * Visual Studio Code
    * Install from https://code.visualstudio.com/Download
    * Open VSCode and install Flutter extension

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

