# 🥩 Tech SAU BUFFET (sau_mukratha_app)

แอปพลิเคชันสำหรับร้านบุฟเฟต์หมูกระทะ **Tech SAU BUFFET** พัฒนาด้วย **Flutter** เพื่อช่วยคำนวณเงินค่าบุฟเฟต์ จัดการตัวเลือกเครื่องดื่ม คิดส่วนลดสมาชิก ถ่ายรูปบิลหรือหลักฐาน และแสดงรายการเมนูอาหารพร้อมแผนที่นำทางไปยังร้านสาขาในเครือ

---

## ✨ ฟังก์ชันการทำงานหลัก (Features)

### 1. 🚀 หน้าเริ่มต้น (Splash Screen)
- หน้าต้อนรับแสดงโลโก้ร้าน พร้อมแอนิเมชันสถานะกำลังโหลด (3 วินาที) ก่อนเข้าสู่หน้าหลัก
- แสดงลิขสิทธิ์ผู้พัฒนาและชื่อแอปพลิเคชัน

### 2. 🧮 ระบบคำนวณเงิน (Bill Calculation)
- **จำนวนลูกค้า**:
  - ผู้ใหญ่: 299 บาท / ท่าน
  - เด็ก: 69 บาท / ท่าน
  - มีช่องเปิด/ปิดการคำนวณแบบ Checkbox พร้อมระบุจำนวนคน
- **บุฟเฟต์น้ำดื่มและเครื่องดื่ม**:
  - ตัวเลือกบุฟเฟต์น้ำดื่ม: 25 บาท / ท่าน (คิดตามจำนวนคนรวม ผู้ใหญ่ + เด็ก)
  - ตัวเลือกสั่งแยก:
    - โค้ก: 20 บาท / ขวด
    - น้ำเปล่า: 15 บาท / ขวด
- **ระบบสมาชิกและส่วนลด (Member Discount)**:
  - ไม่เป็นสมาชิก: ลด 0%
  - สมาชิกทั่วไป: ลด 5%
  - สมาชิก VIP: ลด 20%
- **ระบบถ่ายภาพ (Camera Integration)**:
  - สามารถกดเปิดกล้องถ่ายภาพ (Image Picker) เพื่อแนบรูปภาพบิลหรือหลักฐานการชำระเงิน
- **หน้าแสดงยอดสุทธิ (Show Bill)**:
  - แสดงยอดเงินรวมหลังหักส่วนลดทั้งหมด

### 3. 🍲 เมนูแนะนำและร้านสาขาในเครือ (Menu & Branches)
- **เมนูเด็ด**: แสดงรายการภาพอาหารแนะนำแบบเลื่อนในแนวนอน (Horizontal Scroll)
- **ร้านในเครือ**: แสดงสาขาร้านต่างๆ ในแนวดิ่ง พร้อมระบบลิงก์เปิด **Google Maps** นำทางไปยังพิกัดจริงของแต่ละสาขาโดยอัตโนมัติ

### 4. ℹ️ เกี่ยวกับร้านและข้อมูลติดต่อ (About Us)
- แสดงข้อมูลแนะนำร้าน พัฒนาโดยนักศึกษาไอที มหาวิทยาลัยเอเชียอาคเนย์ (SAU)
- มีระบบกดที่รูป QR Code เพื่อโทรออกไปยังเบอร์ติดต่อของร้าน/ผู้พัฒนาได้ทันที (`tel:0616345824`)

---

## 📐 สูตรการคำนวณเงิน (Pricing & Calculation Logic)

$$\text{ยอดรวมก่อนลด} = (299 \times \text{ผู้ใหญ่}) + (69 \times \text{เด็ก}) + (20 \times \text{โค้ก}) + (15 \times \text{น้ำเปล่า}) + \text{ค่าน้ำบุฟเฟต์}$$

> โดยที่ $\text{ค่าน้ำบุฟเฟต์} = 25 \times (\text{ผู้ใหญ่} + \text{เด็ก})$ (กรณีเลือกรับบุฟเฟต์น้ำดื่ม)

$$\text{ยอดรวมสุทธิ (Total)} = \text{ยอดรวมก่อนลด} - (\text{ยอดรวมก่อนลด} \times \text{อัตราส่วนลด})$$

---

## 🛠️ เทคโนโลยีและเครื่องมือที่ใช้ (Tech Stack)

- **Framework**: [Flutter](https://flutter.dev/) (Dart SDK ^3.6.1)
- **UI Design**: Material Design, [Google Fonts (Kanit)](https://pub.dev/packages/google_fonts)
- **Navigation Bar**: [animated_notch_bottom_bar](https://pub.dev/packages/animated_notch_bottom_bar)
- **Icons**: [font_awesome_flutter](https://pub.dev/packages/font_awesome_flutter), Cupertino Icons
- **Hardware & External Services**:
  - [image_picker](https://pub.dev/packages/image_picker): สำหรับเปิดกล้องถ่ายภาพบิล
  - [url_launcher](https://pub.dev/packages/url_launcher): สำหรับเปิดลิงก์ Google Maps และโทรออก

---

## 📁 โครงสร้างโปรเจกต์ (Project Structure)

```text
sau_mukratha_app/
├── android/                 # โฟลเดอร์ตั้งค่า Native Android
├── assets/
│   └── images/              # รูปภาพประกอบ, เมนู, โลโก้ และร้านสาขา
│       ├── camera.jpg
│       ├── img1.png - img7.png
│       ├── logo.png
│       ├── saulogo.png
│       ├── sauqr.png
│       └── shop1.png - shop5.png
├── lib/
│   ├── main.dart            # จุดเริ่มต้นแอปพลิเคชัน (Entry point) และกำหนดธีม
│   └── views/
│       ├── splash_screen_ui.dart  # หน้า Splash Screen
│       ├── home_ui.dart           # หน้าหลัก ควบคุม Bottom Navigation Bar
│       ├── cal_bill_ui.dart       # หน้าคำนวณเงินและเลือกแพ็กเกจ
│       ├── show_bill_ui.dart      # หน้าแสดงยอดสรุปบิล
│       ├── menu_ui.dart           # หน้าแสดงเมนูแนะนำและสาขาร้าน
│       └── about_ui.dart          # หน้าเกี่ยวกับร้านและช่องทางติดต่อ
├── pubspec.yaml             # รายการ Dependencies และ Asset configuration
└── README.md                # เอกสารประกอบโปรเจกต์
```

---

## 🚀 วิธีการติดตั้งและเริ่มใช้งาน (Getting Started)

### ความต้องการของระบบ (Prerequisites)
- ติดตั้ง [Flutter SDK](https://docs.flutter.dev/get-started/install) (เวอร์ชัน 3.6.1 ขึ้นไป)
- ติดตั้ง [Android Studio](https://developer.android.com/studio) หรือ [VS Code](https://code.visualstudio.com/) พร้อม Flutter Extension
- อุปกรณ์จริง (เชื่อมต่อผ่าน USB Debugging) หรือ Android Emulator

### ขั้นตอนการรันแอปพลิเคชัน
1. **Clone หรือดาวน์โหลดโปรเจกต์นี้**:
   ```bash
   git clone <repository-url>
   cd sau_mukratha_app
   ```

2. **ดาวน์โหลด Packages และ Dependencies**:
   ```bash
   flutter pub get
   ```

3. **ตรวจสอบความพร้อมของอุปกรณ์**:
   ```bash
   flutter devices
   ```

4. **สั่งรันแอปพลิเคชัน**:
   ```bash
   flutter run
   ```

---

## 👩‍💻 ผู้พัฒนา (Developer)

- **ผู้พัฒนา**: Kanyada (เด็กไอที SAU)
- **สถาบัน**: มหาวิทยาลัยเอเชียอาคเนย์ (Southeast Asia University - SAU)
- **ปีที่พัฒนา**: 2025
- **เบอร์โทรติดต่อ**: 061-634-5824
