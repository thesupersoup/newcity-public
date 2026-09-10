echo ""
echo "#################"
echo "#### PACKAGE  ###"
echo "#################"
echo ""

$startDir = Get-Location

Remove-Item -Path "./NewCity" -Recurse -Force
New-Item -ItemType "Directory" -Path "./NewCity"

# Designs
$pathArr = "./src/data","./src/designs","./src/shaders","./src/locale","./src/contributors","./src/docs"

Copy-Item -Path $pathArr -Destination "NewCity/" -Recurse -Force


# Textures
New-Item -ItemType "Directory" -Path "./NewCity/textures"
New-Item -ItemType "Directory" -Path "./NewCity/textures/buildings"
New-Item -ItemType "Directory" -Path "./NewCity/textures/vehicles"
New-Item -ItemType "Directory" -Path "./NewCity/textures/stoplights"
New-Item -ItemType "Directory" -Path "./NewCity/textures/palette"

Copy-Item -Path "./src/textures/*.png" -Destination "./NewCity/textures"
Copy-Item -Path "./src/textures/stoplights/*.png" -Destination "./NewCity/textures/stoplights/"
Copy-Item -Path "./src/textures/buildings/*.png" -Destination "./NewCity/textures/buildings/"
Copy-Item -Path "./src/textures/palette/*.png" -Destination "./NewCity/textures/palette/"
Copy-Item -Path "./src/textures/vehicles/*.png" -Destination "./NewCity/textures/vehicles/"


# Models
New-Item -ItemType "Directory" -Path "./NewCity/models"
New-Item -ItemType "Directory" -Path "./NewCity/models/vehicles"
New-Item -ItemType "Directory" -Path "./NewCity/models/decorations"
New-Item -ItemType "Directory" -Path "./NewCity/models/statues"

Copy-Item -Path "./src/models/vehicles/*.obj" -Destination "./NewCity/models/vehicles/"
Copy-Item -Path "./src/models/decorations/*.obj" -Destination "./NewCity/models/decorations/"
Copy-Item -Path "./src/models/statues/*.obj" -Destination "./NewCity/models/statues/"


# Font(s)
New-Item -ItemType "Directory" -Path "./NewCity/fonts"

Copy-Item -Path "./src/fonts/font.ttf" -Destination "./NewCity/fonts/"


# Sounds and Music
New-Item -ItemType "Directory" -Path "./NewCity/sound"
New-Item -ItemType "Directory" -Path "./NewCity/sound/environment"
New-Item -ItemType "Directory" -Path "./NewCity/sound/music"

Copy-Item -Path "./src/sound/*.ogg" -Destination "./NewCity/sound/"
Copy-Item -Path "./src/sound/environment/*.ogg" -Destination "./NewCity/sound/environment/"
Copy-Item -Path "./src/sound/music/*.ogg" -Destination "./NewCity/sound/music/"


# Newspaper Stuff
New-Item -ItemType "Directory" -Path "./NewCity/newspaper"
New-Item -ItemType "Directory" -Path "./NewCity/newspaper/images"
New-Item -ItemType "Directory" -Path "./NewCity/newspaper/ads"

Copy-Item -Path "./src/newspaper/articles.lua" -Destination "./NewCity/newspaper/"
Copy-Item -Path "./src/newspaper/*.md" -Destination "./NewCity/newspaper/"
Copy-Item -Path "./src/newspaper/images/*.png" -Destination "./NewCity/newspaper/images/"
Copy-Item -Path "./src/newspaper/ads/*.md" -Destination "./NewCity/newspaper/ads/"


# Mod foundation
New-Item -ItemType "Directory" -Path "./NewCity/modpacks"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/data"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/designs"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/fonts"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/locale"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/locale/us"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/shaders"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/sounds"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/sounds/environment"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/sounds/music"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/textures"
New-Item -ItemType "Directory" -Path "./NewCity/modpacks/yours/textures/buildings"

Copy-Item -Path "./src/data/constants.lua" -Destination "./NewCity/modpacks/yours/data/"
Copy-Item -Path "./src/modpacks/yours/preview.png" -Destination "./NewCity/modpacks/yours/"


# Other mods
Copy-Item -Path "./src/modpacks/vapor" -Destination "./NewCity/modpacks/vapor" -Recurse -Force
Copy-Item -Path "./src/modpacks/saturate" -Destination "./NewCity/modpacks/saturate" -Recurse -Force
Copy-Item -Path "./src/modpacks/performance" -Destination "./NewCity/modpacks/performance" -Recurse -Force
Copy-Item -Path "./src/modpacks/Classic" -Destination "./NewCity/modpacks/Classic" -Recurse -Force
Copy-Item -Path "./src/modpacks/Sandbox" -Destination "./NewCity/modpacks/Sandbox" -Recurse -Force


# Save setup
New-Item -ItemType "Directory" -Path "./NewCity/saves"
New-Item -ItemType "File" -Path "./NewCity/saves/.keep"

# Log setup
"This file intentionally left blank" | Out-File -FilePath "./NewCity/game_log.log"

# Executable and scripts
Copy-Item -Path "./src/newcity.exe" -Destination "./NewCity/"
Copy-Item -Path "./src/newcity-wine.sh" -Destination "./NewCity/"
Copy-Item -Path "./src/newcity-linux.sh" -Destination "./NewCity/"
Copy-Item -Path "./src/eula.txt" -Destination "./NewCity/"
Copy-Item -Path "./lib/OpenAl32.dll" -Destination "./NewCity/"
Copy-Item -Path "./src/official_blueprints.txt" -Destination "./NewCity/"

echo ""
echo "################"
echo "####   ZIP   ###"
echo "################"
echo ""

Set-Location -Path "./NewCity"
Compress-Archive -Path "./*" -DestinationPath "./NewCity.zip"

Set-Location $startDir
