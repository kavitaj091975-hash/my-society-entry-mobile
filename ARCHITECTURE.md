# MySociety - Splash Screen Implementation

## Project Structure (Clean Architecture)

```
lib/
├── core/                           # Core utilities and configurations
│   └── theme/
│       └── app_theme.dart         # App theme configuration
│
├── features/                       # Feature decomposition
│   └── splash/                     # Splash screen feature
│       ├── presentation/           # UI Layer (Platform-specific)
│       │   ├── pages/
│       │   │   └── splash_screen.dart    # Main splash screen page
│       │   ├── widgets/
│       │   │   ├── welcome_card.dart     # Individual welcome card widget
│       │   │   └── splash_buttons.dart   # Back/Next buttons widget
│       │   └── providers/
│       │       └── splash_provider.dart  # Riverpod state management
│       │
│       ├── domain/                 # Business Logic Layer
│       │   └── entities/
│       │       └── welcome_slide.dart    # Core entity (independent of framework)
│       │
│       └── data/                   # Data Layer
│           └── models/
│               └── welcome_slide_model.dart  # Model extending entity
│
└── main.dart                       # App entry point with Riverpod
```

## Features

✨ **Three Bordered Welcome Screens**

- Custom bordered icon containers with different colors
- Smooth animations between screens
- Clean typography and layout

🔄 **Page Swipe Navigation**

- Horizontal page swiping with PageView
- Synchronized page index with Riverpod state
- Smooth transitions (300ms duration)

📍 **Progress Indicator**

- Smooth page indicator using `smooth_page_indicator` package
- Dots animation effect
- Real-time page tracking

🔘 **Back/Next Buttons**

- Back button disabled on first slide
- Next button changes to "Done" on last slide
- Styled with custom borders and colors

## State Management (Riverpod)

### Providers

```dart
// Current page tracking
final currentPageProvider = StateProvider<int>

// Welcome slides data
final welcomeSlidesProvider = Provider<List<WelcomeSlide>>

// Track splash completion
final splashCompletedProvider = StateProvider<bool>
```

## Architecture Benefits

### Clean Architecture Principles

1. **Separation of Concerns**
   - Presentation: UI components and page logic
   - Domain: Business entities (framework-agnostic)
   - Data: Models and data transformation

2. **Testability**
   - Each layer can be tested independently
   - Entities are pure Dart classes with no framework dependencies

3. **Maintainability**
   - Clear folder structure
   - Easy to add new features with same structure
   - Centralized state management with Riverpod

4. **Scalability**
   - Easy to replace data sources
   - Can add repositories and use cases later
   - Support for multiple implementations

## Riverpod Benefits

- ✅ Compile-safe dependency injection
- ✅ Easy state tracking and updates
- ✅ Type-safe providers
- ✅ Hot reload support
- ✅ Testable state management

## Usage

### Run the app

```bash
flutter pub get
flutter run
```

### Customize Welcome Slides

Edit `lib/features/splash/data/models/welcome_slide_model.dart`:

```dart
static List<WelcomeSlide> getSampleSlides() {
  return [
    WelcomeSlideModel(
      id: 0,
      title: 'Your Title',
      description: 'Your Description',
      icon: Icons.your_icon,
      borderColor: Color(0xFFYourColor),
    ),
    // ... more slides
  ];
}
```

### Customize Colors and Styling

Edit `lib/core/theme/app_theme.dart` for global theme changes.

### Add Additional Features

To add a new feature, create a similar folder structure:

```
features/your_feature/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── providers/
├── domain/
│   └── entities/
└── data/
    └── models/
```

## Next Steps

1. Integrate with your home page navigation
2. Add onboarding data persistence (SharedPreferences/Hive)
3. Create a repository layer for data management
4. Add animations for page transitions
5. Implement analytics tracking
