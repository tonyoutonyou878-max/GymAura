# Firebase Setup Guide for GymSense

This guide will help you integrate Firebase into the GymSense Flutter application.

## Prerequisites

- Flutter SDK installed
- Firebase account (free tier is sufficient)
- Android Studio or VS Code
- FlutterFire CLI

## Step 1: Create Firebase Project

1. Go to [Firebase Console](https://console.firebase.google.com/)
2. Click **"Create a project"** or **"Add project"**
3. Enter project name: `gymsense-app`
4. Disable Google Analytics (optional for now)
5. Click **Create Project**

## Step 2: Register Your App

### For Android:

1. In Firebase Console, click **Android icon**
2. Enter Android package name: `com.example.gymsense` (or your package name from `android/app/build.gradle`)
3. Enter app nickname: `GymSense Android`
4. Click **Register app**
5. Download `google-services.json`
6. Place it in `android/app/` directory

### For iOS (if deploying):

1. Click **iOS icon** in Firebase Console
2. Enter iOS bundle ID from `ios/Runner.xcodeproj`
3. Download `GoogleService-Info.plist`
4. Place it in `ios/Runner/` directory

## Step 3: Install FlutterFire CLI

\`\`\`bash
dart pub global activate flutterfire_cli
\`\`\`

## Step 4: Configure Firebase in Your Project

Run the following command in your project root:

\`\`\`bash
flutterfire configure
\`\`\`

This will:
- Create `firebase_options.dart` file
- Link your Flutter app to Firebase project
- Configure platforms automatically

## Step 5: Enable Firebase Services

### Authentication

1. Go to Firebase Console → **Authentication**
2. Click **Get Started**
3. Enable **Email/Password** sign-in method
4. Click **Save**

### Cloud Firestore

1. Go to Firebase Console → **Firestore Database**
2. Click **Create Database**
3. Select **Start in test mode** (for development)
4. Choose region closest to you
5. Click **Enable**

### Set Up Firestore Collections

Create these collections with the following structure:

#### Collection: `users`
\`\`\`
{
"name": "John Doe",
"email": "john@example.com",
"age": 25,
"fitnessGoal": "Muscle Gain",
"createdAt": Timestamp,
"updatedAt": Timestamp
}
\`\`\`

#### Collection: `workouts`
\`\`\`
{
"name": "Chest Day",
"exercises": 5,
"duration": 45,
"difficulty": "Intermediate",
"caloriesBurned": 320,
"muscleGroups": ["Chest", "Shoulders", "Triceps"],
"description": "Focus on chest development",
"createdAt": Timestamp
}
\`\`\`

#### Collection: `products`
\`\`\`
{
"name": "Whey Protein",
"price": 2499.99,
"category": "Supplements",
"imageUrl": "",
"description": "High quality whey protein",
"rating": 4.5,
"stock": 100
}
\`\`\`

#### Collection: `orders`
\`\`\`
{
"userId": "user_id_here",
"items": [
{
"productId": "prod_id",
"name": "Product Name",
"price": 999.99,
"quantity": 2
}
],
"totalAmount": 1999.98,
"status": "pending",
"createdAt": Timestamp
}
\`\`\`

#### Collection: `progress`
\`\`\`
{
"userId": "user_id_here",
"weight": 75.5,
"date": "2024-01-15",
"notes": "Feeling stronger",
"createdAt": Timestamp
}
\`\`\`

### Firestore Security Rules

1. Go to **Firestore → Rules**
2. Update rules for development:

\`\`\`javascript
rules_version = '2';
service cloud.firestore {
match /databases/{database}/documents {
// Users can only read/write their own data
match /users/{userId} {
allow read, write: if request.auth != null && request.auth.uid == userId;
}

    // Anyone authenticated can read workouts
    match /workouts/{workoutId} {
      allow read: if request.auth != null;
      allow write: if false; // Only admins via backend
    }
    
    // Anyone authenticated can read products
    match /products/{productId} {
      allow read: if request.auth != null;
      allow write: if false; // Only admins via backend
    }
    
    // Users can only read/write their own orders
    match /orders/{orderId} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
    
    // Users can only read/write their own progress
    match /progress/{progressId} {
      allow read, write: if request.auth != null && 
        resource.data.userId == request.auth.uid;
    }
}
}
\`\`\`

3. Click **Publish**

### Firebase Storage (Optional - for images)

1. Go to **Storage** in Firebase Console
2. Click **Get Started**
3. Start in test mode
4. Click **Done**

## Step 6: Update Android Configuration

Edit `android/app/build.gradle`:

\`\`\`gradle
apply plugin: 'com.android.application'
apply plugin: 'kotlin-android'
apply plugin: 'com.google.gms.google-services'  // Add this line

\`\`\`

Edit `android/build.gradle`:

\`\`\`gradle
buildscript {
dependencies {
// ... existing dependencies ...
classpath 'com.google.gms:google-services:4.3.15'  // Add this line
}
}
\`\`\`

## Step 7: Run the App

\`\`\`bash
flutter pub get
flutter run
\`\`\`

## Testing Firebase Integration

1. **Test Authentication:**
    - Register a new user
    - Check Firebase Console → Authentication → Users
    - User should appear in the list

2. **Test Firestore:**
    - Complete user profile setup
    - Check Firebase Console → Firestore → users collection
    - User data should be saved

3. **Test Orders:**
    - Add items to cart
    - Complete checkout
    - Check Firebase Console → Firestore → orders collection

## Troubleshooting

### Issue: "Default FirebaseApp not initialized"
**Solution:** Ensure `Firebase.initializeApp()` is called in `main()` before `runApp()`

### Issue: "google-services.json not found"
**Solution:** Verify the file is in `android/app/` directory and not in a subdirectory

### Issue: "Permission denied" in Firestore
**Solution:** Check Security Rules in Firebase Console and ensure they allow the operation

### Issue: Build fails after adding Firebase
**Solution:**
- Run `flutter clean`
- Run `flutter pub get`
- Rebuild the app

## Production Deployment

Before deploying to production:

1. **Update Firestore Rules:**
    - Change from test mode to production rules
    - Implement proper authentication checks

2. **Enable App Check:**
    - Protects your backend from abuse
    - Go to Firebase Console → App Check

3. **Set up Analytics:**
    - Enable Google Analytics in Firebase
    - Track user behavior and app performance

4. **Configure Email Templates:**
    - Customize authentication emails
    - Add your app logo and branding

## Additional Resources

- [FlutterFire Documentation](https://firebase.flutter.dev/)
- [Firebase Console](https://console.firebase.google.com/)
- [Firestore Security Rules](https://firebase.google.com/docs/firestore/security/rules-structure)
- [Firebase Authentication](https://firebase.google.com/docs/auth)

## Support

If you encounter issues:
1. Check Firebase Console for errors
2. Review Flutter logs: `flutter logs`
3. Verify all configuration files are in place
4. Ensure Firebase services are enabled in console

---

**Note:** This app uses Firebase with fallback to mock data. If Firebase is not configured, the app will still work with local mock data for development.
