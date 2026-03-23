# MySociety Entry - App Icon Setup Guide

## Steps to Configure App Icons and Logo

### 1. **Place Logo Asset**

- Copy your MySocietyEntry logo file (PNG or SVG)
- Paste it into: `assets/logo/`
- Rename it to: `mysociety_logo.png` (or update `flutter_launcher_icons.yaml` to match your filename)
- Recommended: 512x512 pixels or larger for best quality

### 2. **Get Dependencies**

```bash
flutter pub get
```

### 3. **Generate App Icons (Automatic)**

Single command to generate all icon sizes for Android and iOS:

```bash
flutter pub run flutter_launcher_icons
```

This will automatically create:

- **Android**: ic_launcher PNG files for all densities (mdpi, hdpi, xhdpi, xxhdpi, xxxhdpi)
- **iOS**: AppIcon.appiconset with all required sizes (20@2x, 20@3x, 29@2x, 29@3x, 40@2x, 40@3x, 60@2x, 60@3x, etc.)

### 4. **Verify Configuration Files**

**Configuration File**: `flutter_launcher_icons.yaml`

- Specifies Android and iOS icon generation
- Sets adaptive icon background color (#2563EB - Professional Blue)
- Configures iOS fill settings

**Updated pubspec.yaml**

- Added `flutter_launcher_icons: ^0.14.1` to dev_dependencies
- Asset path configured: `assets/logo/` for logo access in app

### 5. **Verify Installation**

```bash
flutter clean
flutter pub get
```

### 6. **Run/Build App**

```bash
flutter run
# or
flutter build apk
flutter build ios
```

## What Gets Updated

### ✅ Android Changes

- `android/app/src/main/res/mipmap-mdpi/ic_launcher.png`
- `android/app/src/main/res/mipmap-hdpi/ic_launcher.png`
- `android/app/src/main/res/mipmap-xhdpi/ic_launcher.png`
- `android/app/src/main/res/mipmap-xxhdpi/ic_launcher.png`
- `android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png`
- `android/app/src/main/res/mipmap-anydpi-v33/ic_launcher.xml` (Adaptive icon - Android 13+)
- `android/app/src/main/AndroidManifest.xml` (auto-updated icon reference)

### ✅ iOS Changes

- `ios/Runner/Assets.xcassets/AppIcon.appiconset/` - All icon sizes
- `ios/Runner/Assets.xcassets/AppIcon.appiconset/Contents.json` - Icon metadata

### ✅ Splash Screen Integration

- Logo now displays in header of splash screen
- Configured in: `lib/features/splash/presentation/pages/splash_screen.dart`
- LogoWidget used with 60px size (reduced for header)
- Positioned between Language Selector and Close button

## File Structure After Setup

```
assets/
  logo/
    mysociety_logo.png          ← Your logo file (place here)

android/app/src/main/res/
  mipmap-mdpi/
    ic_launcher.png             ← Generated
  mipmap-hdpi/
    ic_launcher.png             ← Generated
  mipmap-xhdpi/
    ic_launcher.png             ← Generated
  mipmap-xxhdpi/
    ic_launcher.png             ← Generated
  mipmap-xxxhdpi/
    ic_launcher.png             ← Generated
  mipmap-anydpi-v33/
    ic_launcher.xml             ← Generated (Android 13+)

ios/Runner/Assets.xcassets/AppIcon.appiconset/
  Contents.json                 ← Auto-updated
  [various icon files]          ← Generated

flutter_launcher_icons.yaml     ← Configuration file (created)
pubspec.yaml                    ← Updated with flutter_launcher_icons
```

## Configuration Details

**Color Scheme for Adaptive Icons (Android 8+)**

- Background: #2563EB (Professional Blue)
- Foreground: Your logo
- Creates professional appearance on modern Android devices

**iOS Icon Settings**

- iOS uses the provided logo as the app icon
- Fill mode: enabled for optimal display
- Apple will generate rounded corners automatically

## Troubleshooting

1. **Icon not updating?**
   - Run: `flutter clean`
   - Run: `flutter pub get`
   - Run: `flutter pub run flutter_launcher_icons`

2. **Logo file not found?**
   - Ensure file is in `assets/logo/` folder
   - Check filename matches `image_path` in `flutter_launcher_icons.yaml`
   - Run `flutter pub get` to refresh asset cache

3. **SVG to PNG conversion?**
   - If you have an SVG file, use an online tool or:
     ```bash
     # Using ImageMagick (if installed)
     convert mysociety_logo.svg -background white -density 300 mysociety_logo.png
     ```
   - Or use GIMP, Figma, or Inkscape to export as PNG

## Next Steps

1. Place your logo file in `assets/logo/` as `mysociety_logo.png`
2. Run `flutter pub run flutter_launcher_icons`
3. Run `flutter clean && flutter pub get && flutter run`
4. Your app icon will now be visible on the home screen
5. Logo appears branded on the splash screen header

## Notes

- **Android**: Works on Android 5.0+ (API 21+)
- **iOS**: Works on iOS 11.0+
- **Adaptive Icons**: Only visible on Android 8.0+ (Oreo), older versions use standard icon
- **Logo on Splash Screen**: Automatically integrated, displays at 60x60px in header
