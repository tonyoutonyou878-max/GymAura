# GymSense - AI-Powered Smart Gym Companion

A premium Flutter application for Android that provides personalized gym workouts, AI equipment detection, progress tracking, and an e-commerce store.

## Features

- **Splash Screen** - Animated entry screen with smooth transitions
- **Onboarding** - 4-step guided onboarding with feature highlights
- **Authentication** - Login and registration screens with validation
- **User Profile Setup** - Personalized fitness goal and age setup
- **Home Dashboard** - Quick actions, activity tracking, and recommendations
- **AI Equipment Scanner** - Mock scanner for detecting gym equipment with form guidance
- **Workout Recommendations** - Personalized workouts based on fitness level
- **Progress Tracking** - Monitor weight, calories, and workout history
- **E-Commerce Store** - Browse and purchase fitness products
- **Shopping Cart** - Full cart management with quantity and pricing
- **Bottom Navigation** - 4-tab navigation (Home, Scanner, Store, Profile)
- **Admin Dashboard** - System overview and management tools

## Theme

- **Primary Color**: Gold (#FFD700)
- **Secondary Color**: Black (#000000)
- **Accent**: White
- **Typography**: Poppins Font

## Project Structure

\`\`\`
lib/
├── main.dart
├── theme/
│   └── app_theme.dart
├── models/
│   ├── workout_model.dart
│   ├── user_model.dart
│   ├── product_model.dart
│   └── admin_model.dart
├── providers/
│   ├── auth_provider.dart
│   ├── workout_provider.dart
│   └── shop_provider.dart
├── services/
│   └── workout_service.dart
├── screens/
│   ├── splash_screen.dart
│   ├── onboarding_screen.dart
│   ├── login_screen.dart
│   ├── registration_screen.dart
│   ├── profile_setup_screen.dart
│   ├── home_screen.dart
│   ├── equipment_scanner_screen.dart
│   ├── equipment_detail_screen.dart
│   ├── workout_recommendation_screen.dart
│   ├── progress_screen.dart
│   ├── store_screen.dart
│   ├── cart_screen.dart
│   ├── profile_screen.dart
│   ├── analytics_screen.dart
│   └── admin_screen.dart
└── widgets/
├── gold_gradient_card.dart
└── custom_app_bar.dart
\`\`\`

## Getting Started

1. **Install Flutter**: https://flutter.dev/docs/get-started/install
2. **Clone Repository**: `git clone <repo-url>`
3. **Install Dependencies**: `flutter pub get`
4. **Run App**: `flutter run`

## Dependencies

- `provider` - State management
- `google_fonts` - Custom typography
- `intl` - Internationalization
- `http` - HTTP requests (placeholder for backend)
- `shared_preferences` - Local storage
- `hive` - Local database (placeholder)
- `image_picker` - Camera/gallery access
- `lottie` - Animations
- `flutter_svg` - SVG support

## Backend Integration (Placeholder)

All backend calls are mocked. To integrate real services:

1. **Authentication**: Replace mock login/register in `auth_provider.dart`
2. **Workouts**: Update `workout_service.dart` with API calls
3. **Products**: Add product API in a new `product_service.dart`
4. **Analytics**: Create `analytics_service.dart` for data

## Future Enhancements

- Real Firebase integration for authentication
- AI model integration for equipment detection
- Real-time progress tracking with backend
- Payment gateway integration
- Social features and community
- Wearable device integration
- Video tutorial integration

## Notes

- No Firebase integration yet (use mock services)
- All images are placeholders
- Admin page is a stub for future expansion
- Mock data is hardcoded for demo purposes

## License

Proprietary - GymSense

## Contact

For support and inquiries, contact the development team.
