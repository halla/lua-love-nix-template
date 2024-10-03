# flake.nix
{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixgl.url = "github:nix-community/nixGL";
  };
 
  outputs = {nixpkgs, nixgl, ...}: let
    system = "x86_64-linux";
    #       ↑ Swap it for your system if needed
    #       "aarch64-linux" / "x86_64-darwin" / "aarch64-darwin"
    pkgs = import nixpkgs {
      inherit system;
      overlays = [ nixgl.overlay ];
    };
    
    # pkgs = nixpkgs.legacyPackages.${system};
  in {
    devShells.${system}.default = pkgs.mkShell {
        packages = [
            pkgs.love
            pkgs.nixgl.auto.nixGLDefault
            #pkgs.nixgl.auto.nixGLNvidia
            #pkgs.nixgl.auto.nixGLNvidiaBumblebee
            #pkgs.nixgl.nixGLIntel
        ];
 
        NIXPKGS_ALLOW_UNFREE = 1; # to run the editor with NVIDIA's closed source drivers
        # Workaround: make vscode's python extension read the .venv
    };
    
  };
}
