# Build a package using `makepkg`.
build PACKAGE:
  cd {{PACKAGE}} && makepkg --force --clean --syncdeps --log

# Build a package using `extra-x86_64-build`.
dev-build PACKAGE:
  cd {{PACKAGE}} && extra-x86_64-build

# Clear all build outputs.
clean PACKAGE:
  cd {{PACKAGE}} && rm -rfv *tar.gz *.pkg.tar* *.log
