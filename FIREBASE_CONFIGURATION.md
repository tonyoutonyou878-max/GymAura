# Firebase Configuration Complete

## Project Details

Your GymSense app is now connected to Firebase with the following configuration:

- **Project ID**: gymsense-13ab0
- **Project Number**: 505049022506
- **Storage Bucket**: gymsense-13ab0.firebasestorage.app
- **Package Name**: com.gymsense.gymsense
- **API Key**: AIzaSyBGSFD9P9ZTyGoPWzejfybgYi4mmLeblyE

## Files Configured

1. **android/app/google-services.json** - Android Firebase configuration
2. **lib/firebase_options.dart** - Flutter Firebase options for all platforms

## Next Steps to Complete Firebase Setup

### 1. Enable Firebase Services in Console

Go to [Firebase Console](https://console.firebase.google.com/project/gymsense-13ab0) and enable:

#### Authentication
1. Go to **Authentication** → **Sign-in method**
2. Enable **Email/Password**
3. Click **Save**

#### Firestore Database
1. Go to **Firestore Database**
2. Click **Create database**
3. Select **Start in test mode** (for development)
4. Choose your region (e.g., us-central1)
5. Click **Enable**

#### Cloud Storage
1. Go to **Storage**
2. Click **Get started**
3. Select **Start in test mode**
4. Choose same region as Firestore
5. Click **Done**

### 2. Create Firestore Collections

In Firestore, create these collections:

#### Collection: `users`
\`\`\`
Document structure:
- name: string
- email: string
- age: number
- weight: number
- height: number
- fitnessGoal: string
- createdAt: timestamp
  \`\`\`

#### Collection: `workouts`
\`\`\`
Document structure:
- userId: string
- name: string
- duration: number
- calories: number
- difficulty: string
- exercises: array
- completedAt: timestamp
  \`\`\`

#### Collection: `diet_plans`
\`\`\`
Document structure:
- userId: string
- age: number
- totalCalories: number
- protein: number
- carbs: number
- fats: number
- meals: array
- createdAt: timestamp
  \`\`\`

#### Collection: `orders`
\`\`\`
Document structure:
- userId: string
- items: array
- totalAmount: number
- status: string
- createdAt: timestamp
  \`\`\`

#### Collection: `progress`
\`\`\`
Document structure:
- userId: string
- weight: number
- date: timestamp
- notes: string
  \`\`\`

### 3. Set Firestore Security Rules

Go to **Firestore** → **Rules** and add:

\`\`\`javascript
rules_version = '2';
service cloud.firestore {
match /databases/{database}/documents {
// Users can read/write their own data
match /users/{userId} {
allow read, write: if request.auth != null && request.auth.uid == userId;
}

    // Users can read/write their own workouts
    match /workouts/{workoutId} {
      allow read, write: if request.auth != null && 
                            resource.data.userId == request.auth.uid;
    }
    
    // Users can read/write their own diet plans
    match /diet_plans/{planId} {
      allow read, write: if request.auth != null && 
                            resource.data.userId == request.auth.uid;
    }
    
    // Users can read/write their own orders
    match /orders/{orderId} {
      allow read, write: if request.auth != null && 
                            resource.data.userId == request.auth.uid;
    }
    
    // Users can read/write their own progress
    match /progress/{progressId} {
      allow read, write: if request.auth != null && 
                            resource.data.userId == request.auth.uid;
    }
    
    // Everyone can read products (for e-commerce)
    match /products/{productId} {
      allow read: if true;
      allow write: if request.auth != null;
    }
}
}
\`\`\`

### 4. Set Storage Security Rules

Go to **Storage** → **Rules** and add:

\`\`\`javascript
rules_version = '2';
service firebase.storage {
match /b/{bucket}/o {
match /user_images/{userId}/{allPaths=**} {
allow read: if request.auth != null;
allow write: if request.auth != null && request.auth.uid == userId;
}

    match /equipment_scans/{allPaths=**} {
      allow read, write: if request.auth != null;
    }
}
}
\`\`\`

### 5. Run the App

Now you can run your GymSense app:

\`\`\`bash
cd gymsense_app
flutter pub get
flutter run
\`\`\`

### 6. Test Firebase Connection

1. **Register a new user** - Check if user appears in Firebase Authentication
2. **Login** - Verify authentication works
3. **Update profile** - Check if data saves to Firestore `users` collection
4. **Complete a workout** - Verify workout saves to `workouts` collection
5. **Generate diet plan** - Check if plan saves to `diet_plans` collection
6. **Place an order** - Verify order saves to `orders` collection

## Troubleshooting

### Error: "FirebaseException: [firebase_auth/app-not-authorized]"
**Solution**: Make sure Email/Password authentication is enabled in Firebase Console

### Error: "FirebaseException: [permission-denied]"
**Solution**: Check Firestore security rules allow authenticated users to read/write

### Error: "google-services.json not found"
**Solution**: Make sure google-services.json is in `android/app/` directory

### Error: "Default FirebaseApp is not initialized"
**Solution**: Ensure `Firebase.initializeApp()` is called in main.dart before runApp()

## Firebase Console Links

- **Project Dashboard**: https://console.firebase.google.com/project/gymsense-13ab0
- **Authentication**: https://console.firebase.google.com/project/gymsense-13ab0/authentication
- **Firestore**: https://console.firebase.google.com/project/gymsense-13ab0/firestore
- **Storage**: https://console.firebase.google.com/project/gymsense-13ab0/storage

## Support

For additional help, refer to:
- [Firebase Flutter Documentation](https://firebase.google.com/docs/flutter/setup)
- [FlutterFire Documentation](https://firebase.flutter.dev/)

---

**Firebase Setup Complete!** Your GymSense app is now connected to Firebase services.
