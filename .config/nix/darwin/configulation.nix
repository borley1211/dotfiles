{ pkgs, lib, inputs, ... }:
# inputs.self, inputs.nix-darwin, inputs.nixpkgs にここからアクセスできる
{ pkgs, lib, ... }:
{
  system = {
    stateVersion = 6;
    # mac のユーザー名
    # `whoami` で確認可能
    primaryUser = "<ユーザー名>";
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = "aarch64-darwin";
  };

  homebrew = {
    enable = true;
    onActivation.cleanup = "none";
    # `brew tap` で確認可能
    taps = [ ];
    # `brew list --formula` で確認可能
    brews = [
      "git"
      "gnu-time"
    ];
    # `brew list --cask` で確認可能
    casks = [
      "claude"
      "visual-studio-code"
    ];
  };
}
