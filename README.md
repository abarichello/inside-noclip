# inside-noclip
Cheat Engine table with Lua and Auto Assembler scripts for Playdead's INSIDE game.<br>
This cheat table focuses on camera and player manipulation to see behind the scenes of the game.<br>
<br>
*INSIDE's version: Latest on Steam (v5.0.4).*

# Video
**Click the images below to see videos of this table's usage.**

<div>
  <a href="https://www.youtube.com/watch?v=H-PdmGz8rus"><img src="https://i.imgur.com/ossgqoh.png" width="400"></a>
  <a href="https://www.youtube.com/watch?v=OFXjVSPWfdU"><img src="https://i.imgur.com/PrTCV1j.png" width="400"></a>
</div>

# Usage
1. Download Cheat Engine 6.8.3+.
2. Open the game.
3. File > Open File. Select INSIDE.CT.
4. File > Open Process. Select the game "INSIDE".
5. Mono > Activate Mono Features.
6. Check the hotkeys below and enjoy.

# HotKeys
| Key              | Action                               |
| ---------------- | ------------------------------------ |
| ' (Single Quote) | Toggle NOP scripts                   |
| F2               | Toggle Camera X NOP                  |
| Numpad +/-       | Camera Zoom In/Zoom Out / X Position |
| -/=              | Camera Fast Zoom In/Out / X Position |
| Numpad 2/8       | Camera Y Coordinates                 |
| Numpad 4/6       | Camera Z Coordinates                 |
| Numpad 1/3       | Camera Pitch                         |
| Numpad 7/9       | Camera Yaw                           |

# Known Issues
Disable 'Show on Print' on the 'Lua Engine' popup so the windows does not come up when messages are printed to console.

Sometimes Cheat Engine can't inject its mono features DLL, to fix follow these steps:
1. Right click one of the addresses in the cheat table.
2. Click 'Find out what writes to this address', 'OK' and 'Find what writes the address pointed at by this pointer'.
3. Select the first instruction and click 'Show in disassembler'.
4. Now inject CE's DLL using Mono > Activate mono features.

Most errors can be fixed following the steps above, when using the disassembler CE's mono features are disabled requiring them to be enabled again.

# Reference
- [Auto Assembler](https://wiki.cheatengine.org/index.php?title=Cheat_Engine:Auto_Assembler)
- [celua.txt](https://github.com/cheat-engine/cheat-engine/blob/master/Cheat%20Engine/bin/celua.txt)
- [Stephen Chapman's YT channel](https://www.youtube.com/watch?v=eEg3q2qocwQ)
