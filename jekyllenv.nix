with (import <nixos-unstable> { });
let
  gems = pkgs.bundlerEnv {
    name = "gems-for-some-project";
    gemdir = ./.;
  };
in
pkgs.mkShell {
  packages = [ gems gems.wrappedRuby ];
}
