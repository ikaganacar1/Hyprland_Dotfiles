import json
with open('/home/ika1/.config/wallpaper/colors.json') as js_file:
    colors = json.load(js_file)

with open('/home/ika1/.config/starship.toml', 'r', encoding='utf-8') as file: 
    data = file.readlines() 
 

for idx, i in enumerate(data):
    if "red = " in i:
        pass
        #data[idx] = "red = "

    if "green = " in i:
        pass 

    if "os_bg = " in i:
        data[idx] = f"""os_bg = "{colors['colors']['color1']}"\n"""  

    if "username_bg = " in i:
        data[idx] = f"""username_bg = "{colors['colors']['color1']}"\n"""  

    if "directory_bg = " in i:
        data[idx] = f"""directory_bg = "{colors['colors']['color3']}"\n"""  
    
    if "git_bg = " in i:
        data[idx] = f"""git_bg = "{colors['colors']['color5']}"\n"""  

    if "language_bg = " in i:
        data[idx] = f"""language_bg = "{colors['colors']['color8']}"\n"""  

    if "end = " in i:
        data[idx] = f"""end = "{colors['colors']['color11']}"\n"""  

    if "base = " in i:
        data[idx] = f"""base = "{colors['colors']['color15']}"\n"""  

    if "text = " in i:
        data[idx] = f"""text = "{colors['colors']['color15']}"\n"""  




""" [palettes.ika]
red = "#f38ba8"
green = "#a6e3a1"

os_bg = "#636584"
username_bg = "#636584"
directory_bg = "#09122C"
git_bg = "#a6e3a1"
language_bg = "#94e2d5"
end = "#C099FF"
base = "#1e1e2e"
text = "#cdd6f4"""

with open('/home/ika1/.config/starship.toml', 'w', encoding='utf-8') as file: 
    file.writelines(data) 

