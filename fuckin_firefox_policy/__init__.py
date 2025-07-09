from flask import Flask, render_template
from pathlib import Path

app = Flask(__name__)

def convert_pywal_colors():
    gtk_path = Path.home() / '.config/waybar/colors_pywal.css'
    web_path = Path.home() / '.config/fuckin_firefox_policy/static/colors_web.css'

    if not gtk_path.exists():
        print("⚠️ colors_pywal.css not found!")
        return

    output = [":root {"]
    for line in gtk_path.read_text().splitlines():
        if line.strip().startswith("@define-color"):
            parts = line.split()
            if len(parts) >= 3:
                name = parts[1].replace("_", "-")
                hex_val = parts[2].strip(";")
                output.append(f"  --{name}: {hex_val};")
    output.append("}")

    web_path.write_text("\n".join(output))
    print("✅ Converted to colors_web.css")


@app.route('/')
def page():
    convert_pywal_colors()
    return render_template("index.html")


if __name__ == "__main__":
    app.run(port=7064, debug=True)
