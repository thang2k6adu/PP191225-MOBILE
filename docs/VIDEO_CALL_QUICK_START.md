# 🚀 Quick Start - Video Call Feature

## Cách sử dụng Video Call trong app

### 1️⃣ Điều hướng đến Matchmaking Screen

Từ bất kỳ screen nào trong app, navigate đến Video Call Matchmaking:

```dart
import 'package:pp191225/presentation/video_call/screens/video_call_matchmaking_screen.dart';

// Example: From a button click
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallMatchmakingScreen(
          accessToken: 'your-jwt-token-here', // Get from auth
          userName: 'John Doe', // Optional
        ),
      ),
    );
  },
  child: const Text('Start Video Call'),
),
```

### 2️⃣ Hoặc sử dụng với GoRouter

Nếu bạn muốn thêm vào router:

```dart
// In lib/routers/app_router.dart
GoRoute(
  path: '/video-call',
  builder: (context, state) {
    final token = state.extra as String; // Pass token via extra
    return VideoCallMatchmakingScreen(
      accessToken: token,
      userName: 'Current User', // Get from user profile
    );
  },
),
```

Và sử dụng:

```dart
context.push('/video-call', extra: 'your-jwt-token');
```

---

## 📋 Flow hoàn chỉnh

### User Journey:

1. **User clicks "Start Video Call"**
   - Navigate to `VideoCallMatchmakingScreen`
   
2. **Auto connect to WebSocket**
   - Screen tự động kết nối đến WebSocket server
   - Hiển thị "Connecting to server..."
   
3. **User clicks "Start Matchmaking"**
   - Emit event `join-matchmaking` lên server
   - Hiển thị loading: "Searching for opponent..."
   
4. **Server finds match**
   - Receive event `match_found` với LiveKit token
   - Auto navigate to `VideoCallScreen`
   
5. **Video call starts**
   - Auto connect to LiveKit room
   - Enable camera & microphone
   - Show local video (small) + remote video (fullscreen)
   
6. **During call**
   - User có thể toggle camera on/off
   - User có thể toggle microphone on/off
   - User có thể switch camera (front/back)
   
7. **End call**
   - User clicks "End Call" button
   - Disconnect from LiveKit
   - Emit `leave-room` to server
   - Navigate back to previous screen

---

## ⚙️ Configuration Required

### 1. Update WebSocket URL

File: [lib/presentation/video_call/controllers/video_call_controller.dart](lib/presentation/video_call/controllers/video_call_controller.dart#L137)

```dart
final result = _connectWebSocketUseCase(
  url: 'http://your-backend-url:3000', // ⚠️ Update này
  token: token,
);
```

**Recommended**: Add to constants

```dart
// lib/core/constants/api_constants.dart
class ApiConstants {
  static const String webSocketUrl = 'ws://your-backend-url:3000';
  // ...
}
```

### 2. Get Access Token

Lấy JWT token từ authentication flow:

```dart
// Example: Get from auth state
final token = await ref.read(authRepositoryProvider).getAccessToken();

// Or from secure storage
final token = await ref.read(authLocalDataSourceProvider).getAccessToken();
```

---

## 🧪 Testing

### Test với 2 devices:

1. **Device 1**:
   ```
   - Login as User A
   - Navigate to Video Call
   - Click "Start Matchmaking"
   - Wait...
   ```

2. **Device 2**:
   ```
   - Login as User B
   - Navigate to Video Call
   - Click "Start Matchmaking"
   - Match found! 🎉
   ```

3. **Both devices**:
   ```
   - Video call screen appears
   - Can see each other's video
   - Test camera/mic toggles
   - Test end call
   ```

---

## 📱 UI Screenshots (Mô tả)

### Matchmaking Screen
```
┌─────────────────────────────┐
│  Video Call Matchmaking     │
├─────────────────────────────┤
│                             │
│        📹 (Icon)            │
│                             │
│   Ready to find a match?    │
│ Start a video call with a   │
│      random person          │
│                             │
│  [Start Matchmaking]        │
│                             │
└─────────────────────────────┘
```

### Searching State
```
┌─────────────────────────────┐
│  Video Call Matchmaking     │
├─────────────────────────────┤
│                             │
│        ⏳ (Loading)         │
│                             │
│  Searching for opponent...  │
│       Please wait           │
│                             │
│      [Cancel]               │
│                             │
└─────────────────────────────┘
```

### Video Call Screen
```
┌─────────────────────────────┐
│  Jane Doe              📞   │
├─────────────────────────────┤
│                             │
│   [Remote Video Fullscreen] │
│                             │
│          ┌──────┐           │
│          │Local │           │
│          │Video │           │
│          └──────┘           │
│                             │
├─────────────────────────────┤
│  📹   🎤   🔄   📞         │
│ Camera Mic Flip  End        │
└─────────────────────────────┘
```

---

## 🐛 Troubleshooting

### Lỗi: "WebSocket connection failed"
- ✅ Check backend server đang chạy
- ✅ Check URL đúng (ws:// or wss://)
- ✅ Check token còn valid

### Lỗi: "Camera permission denied"
- ✅ Check AndroidManifest.xml có permissions
- ✅ Check Info.plist có permissions
- ✅ Request permissions lại trong app settings

### Lỗi: "Failed to connect video call"
- ✅ Check LiveKit server đang chạy
- ✅ Check LiveKit URL đúng
- ✅ Check token valid và chưa expired

### Video không hiển thị
- ✅ Check camera permissions granted
- ✅ Check camera not being used by another app
- ✅ Check LiveKit room connected

---

## 🎯 Example Integration in Main App

### Option 1: Button in Profile Screen

```dart
// lib/presentation/profile/screens/profile_screen.dart

ElevatedButton.icon(
  onPressed: () async {
    final token = await ref.read(authLocalDataSourceProvider).getAccessToken();
    if (token != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallMatchmakingScreen(
            accessToken: token,
            userName: currentUser.name,
          ),
        ),
      );
    }
  },
  icon: const Icon(Icons.videocam),
  label: const Text('Start Video Call'),
),
```

### Option 2: Floating Action Button in Main Screen

```dart
// lib/presentation/main/screens/main_screen.dart

floatingActionButton: FloatingActionButton.extended(
  onPressed: () async {
    final token = await ref.read(authLocalDataSourceProvider).getAccessToken();
    if (token != null && context.mounted) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VideoCallMatchmakingScreen(
            accessToken: token,
            userName: ref.read(currentUserProvider).value?.name,
          ),
        ),
      );
    }
  },
  icon: const Icon(Icons.video_call),
  label: const Text('Video Call'),
),
```

### Option 3: Bottom Navigation Tab

```dart
// Add to your bottom navigation
BottomNavigationBarItem(
  icon: const Icon(Icons.videocam),
  label: 'Video Call',
),

// In onTap handler
case 3: // Video Call tab
  final token = await ref.read(authLocalDataSourceProvider).getAccessToken();
  if (token != null && context.mounted) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VideoCallMatchmakingScreen(
          accessToken: token,
        ),
      ),
    );
  }
  break;
```

---

## ✅ Ready to Use!

Tất cả đã sẵn sàng. Chỉ cần:
1. ✅ Update WebSocket URL
2. ✅ Get access token from auth
3. ✅ Navigate to screen
4. ✅ Test!

Happy coding! 🚀
