# Fishytunes GGJ25 - Fork Updates

## Changes until Saturday 21:55
### Asset Path and Display Fixes
1. Background Image Issues
   - Fixed incorrect background image path (moved from root to Assets/Images/)
   - Added automatic background scaling system for proper viewport fitting
   - Created BackgroundScaler.gd to handle dynamic image scaling
   - Removed obsolete gradient background
   - Centered background sprite with proper positioning

2. File Structure Reorganization
   - Moved all audio files to Assets/Sounds/
   - Updated audio file references in scenes
   - Standardized asset import configurations

3. Technical Improvements
   - Added BackgroundScaler.gd for responsive background handling
   - Updated MainScene.tscn to use proper asset references
   - Fixed resource loading errors
   - Improved scene organization with proper layer management

### Files Modified
- Scenes/MainScene.tscn
  - Updated background implementation
  - Added BackgroundScaler node
  - Fixed asset references
- Scripts/BackgroundScaler.gd (new)
  - Added automatic viewport-based scaling
  - Implemented dynamic position calculation
- README.md
  - Added documentation of recent changes
  - Updated file modification list

# Previous Changes before saturday 21:00 (last pull before Dante left home :D )
1. Level System Improvements
   - Added proper level completion logic based on screen edge reaching
   - Implemented smooth level transitions with fade effects
   - Added player position reset between levels
   - Fixed premature level completion issues

2. Level Design
   - Added structured level patterns system
   - Implemented level 2 with more complex bubble patterns
   - Balanced bubble spacing and positioning

3. Helper Features
   - Added bubble highlight system (Press H to highlight correct bubbles)
   - Improved visual feedback for correct/incorrect bubbles
   - Added transition effects between levels

4. Bug Fixes
   - Fixed bubble collision handling
   - Fixed signal connections
   - Fixed player reset positioning
   - Fixed level completion conditions

## Files Modified
- Scripts/BubbleManager.gd
- Scripts/LevelManager.gd
- Scripts/InputManager.gd (new)
- Scenes/MainScene.tscn
- Assets/Bubble.gd

## How to Push to Upstream
1. Ensure you're on your fork's main branch:
   ```bash
   git checkout main
   ```
2. Add the upstream repository:
   ```bash
   git remote add upstream https://github.com/original/fishytunes_ggj25.git
   ```
3. Push changes:
   ```bash
   git push origin main
   ```
4. Create pull request through GitHub interface 