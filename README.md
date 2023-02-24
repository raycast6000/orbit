# Orbit
Orbit builds a character using hats. 
# How does this work?
Before loading the main script, you can choose whether or not have defaults animations enabled after reanimating such as walk and idling animations (they replicate) \
just by enabling a global boolean `_G["DefaultAnimations"]`. For example:
```lua
_G["DefaultAnimations"] = true; --we have default animations enabled!

character = loadstring(game:HttpGetAsync("https://raw.gitusercontent.com/raycast6000/orbit/main.lua"))()
```
## Notes for devs
- You can play animations and they will replicate, as long as they are made by Roblox or the game developer.
- One advantage Orbit has is that you can move your body parts by modifying the joints inside the fake character's torso
