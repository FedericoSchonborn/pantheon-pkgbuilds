@_default:
  just --list

# Build one or more packages using `makepkg`.
build +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && makepkg --force --clean --syncdeps --log; \
    popd; \
  done

# Build one or more packages using `extra-x86_64-build`.
dev-build +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && extra-x86_64-build; \
    popd; \
  done

# Clear all build outputs for one or more packages.
clean +PACKAGE:
  for package in {{ PACKAGE }}; do \
    pushd $package && rm -rfv *tar.gz *.pkg.tar* *.log; \
    popd; \
  done
