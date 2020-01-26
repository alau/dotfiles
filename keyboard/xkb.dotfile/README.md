To add this keyboard mapping to the one selectable in system config:

1. Symlink `/usr/share/X11/xkb/symbols/alau` to `$HOME/.xkb/symbols/alau`
2. Add the following to `/usr/share/X11/xkb/rules/evdev.xml`

```xml
<layout>
  <configItem>
    <name>alau</name>
    <shortDescription>en</shortDescription>
    <description>English (custom programmer Dvorak)</description>
    <languageList>
       <iso639Id>eng</iso639Id>
    </languageList>
  </configItem>
  <variantList>
  </variantList>
</layout>
```

Finally clear the cache: `sudo rm /var/lib/xkb/*.xkm`
