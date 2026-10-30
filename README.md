# 🎓 Bộ Tiện Ích Sư Phạm 3-Trong-1: Slide Bài Giảng PPTX → Lời Bình & Video MP4 → Web Video Tương Tác E-Learning (+ Video Khởi Động Veo 3)

**Phiên bản:** `v2.0.0`  
**Tác giả:** Thầy Nguyễn Văn Thiện — Trường THCS Ứng Hòe  
**Mục tiêu:** Cung cấp bộ công cụ độc lập, tự động hóa khép kín 100% giúp giáo viên phổ thông chuẩn bị trọn bộ **Slide PowerPoint chuẩn sư phạm $\to$ Lời bình & Lồng tiếng AI $\to$ Video bài giảng MP4 Full HD $\to$ Trang Web Video Tương Tác E-Learning đưa lên Netlify** (kèm kịch bản Video khởi động bài học Veo 3) theo chuẩn **GDPT 2018** và **Công văn 5512/BGDĐT**.

---

## 🌟 3 TÍNH NĂNG ĐỘC QUYỀN TRONG BỘ CÀI NÀY

### 1. 📊 Soạn Slide PowerPoint (PPTX 16:9) → Viết Lời Bình → Lồng Tiếng AI → Xuất Video MP4 Full HD
- **Bóc tách tự động** hình ảnh gốc và nội dung từ file Giáo án Word (`.docx`), Sách giáo khoa PDF (`.pdf`) hoặc ảnh chụp.
- **Lọc sạch 100% slide hành chính rườm rà** (Mục tiêu, Năng lực, Yêu cầu cần đạt...), đi thẳng vào trục sư phạm 3 bước trực quan: *Quan sát kênh hình / SGK $\to$ Câu hỏi thảo luận phát vấn $\to$ Khung Em cần ghi nhớ (chốt kiến thức ghi vở)*.
- **Font Times New Roman 100%**, cỡ chữ to rõ, công thức Toán học **Native OMML vector** chỉnh sửa trực tiếp trong PowerPoint.
- **Viết lời bình truyền cảm vào Notes**, lồng tiếng AI giọng phát thanh viên (**Cô Hoài My / Thầy Nam Minh** qua `LONG_TIENG_AI.bat`), tự động đo mốc giây từng slide (`_SlideTimeline.json`) và kết xuất **Video bài giảng `.mp4` Full HD 1080p** (`XUAT_VIDEO_TU_PPTX.bat`).

### 2. 🌐 Tạo Trang Web Video Tương Tác E-Learning & Đưa Lên Web Netlify (30 Giây)
- Tạo trực tiếp từ **Video `.mp4` vừa xuất từ PPTX**, từ **Link YouTube bài giảng**, hoặc làm **trọn gói từ con số 0 chỉ với file Giáo án Word / Sách giáo khoa**.
- **Khóa chống tua nhanh 100%** (tự động kéo ngược về vị trí cũ nếu học sinh cố tua; khóa YouTube chạy ngầm khi đang mở câu hỏi).
- **4 dạng câu hỏi tương tác hiện đại** chạy mượt trên cả điện thoại và máy tính: Trắc nghiệm 4 lựa chọn (`MCQ`), Đúng/Sai 1-chạm (`TF`), Điền đáp án số/chữ (`Fill`), Chạm/Ghép thẻ (`Drag/Tap`).
- **Quy tắc sư phạm Mastery Gate ($\ge$ 80%):** Học sinh trả lời **SAI tuyệt đối không lộ hộp Giải thích** (chỉ hiện nút `⏪ Xem lại 30s bài giảng`); chỉ khi tự suy nghĩ trả lời **ĐÚNG** mới mở `💡 Hướng dẫn & Giải thích` và cộng trọn `+1 điểm` hoàn thành trạm.
- **Sổ điểm Google Sheets thời gian thực:** Tự động tách tab riêng cho từng lớp (`6A`, `6B`, `7A1`...) và thống kê điểm trung bình.
- **Bảo mật & Đổi mật khẩu Chế độ Thầy Cô 1-click:** Ẩn hoàn toàn gợi ý mật khẩu trên giao diện học sinh, đổi mật khẩu trong 1 giây bằng `DOI_MAT_KHAU_THAY_CO.bat`, kèm hướng dẫn từng bước đưa lên **Netlify**!

### 3. 🎬 Tạo Kịch Bản & Prompt Veo 3 Cho Video Khởi Động Bài Học (60–80s)
- Lên ý tưởng sư phạm kích thích tò mò (Hook) không lộ trước đáp án bài học.
- Đồng nhất 100% diện mạo và trang phục nhân vật thầy/cô giáo (`Character Consistency Seed`).
- Đóng gói chuẩn **Single Code Block** cho mỗi clip 10 giây (bấm Copy 1 lần dán thẳng vào Veo 3 / Kling / Runway), tuân thủ quy tắc No-Text và vượt bộ lọc an toàn chính sách.

---

## 🚀 HƯỚNG DẪN CÀI ĐẶT 2 BƯỚC (CHỈ LÀM 1 LẦN DUY NHẤT)

1. Nhấp đúp chuột vào **`1_CAI_DAT_MOI_TRUONG.bat`** để tự động kiểm tra Python và cài đặt toàn bộ thư viện cần thiết.
2. Nhấp đúp chuột vào **`2_NAP_VAO_ANTIGRAVITY.bat`** để tự động nạp bộ tiện ích vào Google Antigravity.
3. Mở **Google Antigravity** lên và gõ lệnh trải nghiệm ngay:
   - `"Tôi muốn làm slide bài giảng từ giáo án này"`
   - `"Tôi có file pptx rồi, viết lời bình và xuất video giúp tôi"`
   - `"Tôi muốn tạo video tương tác"` hoặc `"Làm video tương tác từ giáo án word / sách giáo khoa"`
   - `"Tôi muốn thay đổi mật khẩu chế độ thầy cô"`
   - `"Tôi muốn tạo kịch bản video mở đầu bài học"`

*(Khi có bản nâng cấp mới trên GitHub, Thầy/Cô chỉ cần nhấp đúp **`3_CAP_NHAT_TINH_NANG_MOI.bat`** hoặc nhắn `"cập nhật tính năng mới"` trong khung chat!)*

---

## 📂 CẤU TRÚC THƯ MỤC BỘ TIỆN ÍCH
```text
tao-slide-va-video-khoi-dong/
├── 1_CAI_DAT_MOI_TRUONG.bat        # [Bước 1] Cài đặt Python & thư viện tự động 1-click
├── 2_NAP_VAO_ANTIGRAVITY.bat        # [Bước 2] Nạp tiện ích vào Google Antigravity 1-click
├── 3_CAP_NHAT_TINH_NANG_MOI.bat     # Cập nhật tính năng mới nhất từ GitHub 1-click
├── LONG_TIENG_AI.bat                # Kéo thả PPTX để lồng tiếng AI phát thanh viên
├── XUAT_VIDEO_TU_PPTX.bat           # Kéo thả PPTX để xuất video bài giảng MP4 Full HD
├── DOI_MAT_KHAU_THAY_CO.bat         # Kéo thả thư mục bài giảng để đổi mật khẩu Thầy Cô 1-click
├── DAY_LEN_GITHUB_MOI.bat           # [Dành cho Tác giả] Liên kết & đẩy lên kho GitHub mới 1-click
├── SKILL.md                         # Bộ chỉ dẫn AI toàn diện 3-trong-1
├── HUONG_DAN_CHO_GIAO_VIEN.txt      # Cẩm nang hướng dẫn sử dụng chi tiết cho Giáo viên
├── README.md                        # Tài liệu tổng quan trên GitHub
├── version.json                     # Quản lý phiên bản & lịch sử nâng cấp
├── templates/
│   └── video_tuong_tac_template.html  # Master Template Web Video Tương Tác E-Learning
├── references/
│   └── tao_video_tuong_tac.md       # Quy trình kỹ thuật Video Tương Tác & Google Sheets Apps Script
└── scripts/
    ├── boc_tach_tai_lieu.py         # Bóc tách hình ảnh gốc và văn bản từ DOCX & PDF
    ├── tao_slide_chuan.py           # Khởi tạo Slide PowerPoint 16:9 chuẩn sư phạm
    ├── patch_fonts.py               # Đồng bộ 100% font chữ Times New Roman
    ├── them_loi_binh_pptx.py        # Tự động nạp lời bình giảng dạy vào Speaker Notes
    ├── long_tieng_pptx.py           # Lồng tiếng AI Edge-TTS & xuất bảng mốc giây _SlideTimeline.json
    ├── xuat_video_pptx.py           # Kết xuất Video bài giảng MP4 Full HD 1080p từ PowerPoint
    ├── interactive_video_builder.py # Đóng gói Web Video Tương Tác Netlify & Đổi mật khẩu Thầy Cô
    ├── updater.py                   # Tự động cập nhật phiên bản mới từ GitHub
    └── link_new_github.py           # Tự động liên kết và đẩy mã nguồn lên GitHub mới
```
