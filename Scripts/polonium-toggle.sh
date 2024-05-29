#!/bin/bash
current=$(kreadconfig5 --file kwinrc --group Plugins --key poloniumEnabled)

if [ $current = "true" ]; then
    kwriteconfig5 --file kwinrc --group Plugins --key poloniumEnabled false
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__Nordic
    # kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_shapecornersEnabled false
    qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.unloadEffect kwin4_effect_shapecorners
    notify-send "Floating" "Polonium disabled"

elif [ $current = "false" ]; then
    kwriteconfig5 --file kwinrc --group Plugins --key poloniumEnabled true
    kwriteconfig5 --file kwinrc --group org.kde.kdecoration2 --key theme __aurorae__svg__ActiveAccentFrame
    # kwriteconfig5 --file kwinrc --group Plugins --key kwin4_effect_shapecornersEnabled ""
    # sed -i "/kwin4_effect_shapecornersEnabled/d" /home/arch/.config/kwinrc
    qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.loadEffect kwin4_effect_shapecorners
    notify-send "Tiling" "Polonium enabled"
fi

qdbus org.kde.KWin /KWin reconfigure


# kwin4_effect_shapecornersEnabled=false
# qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.activeEffects
# qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.isEffectLoaded kwin4_effect_shapecorners
# qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.toggleEffect kwin4_effect_shapecorners
# qdbus org.kde.ShapeCorners /Effects org.kde.kwin.Effects.loadEffect kwin4_effect_shapecorners
