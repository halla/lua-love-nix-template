This is just something to get started with Löve / Lua and Nix.

Don't take too seriously.


To run:

Start nix shell:

 NIXPKGS_ALLOW_UNFREE=1 nix develop --impure


Run love in the folder root, main.lua is executed and a window should open with hello world:

 nixGL love .


(Other GL drivers avaiable too, eg nvidia)
