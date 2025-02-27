# <a id="description"></a>📚 〢 Rocket Cleaner Changelog

### All notable changes and updates to Rocket Cleaner (this project) will be carefully documented in this file. This includes bug fixes, new features, improvements, and any other modifications made to the software, providing you with a comprehensive history of the project’s evolution. Be sure to check the changelog regularly to stay informed about the latest developments.


## <a id="content"></a>🌐 〢 Table Of Contents

- **[🔗 〢 Discord](https://discord.gg/6qAvAephsW)**
- **[📖 〢 Description](#description)**
- **[📥 〢 Download](https://github.com/DevBubba/Rocket-Cleaner/releases)**
- **[📚 〢 Changelog](https://github.com/DevBubba/Rocket-Cleaner/blob/main/CHANGELOG.md)**
  - **[🏷️ 〢 Version 1.0](#1.0)**


## <a id="1.0"></a>🚀 [Rocket Cleaner V1.0](https://github.com/DevBubba/Rocket-Cleaner/releases/tag/v1.0) - 2025-02-24

### ➕ Added

- Request for admin rights on launch.
- Comments for more readable user code related to file deletion.
- Auto-update feature with version control.
- Preferred method for requesting Chrome closure before cleaning cache files (history, cookies, cache, and user data).
- Slightly improved user-friendliness.

### 🔨 Fixed

- UI spacer in the finished task display.
- Admin rights gain method improved using flag files.

### 🛠️ Changed

- Modified file deletion process to be faster and check if the directory exists before attempting deletion.
- Optimized chkdsk flags for better disk checking (/F /R /X used where needed).
- UI delay reduced for a smoother experience.
- Pause added after each task to allow users to review logs.

### 🗑️ Removed

- Desktop file fixer (temporarily removed due to errors, may return in a future version).

### ✍️ To Do

- Add a restart check before restarting the PC.
- Automatically run sfc /scannow after a restart instead of prompting the user.
- Implement a way to check if files are in use by another process and skip those, while displaying successful deletions.
- Possibly remove the admin rights request display in PowerShell and show it only via Batch.
- Add defragmentation options for selected drives.
- Reintroduce an improved desktop file fixer supporting more file types.

### 🚫 Not Working

- Nothing

### 📝 Notes

- The auto-update feature requires an active internet connection to check for the latest version.
- Running the script without admin privileges may limit functionality.
- Some features, like defragmentation, may take longer depending on the system's state.
- The desktop file fixer will be reintroduced once stability improvements are made.
- Report any bugs or issues on the GitHub **[Issues Page](https://github.com/DevBubba/Rocket-Cleaner/issues)**.
