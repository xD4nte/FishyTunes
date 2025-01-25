# Fishytunes GGJ25 - Fork Updates

## Changes Made
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