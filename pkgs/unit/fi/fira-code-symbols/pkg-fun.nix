# when changing this expression convert it from 'fetchzip' to 'stdenvNoCC.mkDerivation'
{ lib, fetchzip }:

(fetchzip {
  name = "fira-code-symbols-20160811";

  url = "https://github.com/tonsky/FiraCode/files/412440/FiraCode-Regular-Symbol.zip";

  sha256 = "19krsp22rin74ix0i19v4bh1c965g18xkmz1n55h6n6qimisnbkm";

  meta = with lib; {
    description = "FiraCode unicode ligature glyphs in private use area";
    longDescription = ''
      FiraCode uses ligatures, which some editors don’t support.
      This addition adds them as glyphs to the private unicode use area.
      See https://github.com/tonsky/FiraCode/issues/211.
    '';
    license = licenses.ofl;
    maintainers = [ maintainers.Profpatsch ];
    homepage = "https://github.com/tonsky/FiraCode/issues/211#issuecomment-239058632";
  };
}).overrideAttrs (_: {
  postFetch = ''
    mkdir -p $out/share/fonts
    unzip -j $downloadedFile -d $out/share/fonts/opentype
  '';
})
