{
  config,
  pkgs,
  lib,
  myvars,
  ...
}: let
  dotrepo = myvars.dotfiles.repo;
  dotpath = "${config.home.homeDirectory}/${myvars.dotfiles.homepath}";
  setupScript = "setup.sh";
in {
  home.activation.dotfiles = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${dotpath}" ] || [ -z "$(ls -A "${dotpath}" 2>/dev/null)" ]; then
      echo "Cloning dotfiles repository..."
      "${pkgs.git}/bin/git" clone --depth 1 "${dotrepo}" "${dotpath}" || {
        echo "git clone failed"
        exit 1
      }
      chmod +x "${dotpath}/${setupScript}" 2>/dev/null || true
      cd "${dotpath}" && ./$(basename "${setupScript}") || echo "Setup script failed"
    else
      echo "Dotfiles already exist, attempting update..."
      if [ -d "${dotpath}/.git" ]; then
        "${pkgs.git}/bin/git" -C "${dotpath}" pull --ff-only || echo "git pull failed, leaving existing files"
      else
        echo "Existing directory is not a git repo, skipping update."
      fi
    fi
  '';
}