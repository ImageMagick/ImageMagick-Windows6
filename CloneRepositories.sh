#/bin/bash

clone_repository()
{
  echo ''
  echo "Cloning $3"

  branch="master"
  if [ ! -z "$4" ]; then
    branch="$4"
  fi

  dir="$3"
  if [ ! -z "$5" ]; then
    dir="$5"
  fi

  if [ "$2" == "full" ]; then
    if [ ! -d "$dir" ]; then
      git clone -b $branch $1/$3.git $dir
    fi
    cd $dir
    git pull
    cd ..
  else
    if [ ! -d "$dir" ]; then
      git clone -b $branch --depth 1 $1/$3.git $dir
    fi
  fi
  cd $dir
  git show --oneline -s
  cd ..
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
  cp -R externals/flif VisualMagick
  cp -R externals/freetype VisualMagick
  cp -R externals/glib VisualMagick
  cp -R externals/iptcutil VisualMagick
  cp -R externals/jbig VisualMagick
  cp -R externals/jp2 VisualMagick
  cp -R externals/jpeg VisualMagick
  cp -R externals/lcms VisualMagick
  cp -R externals/libde265 VisualMagick
  cp -R externals/libheif VisualMagick
  cp -R externals/liblzma VisualMagick
  cp -R externals/libraw VisualMagick
  cp -R externals/librsvg VisualMagick
  cp -R externals/libxml VisualMagick
  cp -R externals/lqr VisualMagick
  cp -R externals/openjpeg VisualMagick
  cp -R externals/pango VisualMagick
  cp -R externals/PerlMagick VisualMagick
  cp -R externals/pixman VisualMagick
  cp -R externals/png VisualMagick
  cp -R externals/tiff VisualMagick
  cp -R externals/webp VisualMagick
  cp -R externals/zlib VisualMagick
}

clone_repository $1 $2 'bzlib'
clone_repository $1 $2 'cairo'
clone_repository $1 $2 'contrib' 'contrib-6'
clone_repository $1 $2 'croco'
clone_repository $1 $2 'dcraw'
clone_repository $1 $2 'exr'
clone_repository $1 $2 'ffi'
clone_repository $1 $2 'flif'
clone_repository $1 $2 'freetype'
clone_repository $1 $2 'glib'
clone_repository $1 $2 'ImageMagick6' master 'ImageMagick'
clone_repository $1 $2 'jbig'
clone_repository $1 $2 'jp2'
clone_repository $1 $2 'jpeg-turbo' 'master' 'jpeg'
clone_repository $1 $2 'lcms'
clone_repository $1 $2 'libde265'
clone_repository $1 $2 'libheif'
clone_repository $1 $2 'liblzma'
clone_repository $1 $2 'libraw'
clone_repository $1 $2 'librsvg'
clone_repository $1 $2 'libxml'
clone_repository $1 $2 'lqr'
clone_repository $1 $2 'openjpeg'
clone_repository $1 $2 'pango'
clone_repository $1 $2 'pixman'
clone_repository $1 $2 'png'
clone_repository $1 $2 'tiff'
clone_repository $1 $2 'VisualMagick' 'VisualMagick-6'
clone_repository $1 $2 'webp'
clone_repository $1 $2 'win2k' 'win2k-6'
clone_repository $1 $2 'zlib'

clone_repository $1 $2 'VisualMagick' 'master' 'externals'
copy_externals
