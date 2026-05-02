{
  description = "XMRig runner";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
  };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };

    configFile = ./xmrig-config.json;
  in
  {
    packages.${system}.default = pkgs.writeShellApplication {
      name = "mine";

      runtimeInputs = [ pkgs.xmrig ];

      text = ''
        exec xmrig -c ${configFile}
      '';
    };

    apps.${system}.default = {
      type = "app";
      program = "${self.packages.${system}.default}/bin/mine";
    };
  };
}
