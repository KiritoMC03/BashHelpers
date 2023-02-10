@echo off

set "n=&echo."

set /p HTTPSPath=Enter repository HTTPS address: 
set /p CreateDefauldFolders=Create default folders? (y/n) 
set /p NameForGit=Please, enter your name for git branch (for code/"name"/prepare): 
set /p InitDefault=Will be installed default required submodules, ok? (y/n) 
set /p AddDSM=Add DSM Plugin? (y/n) 
set /p AddGameKit=Add Game Kit? (y/n) 
set /p AddDOTween=Add DOTween? (y/n) 
set /p AddUIKit=Add UI Kit? (y/n) 
set /p AddAddresablePlugin=Add Addresable Plugin? (y/n) 
set /p AddLeanTouchPlus=Add Lean Touch Plus? (y/n) 
set /p AddCurvySplines=Add Curvy Splines? (y/n) 

git init .
git remote add -f origin %HTTPSPath%
git fetch --all
git checkout master
git checkout -b develop
git checkout -b code/%NameForGit%/prepare

if %CreateDefauldFolders% == y (
	echo Creating main folders...%n%

	if not exist "Assets" md Assets
	if not exist "Assets\Project" md Assets\Project

	if not exist "Assets\Project\Animations" md Assets\Project\Animations
	if not exist "Assets\Project\Configs" md Assets\Project\Configs
	if not exist "Assets\Project\Configs" md Assets\Project\Fonts
	if not exist "Assets\Project\Materials" md Assets\Project\Materials
	if not exist "Assets\Project\Meshes" md Assets\Project\Meshes
	if not exist "Assets\Project\Prefabs" md Assets\Project\Prefabs
	if not exist "Assets\Project\Scenes" md Assets\Project\Scenes
	if not exist "Assets\Project\Scripts" md Assets\Project\Scripts
	if not exist "Assets\Project\Textures" md Assets\Project\Textures

	if not exist "Assets\Project\Configs\Game" md Assets\Project\Configs\Game
	if not exist "Assets\Project\Configs\UI" md Assets\Project\Configs\UI

	if not exist "Assets\Project\Materials\Render" md Assets\Project\Materials\Render
	if not exist "Assets\Project\Materials\Physics" md Assets\Project\Materials\Physics

	if not exist "Assets\Project\Prefabs\Game" md Assets\Project\Prefabs\Game
	if not exist "Assets\Project\Prefabs\UI" md Assets\Project\Prefabs\UI

	if not exist "Assets\Project\Scripts\Game\Structs" md Assets\Project\Scripts\Structs
	if not exist "Assets\Project\Scripts\Game\Interfaces" md Assets\Project\Scripts\Interfaces
	if not exist "Assets\Project\Scripts\Game\Enums" md Assets\Project\Scripts\Enums

	if not exist "Assets\Project\Scripts\Game\Game" md Assets\Project\Scripts\Game
	if not exist "Assets\Project\Scripts\Game\Game\Core" md Assets\Project\Scripts\Game\Core

	if not exist "Assets\Project\Scripts\UI" md Assets\Project\Scripts\UI
	if not exist "Assets\Project\Scripts\UI\Screens" md Assets\Project\Scripts\UI\Screens
	if not exist "Assets\Project\Scripts\UI\Controls" md Assets\Project\Scripts\UI\Controls

	if not exist "Assets\Project\Scripts\Game\Configs" md Assets\Project\Scripts\Configs
	if not exist "Assets\Project\Scripts\Game\Configs\Game" md Assets\Project\Scripts\Configs\Game
	if not exist "Assets\Project\Scripts\Game\Configs\UI" md Assets\Project\Scripts\Configs\UI

	echo Main folders created!%n%
)

echo Branch code/%NameForGit%/prepare created!%n%%n%

if not %InitDefault% == y (
	echo Default packages install cancelled.%n%
) else (
	echo General Plugin installing...%n%
	git submodule add ../general-plugin.git Packages/general-plugin
	git commit -m "- feat : general-plugin"
	echo General Plugin installing finished!%n%%n%

	echo Continuous Integration installing...%n%
	git submodule add ../continuous-integration.git Packages/cI
	git commit -m "- feat : continuous-integration"
	echo Continuous Integration installing finished!%n%%n%
)

if %AddDSM% == y (
	echo DSM Plugin installing...%n%
	git submodule add ../dsm.git Packages/dsm
	git commit -m "- feat : dsm plugin"
	echo DSM Plugin installing finished!%n%%n%
)

if %AddGameKit% == y (
	echo Game Kit installing...%n%
	git submodule add ../gamekit.git Packages/gameKit
	git commit -m "- feat : game-kit"
	echo Game Kit installing finished!%n%%n%
)

if %AddDOTween% == y (
	echo DOTween installing...%n%
	git submodule add ../dotween-pro.git Assets/Plugins/Demigiant
	git commit -m "- feat : dotween"
	echo DOTween installing finished!%n%%n%
)

if %AddUIKit% == y (
	echo UI Kit installing...%n%
	git submodule add ../uikit.git Packages/uiKit
	git commit -m "- feat : ui-kit"
	echo UI Kit installing... finished!%n%%n%
)

if %AddAddresablePlugin% == y (
	echo Addresable Plugin installing...%n%
	git submodule add ../ap.git Packages/aP
	git commit -m "- feat : adressable plugin"
	echo Addresable Plugin installing finished!%n%%n%
)

if %AddLeanTouchPlus% == y (
	echo Lean Touch Plus installing...%n%
	git submodule add ../lean-touch-plus.git Packages/leanTouchPlus
	git commit -m "- feat : lean touch plus"
	echo Lean Touch Plus installing finished!%n%%n%
)

if %AddCurvySplines% == y (
	echo Curvy Splines installing...%n%
	git submodule add ../curvy-splines.git Assets/Plugins/ToolBuddy
	git commit -m "- feat : curvy splines"
	echo Curvy Splines installing finished!%n%%n%
)

echo Installing Finished!

start "" "D:\Program Files\UnityHub\Unity Hub.exe"

pause