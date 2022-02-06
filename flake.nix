{
  description = "A very basic flake";

  outputs = { self, nixpkgs }:
  let pkgs = nixpkgs.legacyPackages.x86_64-linux;
  in
  {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.haskell = pkgs.haskellPackages.callPackage ./demo.nix { };

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

    devShell.x86_64-linux =
      pkgs.mkShell {
        buildInputs = with pkgs; [
          cabal2nix
          cabal-install
          hpack
        ];
      };
  };
}
