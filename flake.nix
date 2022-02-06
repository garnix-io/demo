{
  description = "A very basic flake";

  outputs = { self, nixpkgs }: {

    packages.x86_64-linux.hello = nixpkgs.legacyPackages.x86_64-linux.hello;

    packages.x86_64-linux.haskell = nixpkgs.legacyPackages.x86_64-linux.hello;

    defaultPackage.x86_64-linux = self.packages.x86_64-linux.hello;

    devShell.x86_64-linux =
      let pkgs = nixpkgs.legacyPackages.x86_64-linux;
      in
      pkgs.mkShell {
        buildInputs = with pkgs; [
          cabal2nix
          cabal-install
          hpack
        ];
      };
  };
}
