{ pkgs, inputs, ... }:
let
  packages.apple-color-font = pkgs.stdenvNoCC.mkDerivation
    {
      name = "Apple Color Emoji";
      dontConfigue = true;
      src = inputs.apple-emoji;
      phases = [ "installPhase" ];
      installPhase = ''
        mkdir -p $out/share/fonts/Apple\ Color\ Emoji
        cp -R $src/ $out/share/fonts/Apple\ Color\ Emoji
      '';
      meta = { description = "The Apple Color Emoji Font Family derivation."; };
    };
in
{
  home.packages = [ packages.apple-color-font ];
  home.file.apple-emoji-font = {
    target = ".config/fontconfig/conf.d/apple-emoji.conf";
    text = ''
      <?xml version="1.0"?>
      <!DOCTYPE fontconfig SYSTEM "fonts.dtd">
      <fontconfig>
        <!-- Use Apple Emojis -->
        <match target="pattern">
          <test qual="any" name="family"><string>Apple Color Emoji</string></test>
          <edit name="family" mode="assign" binding="same"><string>Apple Color Emoji</string></edit>
        </match>
      </fontconfig>
    '';
  };
}
