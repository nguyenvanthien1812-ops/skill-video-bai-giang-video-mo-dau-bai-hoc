# 🎓 Bộ Tiện Ích Sư Phạm: Soạn Slide Bài Giảng & Video Khởi Động

**Tác giả:** Thầy Nguyễn Văn Thiện — Trường THCS Ứng Hòe  
**Mục tiêu:** Cung cấp bộ công cụ độc lập, tự động hóa 100% giúp giáo viên phổ thông chuẩn bị bài giảng trực quan, hiện đại theo chuẩn GDPT 2018 và Công văn 5512/BGDĐT.

---

## 🌟 2 TÍNH NĂNG ĐỘC QUYỀN TRONG BỘ CÀI NÀY

### 1. 🎬 Tạo Kịch Bản & Prompt Veo 3 Cho Video Khởi Động (60–80s)
- Lên ý tưởng sư phạm, tình huống mở đầu kích thích tò mò (Hook).
- Đồng nhất 100% diện mạo và trang phục nhân vật thầy/cô giáo (Character Consistency Seed).
- Quy chuẩn Single Code Block cho mỗi clip 10 giây (giáo viên bấm Copy 1 lần nạp thẳng AI).
- Áp dụng triệt để quy tắc No-Text (chữ tiếng Việt chèn sau bằng CapCut sắc nét) và vượt bộ lọc an toàn chính sách.

### 2. 📊 Soạn Slide Bài Giảng PowerPoint (PPTX) Chuẩn Mực Sư Phạm
- Bóc tách tự động hình ảnh và nội dung từ file Word (.docx), PDF SGK hoặc ảnh chụp.
- Lọc sạch 100% slide hành chính rườm rà (Mục tiêu, Năng lực, Yêu cầu cần đạt...).
- Trục sư phạm 3 bước trực quan: *Kênh hình quan sát $\to$ Câu hỏi thảo luận phát vấn $\to$ Khung Em cần ghi nhớ (chốt kiến thức ghi vở)*.
- Font chữ Times New Roman 100%, cỡ chữ to rõ, công thức Toán học Native OMML vector chỉnh sửa trực tiếp trong PowerPoint.
- Tự động ghi lời bình vào Notes, hỗ trợ lồng tiếng AI phát thanh viên (Edge-TTS) và render video MP4 Full HD 1080p.

---

## 🚀 HƯỚNG DẪN CÀI ĐẶT 2 BƯỚC (1-CLICK)

1. Nhấp đúp chuột vào **`1_CAI_DAT_MOI_TRUONG.bat`** để tự động kiểm tra Python và cài đặt toàn bộ thư viện cần thiết.
2. Nhấp đúp chuột vào **`2_NAP_VAO_ANTIGRAVITY.bat`** để tự động nạp skill vào Google Antigravity.
3. Mở Google Antigravity lên và bắt đầu trải nghiệm!

---

## 📂 CẤU TRÚC THƯ MỤC
```
tao-slide-va-video-khoi-dong/
├── 1_CAI_DAT_MOI_TRUONG.bat       # Cài đặt Python & thư viện tự động
├── 2_NAP_VAO_ANTIGRAVITY.bat       # Nạp tiện ích vào Antigravity 1-click
├── SKILL.md                        # Bộ chỉ dẫn chuyên sâu cho AI
├── HUONG_DAN_CHO_GIAO_VIEN.txt     # Hướng dẫn chi tiết ngôn ngữ sư phạm
├── README.md                       # Tài liệu tổng quan
├── LONG_TIENG_AI.bat               # Kéo thả PPTX để lồng tiếng AI phát thanh viên
├── XUAT_VIDEO_TU_PPTX.bat          # Kéo thả PPTX để xuất video MP4 Full HD
└── scripts/
    ├── boc_tach_tai_lieu.py        # Bóc tách ảnh và chữ từ DOCX & PDF
    ├── them_loi_binh_pptx.py       # Nạp lời bình vào Notes của slide
    ├── long_tieng_pptx.py          # Lồng tiếng AI Edge-TTS tiếng Việt
    ├── xuat_video_pptx.py          # Xuất video bài giảng MP4 từ PowerPoint
    ├── patch_fonts.py              # Vá font toàn bộ file về Times New Roman
    └── tao_slide_chuan.py          # Script dựng khung slide mẫu 16:9
```
