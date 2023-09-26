#/bin/bash

clone_repository()
{
  echo ''
  echo "Cloning $3"

  branch="main"
  dir="$3"
  if [ ! -z "$4" ]; then
    dir="$4"
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
  cp -R externals/aom VisualMagick
  cp -R externals/bzlib VisualMagick
  cp -R externals/cairo VisualMagick
  cp -R externals/configure VisualMagick
  cp -R externals/croco VisualMagick
  cp -R externals/dcraw VisualMagick
  cp -R externals/de265 VisualMagick
  cp -R externals/deflate VisualMagick
  cp -R externals/exr VisualMagick
  cp -R externals/ffi VisualMagick
  cp -R externals/flif VisualMagick
  cp -R externals/freetype VisualMagick
  cp -R externals/fribidi VisualMagick
  cp -R externals/glib VisualMagick
  cp -R externals/heif VisualMagick
  cp -R externals/harfbuzz VisualMagick
  cp -R externals/iptcutil VisualMagick
  cp -R externals/jasper VisualMagick
  cp -R externals/jbig VisualMagick
  cp -R externals/jpeg-turbo VisualMagick
  cp -R externals/lcms VisualMagick
  cp -R externals/lqr VisualMagick
  cp -R externals/lzma VisualMagick
  cp -R externals/OpenCL VisualMagick
  cp -R externals/openjpeg VisualMagick
  cp -R externals/pango VisualMagick
  cp -R externals/PerlMagick VisualMagick
  cp -R externals/pixman VisualMagick
  cp -R externals/png VisualMagick
  cp -R externals/raqm VisualMagick
  cp -R externals/raw VisualMagick
  cp -R externals/rsvg VisualMagick
  cp -R externals/tiff VisualMagick
  cp -R externals/webp VisualMagick
  cp -R externals/xml VisualMagick
  cp -R externals/zlib VisualMagick
}

clone_imagemagick()
{
  if [ ! -d "../ImageMagick" ]; then
    clone_repository $1 $2 'ImageMagick6' 'ImageMagick'
  else
    cp -R ../ImageMagick ImageMagick
  fi
}

if [ "$2" == "source" ]; then
  mkdir -p "source"
  cd "source"
fi

clone_repository $1 $2 'aom'
clone_repository $1 $2 'bzlib'
clone_repository $1 $2 'cairo'
clone_repository $1 $2 'contrib6' 'contrib'
clone_repository $1 $2 'croco'
clone_repository $1 $2 'dcraw'
clone_repository $1 $2 'de265'
clone_repository $1 $2 'deflate'
clone_repository $1 $2 'exr'
clone_repository $1 $2 'ffi'
clone_repository $1 $2 'flif'
clone_repository $1 $2 'freetype'
clone_repository $1 $2 'fribidi'
clone_repository $1 $2 'glib'
clone_repository $1 $2 'harfbuzz'
clone_repository $1 $2 'heif'
clone_repository $1 $2 'jasper'
clone_repository $1 $2 'jbig'
clone_repository $1 $2 'jpeg-turbo'
clone_repository $1 $2 'lcms'
clone_repository $1 $2 'lzma'
clone_repository $1 $2 'lqr'
clone_repository $1 $2 'openjpeg'
clone_repository $1 $2 'pango'
clone_repository $1 $2 'pixman'
clone_repository $1 $2 'png'
clone_repository $1 $2 'raqm'
clone_repository $1 $2 'raw'
clone_repository $1 $2 'rsvg'
clone_repository $1 $2 'tiff'
clone_repository $1 $2 'VisualMagick6' 'VisualMagick'
clone_repository $1 $2 'webp'
clone_repository $1 $2 'win2k6' 'win2k'
clone_repository $1 $2 'xml'
clone_repository $1 $2 'zlib'

clone_repository $1 $2 'VisualMagick' 'externals'
copy_externals

clone_imagemagick $1 $2

if [ "$2" == "source" ]; then
  for folder in *; do
    if [ -d "$folder" ]; then
       cd $folder
       rm -Rf .git
       cd ..
    fi
  done
fi

