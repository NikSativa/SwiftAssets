#!/bin/bash

script_full_path=$(dirname "$0")

ASSETS_PATH=""
ASSETS_OUTPUT=""
ASSETS_SPEC_OUTPUT=""

L10N_PATH=""
L10N_OUTPUT=""
L10N_SPEC_OUTPUT=""

for i in "$@"; do
	case $i in
	    -a=*|-assets=*)
			ASSETS_PATH="${i#*=}"
	    ;;
	    +lo|+l10n)
			ASSETS_OUTPUT="${i#*=}"
		;;
	    +ls|+l10nspec)
			ASSETS_SPEC_OUTPUT="${i#*=}"
		;;
	esac
done

echo ASSETS_PATH
echo ASSETS_OUTPUT
echo ASSETS_SPEC_OUTPUT

exit

###############################################

sh $script_full_path/download_swiftgen.sh
SWIFTGEN_PATH=$script_full_path/3rdparty/swiftgen/bin/swiftgen

###############################################

$SWIFTGEN_PATH run xcassets $ASSETS_PATH --output $ASSETS_OUTPUT -p "Assets.stencil" \
--param publicAccess=public \
--param forceProvidesNamespaces=false \
--param forceFileNameEnum=false \
--param imageTypeName=HiddenImage \
--param imageAliasName=ImageAlias \
--param colorTypeName=HiddenColor \
--param colorAliasName=ColorAlias \
--param indentSpace="    "

$SWIFTGEN_PATH run xcassets $ASSETS_PATH --output $ASSETS_SPEC_OUTPUT -p "AssetsSpec.stencil" \
--param publicAccess=public \
--param forceProvidesNamespaces=false \
--param forceFileNameEnum=false \
--param imageTypeName=HiddenImage \
--param imageAliasName=ImageAlias \
--param colorTypeName=HiddenColor \
--param colorAliasName=ColorAlias \
--param indentSpace="    "

###############################################

$SWIFTGEN_PATH run strings $L10N_PATH --output $L10N_OUTPUT -p "L10n.stencil" \
--param publicAccess=public \
--param showTranslation=true \
--param indentSpace="    "

$SWIFTGEN_PATH run strings $L10N_PATH --output $L10N_SPEC_OUTPUT -p "L10nSpec.stencil" \
--param publicAccess=public \
--param showTranslation=true \
--param indentSpace="    "
