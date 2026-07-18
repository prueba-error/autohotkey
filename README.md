# Custom AutoHotkey v2.0 Utility Scripts

A collection of AutoHotkey v2.0 scripts i use to streamline my workflows on Windows.

---

## Scripts Directory & Hotkey Reference

### 1. Control Panel Quick Launch
* [`control-panel.ahk`](control-panel.ahk)
* `Win` + `-` (Hyphen)
* Quick access to the Control Panel:
  - **Single tap**: Runs the classic Windows Control Panel (`control`).
  - **Double tap**: Directly opens the Add/Remove Programs applet (`appwiz.cpl`).

### 2. Explorer Alternate View Toggle
* [`explorer-alternate-view.ahk`](explorer-alternate-view.ahk)
* `Ctrl` + `Shift` + `V` (Only active when Windows Explorer is focused)
* Toggles the active folder view layout between **Details** view and **Medium Icons**.

### 3. Chorded Explorer Override
* [`explorer-override.ahk`](explorer-override.ahk)
* `Win` + `E` followed by a chord key (within 2 seconds)
* Overrides the default Explorer shortcut to open specific custom directories depending on the second key pressed:
  - `d` $\rightarrow$ Desktop
  - `e` $\rightarrow$ User Home Profile (`%USERPROFILE%`)
  - `c` $\rightarrow$ Code directory (`%USERPROFILE%\Code`)
  - `s` $\rightarrow$ This PC / My Computer
  - `l` $\rightarrow$ Work folder (`%USERPROFILE%\Desktop\labubu`)
  - *No input or other key* $\rightarrow$ Default Windows Explorer.

### 4. Explorer Panel Focus Navigation
* [`explorer-panels.ahk`](explorer-panels.ahk)
* **Triggers**:
  - `Ctrl` + `Alt` + `N` $\rightarrow$ Jumps focus to the **Navigation Panel**.
  - `Ctrl` + `Alt` + `C` $\rightarrow$ Jumps focus to the **Content / File List View**.
* Quick keyboard-only focus switching inside Windows Explorer. Safety checks are included to ensure focus doesn't shift if you are renaming a file or editing text (e.g. typing in the address bar).

### 5. Open Gemini PWA
* [`open-gemini.ahk`](open-gemini.ahk)
* `Ctrl` + `Alt` + `G`
* Launches the Gemini web app in PWA (application) mode using Brave Browser's application proxy launcher.

### 6. Open Terminal Here
* [`open-terminal-here.ahk`](open-terminal-here.ahk)
* **Triggers**:
  - `Ctrl` + `Alt` + `T` $\rightarrow$ Open terminal here (User privileges).
  - `Ctrl` + `Alt` + `Shift` + `T` $\rightarrow$ Open terminal here (Administrator privileges).
* Uses shell COM APIs to query the current path of the active Windows Explorer tab and launches a Windows Terminal instance configured to start in that directory.

### 7. Show/Hide Desktop Icons
* [`show_hide-desktop-icons.ahk`](show_hide-desktop-icons.ahk)
* `Ctrl` + `Alt` + `D`
* Hides or shows desktop icons by toggling the visibility of the desktop's system list view window (`SysListView321` under `Progman` or `WorkerW`).

---

## Requirements

All scripts require **AutoHotkey v2.0** or higher.