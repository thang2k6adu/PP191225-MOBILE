# Hướng dẫn quản lý SHA1 debug keystore trên Linux/Fedora

## 1. SHA1 debug mặc định

Debug keystore mặc định trên Linux/Fedora nằm ở:

```
~/.android/debug.keystore
```

Bạn có thể kiểm tra SHA1/SHA256 hiện tại bằng lệnh:

```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Kết quả sẽ hiển thị SHA1, SHA256, ngày hết hạn…

---

## 2. Backup hoặc xóa debug keystore cũ

Nếu muốn giữ lại keystore cũ, bạn có thể backup:

```bash
mv ~/.android/debug.keystore ~/.android/debug.keystore.bak
```

Hoặc xóa luôn nếu không cần:

```bash
rm ~/.android/debug.keystore
```

---

## 3. Tạo debug keystore mới

Chạy lệnh sau để tạo keystore mới với SHA1 khác:

```bash
keytool -genkey -v \
  -keystore ~/.android/debug.keystore \
  -storepass android \
  -keypass android \
  -alias androiddebugkey \
  -keyalg RSA \
  -keysize 2048 \
  -validity 10000 \
  -dname "CN=Android Debug,O=Android,C=US"
```

* `-validity 10000` là số ngày keystore hợp lệ (~27 năm)
* `-dname` để đặt thông tin certificate

---

## 4. Kiểm tra SHA1/SHA256 mới

Sau khi tạo keystore mới, kiểm tra SHA1 và SHA256 bằng lệnh:

```bash
keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android
```

Bây giờ SHA1 sẽ khác hoàn toàn so với keystore cũ.

---

**Lưu ý:**

* Debug keystore mặc định được Android Studio và Flutter dùng để build debug.
* Nếu muốn Firebase nhận SHA1 mới, bạn cần cập nhật SHA1 này trong console Firebase cho debug app.
