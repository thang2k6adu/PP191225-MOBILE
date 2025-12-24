# Matchmaking Debug Guide

## Vấn đề hiện tại
User 2 match được nhưng User 1 vẫn đang "Finding opponent"

## Flow mong đợi (theo backend doc)

```
1. User 1: Connect WebSocket
2. User 1: POST /matchmaking/join → WAITING
3. User 2: Connect WebSocket  
4. User 2: POST /matchmaking/join → MATCHED
5. Server: Broadcast 'match_found' event → CẢ 2 users (User 1 & User 2)
6. Cả 2 users nhận event và chuyển sang IN_ROOM
```

## Các bước debug

### 1. Kiểm tra logs khi User 1 connect

Tìm các logs sau trong console:

```
[MatchmakingController] build() called
[MatchmakingController] First time setup - creating match found subscription
[MatchmakingController] Setting up match found listener...
[MatchmakingController] Subscription created successfully
```

✅ Nếu thấy → Subscription được tạo OK
❌ Nếu không thấy → Có vấn đề với controller initialization

### 2. Kiểm tra logs khi User 1 join matchmaking

```
[MatchmakingController] Joining matchmaking...
[MatchmakingController] Entered WAITING state
```

✅ User 1 đã vào trạng thái WAITING

### 3. Kiểm tra logs khi User 2 join (User 1 phải nhận event)

**User 1 phải thấy logs sau:**

```
[Matchmaking WebSocket] ========================================
[Matchmaking WebSocket] MATCH_FOUND EVENT RECEIVED!
[Matchmaking WebSocket] Raw data: {roomId: xxx, opponentId: yyy, ...}
[Matchmaking WebSocket] Stream has listeners: true
[Matchmaking WebSocket] Adding to stream controller...
[Matchmaking WebSocket] Event added to stream successfully
```

Sau đó:

```
[MatchmakingRepository] Received DTO from data source: roomId=xxx
[ListenMatchFoundUseCase] Received either, isRight: true
[MatchmakingController] MATCH DATA RECEIVED IN CONTROLLER!
[MatchmakingController] State updated to: MatchmakingState.inRoom
```

## Các trường hợp lỗi thường gặp

### Lỗi 1: Không thấy "MATCH_FOUND EVENT RECEIVED"
**Nguyên nhân:** WebSocket không nhận được event từ server
**Kiểm tra:**
- WebSocket có connected không: `[Matchmaking WebSocket] Connected`
- Token có valid không
- Server có gửi event không (check server logs)

### Lỗi 2: Thấy "MATCH_FOUND EVENT RECEIVED" nhưng "Stream has listeners: false"
**Nguyên nhân:** Stream subscription chưa được setup hoặc bị dispose
**Fix:** 
- Kiểm tra `build()` có được gọi không
- Kiểm tra subscription có null không

### Lỗi 3: Event được add vào stream nhưng controller không nhận
**Nguyên nhân:** 
- Stream mapping bị lỗi
- Subscription bị cancel
**Kiểm tra:**
- Logs ở Repository layer
- Logs ở UseCase layer

### Lỗi 4: Controller nhận event nhưng state không update
**Nguyên nhân:** State update bị lỗi hoặc UI không rebuild
**Fix:** Check state management

## Test thủ công

### Với 2 devices/emulators:

1. **User 1:**
   ```
   - Mở app → Login
   - Vào Matchmaking screen
   - Quan sát logs: subscription được tạo
   - Nhấn "Find Match"
   - Quan sát: Chuyển sang WAITING state
   ```

2. **User 2:**
   ```
   - Mở app → Login  
   - Vào Matchmaking screen
   - Nhấn "Find Match"
   - Quan sát: Chuyển sang MATCHED ngay lập tức
   ```

3. **Kiểm tra User 1:**
   ```
   - Phải thấy logs "MATCH_FOUND EVENT RECEIVED"
   - UI phải chuyển sang MATCHED/IN_ROOM
   ```

## Checklist

- [ ] WebSocket connected thành công (cả 2 users)
- [ ] Stream subscription được tạo trước khi join matchmaking
- [ ] POST /matchmaking/join thành công (User 1 → WAITING)
- [ ] User 2 join → Server response MATCHED
- [ ] User 1 console có log "MATCH_FOUND EVENT RECEIVED"
- [ ] User 1 console có log "Stream has listeners: true"
- [ ] User 1 controller nhận được match data
- [ ] User 1 UI update sang IN_ROOM state

## Commands để chạy với logs

```bash
# Chạy flutter với logs đầy đủ
flutter run -v

# Hoặc filter logs matchmaking
flutter run 2>&1 | grep -i matchmaking
```

## Kiểm tra WebSocket connection

### Trong DevTools Console:

```dart
// Check stream controller has listeners
print(_matchFoundController.hasListener);

// Check socket connected
print(_socket?.connected);

// Check subscription is active  
print(_matchFoundSubscription != null);
```
