# Custom Browser Home Page / New Tab

This project lets you customize your browser's home page or new tab page using a **local Flask server**. I am using it for Firefox-based browser **Zen**.


**Firefox sucks beacuse:**
- **No Native New Tab Customization**: Requires extensions to change the new tab page.
- **Local File Restrictions**: Extensions can’t access local files; the page must be served over HTTP.

My solution uses a Flask server to host your custom HTML page locally, bypassing these issues.

---

## How It Works

1. **Flask Server**: Serves your custom HTML page over HTTP.
2. **Autostart**: The server starts automatically when your PC boots (using Hyprland’s `exec-once`).
3. **Customization**: Edit the HTML file to design your ideal home page or new tab.

---

## Quick Setup

1. Install Flask:
   ```bash
   pip install flask

2. Add this to your Hyprland conf (adding whole path would be better):
   ```
   exec-once: python __init__.py
3. Set your browser’s home page or new tab URL to ``http://localhost:5000.``

---


![image](https://github.com/user-attachments/assets/6bfbd612-b035-40f7-88d5-aaf2f65216fc)
