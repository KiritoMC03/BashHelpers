@echo on

git fetch --all
git lfs fetch --all old-origin
git lfs push --all origin
git lfs pull

exit