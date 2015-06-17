#/bin/bash

clone_repository()
{
  echo ''
  echo "Cloning $2"

  branch="master"
  if [ ! -z "$3" ]; then
    branch="$3"
  fi

  dir="$2"
  if [ ! -z "$4" ]; then
    dir="$4"
  fi

  if [ "$1" == "full" ]; then
    if [ ! -d "$dir" ]; then
      git clone -b $branch https://github.com/ImageMagick/$2.git $dir
    fi
    cd $dir
    git pull
    cd ..
  else
    if [ ! -d "$dir" ]; then
      git clone -b $branch --depth 1 https://github.com/ImageMagick/$2.git $dir
    fi
  fi
}

copy_externals()
{
  cp -R externals/bzlib VisualMagick
  cp -R externals/cairo VisualMagick
  cp -R externals/configure VisualMagick
  cp -R externals/croco VisualMagick
  cp -R externals/dcraw VisualMagick
  cp -R externals/exr VisualMagick
  cp -R externals/ffi VisualMagick
  cp -R externals/glib VisualMagick
  cp -R externals/iptcutil VisualMagick
  cp -R externals/jbig VisualMagick
  cp -R externals/jp2 VisualMagick
  cp -R externals/jpeg VisualMagick
  cp -R externals/lcms VisualMagick
  cp -R externals/librsvg VisualMagick
  cp -R externals/libxml VisualMagick
  cp -R externals/lqr VisualMagick
  cp -R externals/openjpeg VisualMagick
  cp -R externals/pango VisualMagick
  cp -R externals/PerlMagick VisualMagick
  cp -R externals/pixman VisualMagick
  cp -R externals/png VisualMagick
  cp -R externals/tiff VisualMagick
  cp -R externals/ttf VisualMagick
  cp -R externals/webp VisualMagick
  cp -R externals/zlib VisualMagick
}

clone_repository $1 'bzlib'
clone_repository $1 'cairo'
clone_repository $1 'contrib' 'contrib-6'
clone_repository $1 'croco'
clone_repository $1 'exr'
clone_repository $1 'ffi'
clone_repository $1 'glib'
clone_repository $1 'ImageMagick' 'ImageMagick-6'
clone_repository $1 'jbig'
clone_repository $1 'jp2'
clone_repository $1 'jpeg'
clone_repository $1 'lcms'
clone_repository $1 'librsvg'
clone_repository $1 'libxml'
clone_repository $1 'lqr'
clone_repository $1 'openjpeg'
clone_repository $1 'pango'
clone_repository $1 'pixman'
clone_repository $1 'png'
clone_repository $1 'tiff'
clone_repository $1 'ttf'
clone_repository $1 'VisualMagick' 'VisualMagick-6'
clone_repository $1 'webp'
clone_repository $1 'win2k' 'win2k-6'
clone_repository $1 'zlib'

clone_repository $1 'VisualMagick' 'master' 'externals'
copy_externals
