# Orbit
Orbit builds a character using hats. This script no longer works due to the hair limit and network ownership changes. \
Thanks for visiting!
# Copy and paste me
```lua
loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/raycast6000/orbit/main/main.lua"))()
```
# How does this work?
Before loading the main script, you can choose whether or not have defaults animations enabled after reanimating such as walk and idling animations (they replicate) \
just by enabling a global boolean `_G["DefaultAnimations"]`. For example:
```lua
_G["DefaultAnimations"] = true; --we have default animations enabled!

character = loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/raycast6000/orbit/main/main.lua"))()
```
## Notes for devs
- You can play animations and they will replicate, as long as they are made by Roblox or the game developer.
- One advantage Orbit has is that you can move your body parts by modifying the joints inside the fake character's torso
- The main script returns the fake character.
## Hats needed
- https://www.roblox.com/catalog/4996525138/Head-of-Conflict -- For the head, you can change this in the source code.
- https://www.roblox.com/catalog/48474294/ROBLOX-Girl-Hair
- https://www.roblox.com/catalog/48474313/Red-Roblox-Cap
- https://www.roblox.com/catalog/62724852/Chestnut-Bun
- https://www.roblox.com/catalog/376527115/Jade-Necklace-with-Shell-Pendant
- https://www.roblox.com/catalog/62234425/Brown-Hair
- https://www.roblox.com/catalog/63690008/Pal-Hair
