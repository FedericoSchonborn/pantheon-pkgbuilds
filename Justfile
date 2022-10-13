all := "xdg-desktop-portal-pantheon \
        evince-elementary \
        file-roller-elementary"

@_default:
  just --list

# Build all packages using `makepkg`.
build-all:
  just build {{ all }}

# Build one or more packages using `makepkg`.
build +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && makepkg --force --clean --syncdeps --log; \
    popd; \
  done

# Build all packages using `extra-x86_64-build`.
dev-build-all:
  just dev-build {{ all }}

# Build one or more packages using `extra-x86_64-build`.
dev-build +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && extra-x86_64-build; \
    popd; \
  done

# Clear all build outputs of all packages.
clean-all:
  just clean {{ all }}

# Clear all build outputs of one or more packages.
clean +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && rm -rfv *tar.gz *.pkg.tar* *.log; \
    popd; \
  done
