---
name: tao-slide-va-video-khoi-dong
description: >-
  Bộ công cụ kép 2-trong-1 chuyên biệt dành cho giáo viên:
  (1) Tạo kịch bản & prompt Veo 3 cho video khởi động bài học (warm-up video) 60–80 giây đồng nhất nhân vật;
  (2) Soạn slide PowerPoint (PPTX) bài giảng dạy học chuẩn mực sư phạm GDPT 2018 từ file Giáo án Word, SGK, PDF hay hình ảnh,
  tự động lọc sạch slide hành chính, đi thẳng vào tiến trình 3 bước trực quan (Quan sát kênh hình -> Thảo luận phát vấn -> Em cần ghi nhớ chốt ghi vở),
  font Times New Roman, cỡ chữ to rõ, công thức Toán OMML chỉnh sửa trực tiếp, hỗ trợ viết lời bình vào Notes, lồng tiếng AI Edge-TTS và xuất video bài giảng MP4 Full HD.
  Kích hoạt khi giáo viên yêu cầu:
  - Về Video khởi động: "tôi muốn tạo kịch bản video mở đầu bài học", "tôi muốn làm video", "tôi muốn viết kịch bản video", "tạo video bài học",
    "làm video khởi động", "viết prompt veo 3", "tạo kịch bản video", "làm video mở đầu bài", "tạo video mở đầu bài học", "tạo prompt video",
    "viết kịch bản cho video", "làm video cho bài học", "tôi cần video khởi động", "lên kịch bản video", "kịch bản video mở đầu".
  - Về Soạn Slide PPTX: "tôi muốn làm pptx", "tôi muốn tạo pptx", "tôi muốn làm slide", "tôi muốn tạo slide", "làm pptx", "tạo pptx",
    "làm slide", "tạo slide", "soạn slide", "tạo slide bài giảng", "làm pptx từ giáo án", "soạn slide khtn", "làm slide bài dạy",
    "tạo bài giảng pptx", "làm slide từ pdf", "tạo slide chuẩn sư phạm", "soạn pptx bài giảng", "làm pptx từ sách giáo khoa",
    "soạn bài giảng powerpoint", "tôi có kịch bản slide rồi", "làm theo kịch bản của tôi", "tôi đã soạn sẵn nội dung", "chỉ cần chèn ảnh vào slide",
    "làm slide toán", "soạn slide môn toán", "tạo slide công thức toán", "slide toán omml", "công thức toán slide", "soạn bài giảng toán",
    "tôi có file pptx rồi tôi muốn viết lời bình", "tôi có file pptx rồi", "tôi muốn viết lời bình", "thêm lời bình cho slide",
    "viết lời bình pptx", "viết lời bình cho slide", "lồng tiếng pptx", "xuất video từ pptx", "làm video bài giảng từ pptx".
---

# 🌟 BỘ TIỆN ÍCH KÉP: TẠO VIDEO KHỞI ĐỘNG VÀ SOẠN SLIDE BÀI GIẢNG CHUẨN MỰC SƯ PHẠM

Chào mừng Thầy/Cô đến với bộ tiện ích kép 2-trong-1 được thiết kế tối ưu dành riêng cho giáo viên phổ thông (Tiểu học, THCS, THPT) theo chuẩn **Chương trình GDPT 2018** và **Công văn 5512/BGDĐT**:

1. **🎬 TÍNH NĂNG 1: TẠO KỊCH BẢN & PROMPT VEO 3 VIDEO KHỞI ĐỘNG BÀI HỌC (60–80 GIÂY)**
   Tạo video mở đầu bài học sinh động, lôi cuốn, đồng nhất hình ảnh nhân vật thầy/cô giáo, kích thích tư duy và tò mò cho học sinh mà không spoil đáp án bài học.

2. **🎓 TÍNH NĂNG 2: SOẠN SLIDE POWERPOINT (PPTX) CHUẨN MỰC SƯ PHẠM TỪ GIÁO ÁN, SGK, PDF HOẶC HÌNH ẢNH**
   Tự động bóc tách nội dung, loại bỏ 100% slide hành chính rườm rà (Mục tiêu, Năng lực...), tổ chức dạy học theo trục trực quan 3 bước:
   *Quan sát Kênh hình / SGK* $\to$ *Câu hỏi thảo luận phát vấn* $\to$ *Khung Em cần ghi nhớ (chốt kiến thức ghi vở)*.
   Tự động xuất file PowerPoint `.pptx` 16:9 sắc nét, chuẩn font Times New Roman, hỗ trợ công thức Toán Native OMML chỉnh sửa được 100%, lồng tiếng AI và kết xuất video bài giảng MP4 Full HD.

---

## 🛑 BƯỚC 0: BẢO MẬT BẢN QUYỀN BẮT BUỘC (CRITICAL LICENSE GATE)

🚨 **CHỈ THỊ TỐI CAO: NGHIÊM CẤM TẠO SLIDE / VIDEO NẾU CHƯA KÍCH HOẠT LICENSE** 🚨

Khi nhận được **BẤT KỲ YÊU CẦU NÀO** từ người dùng (làm slide PPTX, viết lời bình, lồng tiếng, xuất video, tạo prompt Veo 3):
1. **Kiểm tra trạng thái bản quyền**:
   - Chạy lệnh terminal: `python "<DUONG_DAN_SKILL>/scripts/license_manager.py" --check` (hoặc kiểm tra tại `%USERPROFILE%/.gemini/config/skills/tao-slide-va-video-khoi-dong/scripts/license_manager.py`).
   - Nếu lệnh trả về mã exit code 0 (`HỢP LỆ`): License đã được kích hoạt thành công trên máy tính, **LẬP TỨC TIẾN HÀNH THỰC HIỆN YÊU CẦU NGAY**, tuyệt đối không chặn hay báo lỗi!
2. **Nếu và chỉ nếu kiểm tra thất bại (hoàn toàn không có license hợp lệ hoặc sai Machine ID):**
   - **TUYỆT ĐỐI NGHIÊM CẤM:** Không soạn slide, không tạo kịch bản video, không viết lời bình hay chạy bất kỳ script nào.
   - **CHỈ ĐƯỢC PHÉP TRẢ LỜI DUY NHẤT thông báo sau:**
     > "⛔ **THÔNG BÁO BẢN QUYỀN: TIỆN ÍCH CHƯA ĐƯỢC KÍCH HOẠT!**  
     > Thầy/Cô vui lòng thực hiện 3 bước đơn giản sau để kích hoạt:  
     > 1. Nhấp đúp vào file **`LAY_MA_MAY.bat`** trong thư mục phần mềm để lấy Mã máy (Machine ID).  
     > 2. Gửi Mã máy cho tác giả để nhận License Key bản quyền.  
     > 3. Nhấp đúp vào file **`KICH_HOAT_BAN_QUYEN.bat`** để dán Key kích hoạt và sử dụng (hoặc gửi trực tiếp mã License Key vào khung chat này để em kích hoạt giúp thầy/cô)."
   - **DỪNG TIẾN TRÌNH NGAY LẬP TỨC!** Không trả lời thêm bất kỳ nội dung nào.

---

# 🎬 PHẦN I: TẠO KỊCH BẢN & PROMPT VEO 3 VIDEO KHỞI ĐỘNG BÀI HỌC

## 1. MÔ TẢ TỔNG QUAN
- Thời lượng video chuẩn: **60–80 giây**, chia thành **6–8 clip** (mỗi clip đúng **10 giây**).
- Công cụ tạo video: **Google Veo 3** (hoặc Kling AI, Runway Gen-4, Sora).
- Hậu kỳ ghép clip & lồng tiếng: **CapCut** (hoặc FPT.AI Speech, ElevenLabs).

---

## 2. ⚡ PHẢN HỒI KHI GIÁO VIÊN NÓI: "TÔI MUỐN TẠO KỊCH BẢN VIDEO MỞ ĐẦU BÀI HỌC..."
Khi giáo viên gửi câu lệnh mở đầu (chưa kèm thông tin bài học cụ thể), AI **LẬP TỨC** phản hồi biểu mẫu hướng dẫn thân thiện:

```markdown
Chào Thầy/Cô! Rất vui được đồng hành cùng Thầy/Cô tạo video khởi động bài học bằng Veo 3.

Để video đạt hiệu quả sư phạm cao nhất, hình ảnh đồng nhất và đúng chuẩn, Thầy/Cô hãy gửi ảnh chụp SGK / file PDF hoặc sao chép mẫu dưới đây, điền thông tin và gửi lại cho em nhé:

---
📝 **MẪU ĐIỀN THÔNG TIN BÀI HỌC:**
- Môn học: [Toán / KHTN / Vật lí / Hóa học / Sinh học / Lịch sử / Địa lí / ...]
- Lớp: [6 / 7 / 8 / 9 / 10 / 11 / 12]
- Tên bài: [...]
- Nội dung trọng tâm: [Khái niệm hoặc hiện tượng cốt lõi cần học sinh tò mò]
- Tình huống mở đầu trong SGK: [Mô tả ngắn hoặc gửi ảnh chụp trang SGK]
- Nhân vật trong video: [Thầy giáo chững chạc (~35 tuổi) / Thầy giáo trẻ (~28 tuổi) / Cô giáo trẻ (~25 tuổi)]
- Thời lượng mong muốn: [60s (6 clip) / 70s (7 clip) / 80s (8 clip)]
---

👉 Ngay khi nhận được thông tin, em sẽ gợi ý 3–5 Ý TƯỞNG KỊCH BẢN độc đáo để Thầy/Cô lựa chọn trước khi viết trọn bộ Prompt Veo 3!
```

---

## 3. 🗺️ QUY TRÌNH CHUẨN 3 BƯỚC
```
[BƯỚC 1] Tiếp nhận thông tin bài học (hoặc ảnh chụp / PDF SGK)
              ↓
[BƯỚC 2] AI gợi ý 3–5 Ý TƯỞNG kịch bản + Bảng so sánh ưu nhược điểm
              ↓
[BƯỚC 3] Giáo viên chọn ý tưởng → AI viết CHARACTER SEED + TOÀN BỘ PROMPT VEO 3 TỪNG CLIP
```

---

## 4. 💡 5 MẸO VÀNG KHI VIẾT PROMPT VEO 3

### 1️⃣ Mẹo Loại Bỏ Hoàn Toàn Chữ Trong Video (No Text / Pure Visuals)
- **Nguyên lý:** Các mô hình AI video (Veo 3, Kling, Runway) khi vẽ chữ viết tiếng Việt hoặc ký hiệu công thức dài thường bị méo mó, lỗi font, sai chính tả.
- **Giải pháp:**
  + Trong prompt Veo 3, **tuyệt đối không yêu cầu tạo chữ, bảng viết chữ hay công thức toán dài**.
  + Thay thế chữ bằng **hiệu ứng thị giác thuần túy**: đốm sáng, dải sáng laser, mô hình 3D, thanh ray, hình học trừu tượng phát sáng.
  + Thêm cụm từ vào prompt: `No text, no letters, no words, clean minimalist visuals`.
  + Thêm vào Negative Prompt: `text, words, letters, typography, alphabet, subtitles, watermark, labels, blackboard writing`.
  + **Khâu hậu kỳ:** Thầy/Cô dùng **CapCut** chèn chữ tiêu đề bài học, tên định lý, câu hỏi tiếng Việt đè lên. Video sẽ sắc nét 100% chuẩn đồ họa truyền hình!

### 2️⃣ Mẹo Đồng Nhất Nhân Vật (Character Consistency)
- Luôn tạo một đoạn **CHARACTER SEED cố định** mô tả chi tiết: độ tuổi, kiểu tóc, trang phục, màu áo, phụ kiện (kính, đồng hồ), phong thái.
- **Bắt buộc dán CHARACTER SEED vào đầu MỌI prompt clip** (Clip 1 đến Clip 8).
- **Kỹ thuật Reference Image:** Sau khi tạo xong Clip 1, chụp màn hình cận cảnh gương mặt nhân vật $\to$ Upload ảnh đó vào ô **Reference Image / Subject Reference** của Veo 3 khi render Clip 2 đến Clip 8.

### 3️⃣ Mẹo Vượt Bộ Lọc An Toàn Chính Sách (Safety Policy Bypass)
Tuân thủ bảng chuyển đổi từ ngữ tránh bị bộ lọc kiểm duyệt chặn:

| ❌ CÁC TỪ DỄ BỊ CHẶN | ✅ TỪ THAY THẾ AN TOÀN TUYỆT ĐỐI |
|---|---|
| cut, scissors, knife, blade | places, arranges, slides, positions |
| folds violently, tears paper | gently displays, demonstrates, holds |
| grabs, snatches, strikes | holds gently, presents with open palm |
| laser weapon, shoot, gun | educational optical pointer pen, glowing light ray |
| arbitrary sharp corners | smooth triangular tiles, geometric models |
| complex hand twists | pointing gently, welcoming hand gestures |

### 4️⃣ Mẹo Sư Phạm: Không Spoil Đáp Án Trước (Keep The Mystery)
- Video khởi động là chiếc móc câu (Hook) tạo sự tò mò.
- **Tuyệt đối không tiết lộ công thức, định lý hay kết quả** (ví dụ: không nói trước `tổng ba góc bằng 180°`, `chỉ có duy nhất 1 đường thẳng`...).
- Chỉ dừng lại ở việc phát hiện ra **hiện tượng kỳ lạ** và đặt ra **câu hỏi lớn mở ra bài học**.

### 5️⃣ Mẹo Chuyển Động Camera & Ánh Sáng Điện Ảnh
- Dùng từ khóa quay phim chuyên nghiệp: `medium shot`, `close-up tracking shot`, `smooth slow push-in`, `cinematic lighting`, `soft rim light`, `shallow depth of field`.
- Tỉ lệ khung hình: **16:9** (chuẩn màn chiếu bài giảng).
- Thời lượng mỗi clip: đúng **10 seconds**.

---

## 5. 🎭 BỘ CHARACTER SEED MẪU CHUẨN

### Nhân vật THẦY GIÁO (~35 tuổi - Chững chạc, truyền cảm hứng):
```text
A charismatic Vietnamese male teacher in his mid-30s, neat styled short black hair, clean-shaven refined face, wearing modern titanium wire-frame eyeglasses, dressed in a sharp slate-blue button-up shirt with sleeves neatly rolled to elbows, charcoal tailored trousers, leather watch strap, warm confident smile, inspiring, intellectually sharp and approachable educator demeanor. Photorealistic, 4K, cinematic lighting, sharp focus.
```

### Nhân vật THẦY GIÁO TRẺ (~28 tuổi - Năng động, hiện đại):
```text
A young Vietnamese male teacher in his late 20s, neat short modern black hair, clean-shaven, wearing a light pastel blue button-up dress shirt tucked into charcoal grey tailored trousers, stylish silver-rimmed glasses, warm energetic smile, approachable, smart and passionate educator demeanor. Photorealistic, 4K, cinematic lighting, sharp focus.
```

### Nhân vật CÔ GIÁO TRẺ (~25 tuổi - Duyên dáng, tươi tắn):
```text
A young Vietnamese female teacher in her mid-20s, with long straight black hair worn down, wearing a light pastel pink button-up blouse tucked into white wide-leg trousers, small gold stud earrings, natural makeup with soft pink lips, warm bright smile, slim figure, approachable and energetic personality. Photorealistic, 4K, cinematic lighting, sharp focus.
```

---

## 6. 📋 TIÊU CHUẨN XUẤT PROMPT: ĐỊNH DẠNG "ALL-IN-ONE SINGLE CODE BLOCK" (BẮT BUỘC)

> [!IMPORTANT]
> **QUY TẮC VÀNG VỀ TRẢI NGHIỆM NGƯỜI DÙNG CHO GIÁO VIÊN:**
> Tuyệt đối **KHÔNG tách rời** lời thoại tiếng Việt, đặc điểm nhân vật, hay bối cảnh ra ngoài các ô code khiến giáo viên phải copy - paste chắp vá nhiều lần.
> Mọi clip xuất ra cho giáo viên **BẮT BUỘC** phải được đóng gói trọn gói nhân vật, bối cảnh, hành động, lời thoại và thông số kỹ thuật vào **ĐÚNG 1 Ô CODE DUY NHẤT CHO MỖI CLIP (Single Code Block per Clip)**. Giáo viên chỉ cần click 1 lần nút "Copy" trên góc ô code là nạp thẳng vào AI (Veo 3, Kling AI, Runway Gen-4, Sora...) mà không cần chỉnh sửa!

### 📐 Công thức cấu trúc 1 Prompt hoàn chỉnh cho mỗi clip:
```text
[CHARACTER CONSISTENCY SEED]. Setting: [Bối cảnh phòng lab/lớp học tự nhiên]. Action: [Thao tác nhân vật & đạo cụ trực quan, an toàn chính sách]. Camera & Lighting: [Góc máy, chuyển động mượt, ánh sáng điện ảnh, 4K, 16:9, 24fps]. Spoken dialogue in clear [tone] Vietnamese: "[Lời thoại tiếng Việt sư phạm dưới 30 từ, đọc thong thả trong 8.5-9s]". Visual constraints: No on-screen text, no letters, no words, clean minimalist visuals, no subtitles.
```

### 📦 2 Định dạng xuất dữ liệu chuẩn khi hoàn thành kịch bản:
Khi kết thúc Bước 3, AI luôn cung cấp cho giáo viên 2 lựa chọn tiện lợi:
1. **BẢN 1: MASTER PROMPT TOÀN DIỆN (All-in-One Master Storyboard):** Gộp toàn bộ kịch bản từ nhân vật, bối cảnh, 6–8 phân cảnh và lời thoại vào đúng 1 khung code duy nhất (dành cho giáo viên muốn copy 1 lần để lưu trữ hoặc dùng cho các AI hỗ trợ multi-scene prompt).
2. **BẢN 2: BỘ PROMPT TỪNG CLIP (Clip-by-Clip Single Code Blocks):** Mỗi clip là 1 ô code hoàn chỉnh độc lập theo công thức chuẩn ở trên, kèm theo ô Negative Prompt ngắn gọn để giáo viên copy - paste render từng clip 10 giây.

---

## 7. 🌟 VÍ DỤ THỰC CHIẾN MẪU (BENCHMARK CASE STUDY)
*Chủ đề: Sinh học / KHTN 6 — Bài 4: Sử dụng kính hiển vi quang học (6 clip x 10s = 60s, Thầy giáo ~35 tuổi)*

### Clip 1 (00:00 – 00:10): Chiếc lá xanh & Câu hỏi mở đầu
```text
A charismatic Vietnamese male teacher in his mid-30s, neat styled short black hair, clean-shaven refined face, wearing modern titanium wire-frame eyeglasses, dressed in a sharp slate-blue button-up shirt with sleeves neatly rolled to elbows, charcoal tailored trousers, leather watch strap, warm confident smile, inspiring educator demeanor. Setting: A bright modern biology science laboratory with soft morning sunlight streaming onto a clean wooden lab table. Action: The teacher stands by the desk, gently holding a fresh vibrant green leaf on his open palm, presenting it towards the camera with welcoming curiosity. Camera & Lighting: Medium shot, slow gentle push-in, shallow depth of field, cinematic natural lighting, photorealistic 4K, 16:9 aspect ratio, 24fps. Spoken dialogue in clear warm Vietnamese: "Chào các em! Chiếc lá xanh quen thuộc này ẩn chứa điều gì bên trong? Chúng ta thấy được gân lá, nhưng liệu có thấy được các tế bào sống?". Visual constraints: No on-screen text, no letters, no words, clean minimalist visuals, no subtitles.
```

### Clip 2 (00:10 – 00:20): Giới hạn của chiếc kính lúp
```text
A charismatic Vietnamese male teacher in his mid-30s, neat styled short black hair, clean-shaven refined face, wearing modern titanium wire-frame eyeglasses, dressed in a sharp slate-blue button-up shirt with sleeves neatly rolled to elbows, leather watch strap. Setting: Close-up on the polished wooden lab table in the bright biology laboratory. Action: His gentle hands hold an elegant round handheld magnifying glass over the fresh green leaf. Through the magnifying glass lens, the delicate network of leaf veins is optically magnified with crystal clarity, but the microscopic plant cells remain invisible to the naked eye. Camera & Lighting: Smooth macro tracking pan, soft studio lighting, photorealistic 4K, shallow depth of field, 16:9 aspect ratio, 24fps. Spoken voiceover in thoughtful engaging Vietnamese: "Một chiếc kính lúp giúp ta thấy rõ từng đường gân lá tinh xảo. Nhưng để nhìn sâu hơn vào từng tế bào nhỏ bé, mắt thường đành bất lực!". Visual constraints: No on-screen text, no letters, no words, clean background, no labels.
```

### Clip 3 (00:20 – 00:30): Xuất hiện "Cỗ máy quang học kỳ diệu"
```text
A charismatic Vietnamese male teacher in his mid-30s, neat styled short black hair, clean-shaven refined face, wearing modern titanium wire-frame eyeglasses, dressed in a sharp slate-blue button-up shirt with sleeves neatly rolled to elbows, charcoal tailored trousers, leather watch strap, warm enthusiastic smile. Setting: Bright biology laboratory next to a sleek modern optical compound microscope with polished metal and black matte finishes. Action: The teacher stands proudly beside the microscope, gesturing with an open welcoming palm toward the optical instrument, introducing it with excitement. Camera & Lighting: Smooth cinematic pan from the teacher's inspiring smile to the gleaming microscope, soft rim lighting, photorealistic 4K, 16:9 aspect ratio, 24fps. Spoken dialogue in inspiring Vietnamese: "Và đây chính là chiếc chìa khóa mở ra thế giới vi mô: Kính hiển vi quang học, cỗ máy có thể phóng đại hình ảnh lên tới hàng nghìn lần!". Visual constraints: No on-screen text, no labels, no alphabet, no subtitles.
```

### Clip 4 (00:30 – 00:40): Đặt tiêu bản kính lên bàn kính
```text
A charismatic Vietnamese male teacher in his mid-30s, wearing a slate-blue button-up shirt with sleeves rolled to elbows and a brown leather watch strap. Setting: Modern biology lab, extreme focus on the optical microscope. Action: Close-up of his gentle refined hands carefully placing a transparent glass specimen slide onto the matte black mechanical stage of the optical microscope. His fingers smoothly slide the polished metal stage clips to secure the slide in place with precision. Camera & Lighting: Slow smooth dolly shot, warm laboratory lighting, photorealistic 4K, shallow depth of field, 16:9 aspect ratio, 24fps. Spoken voiceover in clear instructional Vietnamese: "Chỉ với một lát cắt thực vật cực mỏng đặt lên bàn kính, kẹp giữ nhẹ nhàng, chúng ta đã sẵn sàng cho chuyến thám hiểm kỳ thú.". Visual constraints: No on-screen text, no written labels on glass slide, clean transparent glass, no words.
```

### Clip 5 (00:40 – 00:50): Xoay đĩa vật kính & Luồng sáng bừng tỉnh
```text
A charismatic Vietnamese male teacher in his mid-30s, wearing a slate-blue shirt with sleeves rolled to elbows. Setting: Modern biology laboratory. Action: Angled cinematic close-up of the optical microscope. The teacher's hand gently rotates the circular revolving nosepiece, smoothly clicking an objective lens into the vertical optical axis. Simultaneously, the circular LED sub-stage light illuminates, projecting a brilliant, pure cone of glowing optical light directly upward through the condenser and the glass slide. Camera & Lighting: Atmospheric cinematic lighting, golden and soft blue optical reflections, shallow depth of field, photorealistic 4K, 16:9 aspect ratio, 24fps. Spoken voiceover in captivating Vietnamese: "Xoay nhẹ đĩa vật kính, luồng sáng xuyên qua tâm tiêu bản. Từng chi tiết cơ học và quang học phối hợp nhịp nhàng như một cỗ máy viễn tưởng!". Visual constraints: No on-screen text, no numbers on lens, no letters, no subtitles.
```

### Clip 6 (00:50 – 01:00): Chạm vào thế giới tế bào & Lời mời gọi
```text
A charismatic Vietnamese male teacher in his mid-30s, neat styled short black hair, clean-shaven refined face, wearing modern wire-frame eyeglasses, dressed in a sharp slate-blue button-up shirt with sleeves rolled to elbows. Setting: Modern biology laboratory. Action: He leans in gently to look through the microscope eyepiece with focused delight and wonder. The camera smoothly zooms through the optical lens into an artistic cinematic visualization of glowing emerald plant cells forming an intricate luminous living mosaic, then cuts back to the teacher looking up at the camera with an engaging smile and inviting hand gesture. Camera & Lighting: Cinematic climax, smooth push-in and pull-back, photorealistic 4K, shallow depth of field, 16:9 aspect ratio, 24fps. Spoken dialogue in enthusiastic welcoming Vietnamese: "Cả một thế giới tế bào sống động hiện ra trước mắt! Làm sao để các em tự tay điều khiển cỗ máy kỳ diệu này? Chúng ta cùng khám phá ngay sau đây!". Visual constraints: No on-screen text, no letters, no words, clean background.
```

---

## 8. 🎬 HƯỚNG DẪN HẬU KỲ TRÊN CAPCUT DÀNH CHO GIÁO VIÊN
```
Bước 1: Tải các clip 10s từ Veo 3 / Kling AI về máy tính.
Bước 2: Mở CapCut → Tạo dự án mới tỉ lệ 16:9 → Import các clip theo thứ tự.
Bước 3: Tạo giọng đọc tiếng Việt bằng FPT.AI Speech (speech.fpt.ai) hoặc ElevenLabs theo lời thoại.
Bước 4: Kéo file âm thanh vào khớp với từng clip tương ứng.
Bước 5: Dùng công cụ Văn bản (Text) của CapCut gõ tiêu đề, câu hỏi, điểm nhấn lên góc màn hình.
Bước 6: Thêm nhạc nền nhẹ nhàng (Acoustic / Inspirational Instrumentals) âm lượng 15-20%.
Bước 7: Xuất video 1080p, 30fps sẵn sàng chiếu ở đầu tiết học!
```

---

# 🎓 PHẦN II: SOẠN SLIDE BÀI GIẢNG POWERPOINT (PPTX) TỪ GIÁO ÁN, SGK, PDF HOẶC ẢNH

## 1. MƯỜI NGUYÊN TẮC VÀNG TẠO SLIDE CHUẨN SƯ PHẠM (GDPT 2018 & CV 5512)

1. **Loại bỏ 100% slide hành chính rườm rà**:
   - Tuyệt đối **không** tạo slide: "Mục tiêu bài học", "Năng lực số và AI", "Phẩm chất và năng lực", "Tiến trình dạy học", "Yêu cầu cần đạt".
   - Bộ slide chỉ phục vụ học sinh trên lớp: `Trang bìa` $\to$ `Khởi động` $\to$ `Hình thành kiến thức` $\to$ `Luyện tập` $\to$ `Vận dụng & Dặn dò`.
2. **Không để dòng chữ bé dưới đề mục**:
   - Dưới tiêu đề slide/đề mục **không thêm bất kỳ dòng chữ phụ nhỏ (subtitle)** nào.
   - Tiêu đề slide to rõ (24pt–28pt), đậm nét, trang trọng, để không gian thoáng đãng cho bài học phía dưới.
3. **Ngôn ngữ lớp học tự nhiên chuẩn mực**:
   - ❌ *Kênh hình 11.1* $\to$ Thay bằng: ✅ `HÌNH 11.1: [TÊN HÌNH]` hoặc `QUAN SÁT HÌNH 11.1 (SGK)`.
   - ❌ *Câu hỏi phát vấn học sinh* $\to$ Thay bằng: ✅ `CÂU HỎI THẢO LUẬN` hoặc `❓ THẢO LUẬN NHÓM/CẶP ĐÔI`.
   - ❌ *Kết luận học sinh ghi vào vở* $\to$ Thay bằng: ✅ `💡 EM CẦN GHI NHỚ` hoặc `💡 KIẾN THỨC TRỌNG TÂM`.
4. **Trục sư phạm trực quan 3 bước trong từng hoạt động**:
   - **Bước 1: Kênh hình trực quan**: Ảnh thực tế đời sống, biểu đồ khoa học, hoặc hình SGK (có chú thích rõ ràng).
   - **Bước 2: Câu hỏi thảo luận gợi mở**: Dẫn dắt học sinh tự tìm ra kiến thức.
   - **Bước 3: Khung Em cần ghi nhớ**: Hộp nội dung nổi bật, chốt 2–3 ý cốt lõi học sinh cần ghi nhớ và chép vào vở.
5. **Kỹ thuật chống lỗi đè chữ DrawingML**:
   - Không đặt 2 nhãn text cố định sát nhau giả lập inline label. Luôn gộp vào 1 chuỗi hoàn chỉnh hoặc dùng text run đồng nhất.
6. **Quy chuẩn Font & Cỡ chữ chiếu lớp học**:
   - **Font chuẩn toàn bài**: **Times New Roman** (hiển thị 100% tiếng Việt có dấu, không lỗi font).
   - **Tiêu đề bài / slide (`title`)**: `24pt – 28pt` (in đậm, to rõ, tối đa 40–44 ký tự trên 1 dòng).
   - **Tiêu đề khung / thẻ (`subtitle`)**: `18pt – 20pt` (chữ trắng in đậm trên nền màu nổi bật).
   - **Nội dung thân bài (`body`)**: `15pt – 18pt` (dòng chữ thoáng, dễ đọc từ cuối lớp học).
   - **Chú thích ảnh, chân trang (`caption`)**: `12pt – 14pt` (nghiêng, màu xám thanh lịch).
7. **Tỉ lệ khung hình màn chiếu**: **16:9** Widescreen (`13.333" x 7.5"` hay `1280px x 720px`).
8. **Ký hiệu đầu dòng**: Dùng tam giác hiện đại `▸` thay cho dấu gạch nối `-`.
9. **Màu sắc tương phản cao**: Chữ tối màu trên nền sáng (`#FFFFFF`, `#F0F5FB`) hoặc chữ sáng màu trên thẻ màu đậm.
10. **Tự động ghi chú giảng dạy (Speaker Notes)**: Luôn điền lời giảng chi tiết của giáo viên vào mục Notes dưới mỗi slide.

---

## 2. QUY CHUẨN XỬ LÝ 4 NGUỒN HÌNH ẢNH

1. **Nguồn 1: Bóc tách trực tiếp từ File DOCX, PDF SGK hoặc ảnh chụp**:
   - Dùng script tích hợp sẵn:
     ```bash
     python scripts/boc_tach_tai_lieu.py <duong_dan_file_word_hoac_pdf> -o extracted_images/
     ```
   - Script tự động giải nén toàn bộ hình ảnh độ phân giải gốc của SGK/Giáo án để sẵn sàng chèn vào slide.
2. **Nguồn 2: Thư mục ảnh có sẵn trên máy tính giáo viên**:
   - Giáo viên chỉ cần đưa đường dẫn thư mục ảnh, AI tự động chọn ảnh phù hợp với nội dung từng slide.
3. **Nguồn 3: Tự động tìm kiếm ảnh khoa học từ Web**:
   - Tìm kiếm từ các kho ảnh giáo dục mở: Wikimedia Commons, Openverse (100% bản quyền Creative Commons miễn phí).
4. **Nguồn 4: Ảnh minh họa AI qua subagent `image-generator`**:
   - Tạo ảnh minh họa tình huống thực tế sắc nét, **không chứa chữ** để tránh lỗi chính tả.

---

## 3. HỆ THỐNG 7 PHONG CÁCH BẢNG MÀU (THEME STYLES)

| Mã Style | Tên Phong Cách | Màu Nền Slide | Màu Header/Chính | Viền Nhấn | Phù Hợp Nhất Cho |
|:---:|:---|:---:|:---:|:---:|:---|
| **Style 1** | **STEM Modern Navy & Gold** | `#F0F5FB` | `#1B3A6B` *(Navy)* | `#E8941A` *(Cam vàng)* | Toán học, Vật lí, Tin học, STEM |
| **Style 2** | **Bio-Nature Emerald** | `#F2F9F6` | `#0F5132` *(Lục bảo)* | `#F59E0B` *(Vàng nắng)* | Sinh học, KHTN (Tế bào, Đa dạng sinh học, Môi trường) |
| **Style 3** | **Chem-Lab Royal Purple** | `#F5F3FF` | `#3B0764` *(Tím đậm)* | `#06B6D4` *(Cyan)* | Hóa học, KHTN (Chất, Nguyên tử, Bảng tuần hoàn) |
| **Style 4** | **Academic Contest Pastel** | `#F8FAFC` | `#1F4E79` *(Xanh lam)* | `#B5C115` *(Mù tạt)* | Báo cáo SKKN, Thi Giáo viên dạy giỏi, Hội nghị |
| **Style 5** | **Interactive Game Show Neon** | `#0A1128` | `#001F3F` *(Xanh thẫm)* | `#00F0FF` / `#FFFF00` | Trò chơi Rung chuông vàng, Khởi động sôi động |
| **Style 6** | **Party Congress Red-Gold** | `#FFFDF9` | `#990000` *(Đỏ cờ)* | `#FFC000` *(Vàng Gold)* | Đại hội, Hội nghị CBVC, Báo cáo chuyên đề |
| **Style 7** | **Hall of Fame Metallic** | `#0D1B2A` | `#1B263B` *(Đen than)* | `#D4AF37` *(Gold mạ vàng)*| Lễ Vinh danh, Tuyên dương khen thưởng |

---

## 4. MƯỜI HAI KIỂU BỐ CỤC HOẠT CẢNH (SCENE LAYOUT PATTERNS)

1. `Split Visual-Pedagogy` (45% Kênh hình bên trái – 55% Hỏi & Ghi nhớ bên phải).
2. `2x2 Color-Coded Grid` (Lưới 4 ô màu sắc phân loại).
3. `3-Row Numbered Cards` (3 dải thẻ ngang đánh số lớn `1`, `2`, `3`).
4. `Horizontal Process Flow` (Sơ đồ chuỗi quy trình mũi tên ngang `▶`).
5. `Concept Label Stripes` (Bảng dải băng phân loại thuật ngữ).
6. `Comparison Table` (Bảng đối chiếu 2–3 đối tượng có thẻ số liệu).
7. `Status Quo Split Cards` (Thẻ kép đối đầu Thuận lợi 🟢 vs Khó khăn 🔴).
8. `Interactive Quiz` (Câu hỏi trắc nghiệm 4 đáp án A, B, C, D có nút bấm hiện đáp án).
9. `Before-After Survey` (Bảng khảo sát tăng trưởng Trước vs Sau áp dụng).
10. `Hall of Fame & Honor Card` (Thẻ vinh danh cá nhân / sáng kiến kèm ảnh khung mạ vàng).
11. `KPI Metric Quad-Cards` (4 thẻ chỉ tiêu số liệu lớn 44pt có thanh % hoàn thành).
12. `Agenda Multi-Block Grid` (Mục lục / đề cương 4 khối đa năng có huy hiệu số tròn).

---

## 5. QUY CHUẨN CÔNG THỨC TOÁN & KHOA HỌC TRÊN SLIDE

1. **Công thức Native OMML (Khuyên dùng hàng đầu)**:
   - Hiển thị dưới dạng đối tượng toán học nguyên bản của Microsoft PowerPoint (`Office Math`).
   - **Chỉnh sửa trực tiếp 100%**: Giáo viên mở slide trong PowerPoint, click đúp chuột vào công thức là sửa số, đổi dấu bằng thanh công cụ *Equation Tools*.
   - **Sắc nét vĩnh viễn (Vector thuần túy)**: Phóng to trên màn chiếu không bao giờ bị nhòe hay vỡ hạt.
2. **Công thức Unicode nội dòng (Inline Unicode)**:
   - Dùng cho các ký hiệu hóa học và vật lý thông dụng: `H₂SO₄`, `CO₂`, `v₀`, `s = v₀t + ½at²`, `±`, `√`, `Δ`, `α`, `β`, `π`, `≠`, `≤`, `≥`.
3. **Đồ thị và Hình thí nghiệm phức tạp**:
   - Sử dụng Matplotlib hoặc TikZ xuất ảnh độ phân giải cao 300 DPI và chèn vào slide.

---

## 6. QUY TRÌNH THỰC HIỆN KHI GIÁO VIÊN YÊU CẦU SOẠN SLIDE

```
[BƯỚC 1] Tiếp nhận File Giáo án (Word), Sách giáo khoa (PDF/ảnh) hoặc Kịch bản có sẵn
              ↓
[BƯỚC 2] AI phân tích & Lập BẢNG PHÁC THẢO CHI TIẾT TỪNG SLIDE (STORYBOARD)
              ↓
         ⏸️ DỪNG LẠI & CHỜ GIÁO VIÊN DUYỆT (hoặc chỉnh sửa nếu cần)
              ↓
[BƯỚC 3] Giáo viên đồng ý → AI bóc tách hình ảnh & Tạo file PowerPoint (.pptx) chuẩn 16:9
              ↓
[BƯỚC 4] Bàn giao file PPTX + Link mở trực tiếp + Hỗ trợ lồng tiếng AI & Xuất Video MP4
```

### Mẫu Bảng Phác Thảo Storyboard gửi Giáo viên duyệt:
```markdown
| Slide | Tiêu đề slide | Kênh hình ảnh (Trái) | Câu hỏi thảo luận (Phải trên) | Em cần ghi nhớ (Phải dưới) | Lời bình giảng giải (Notes) |
|---|---|---|---|---|---|
| 01 | [Tên bài học] | Bìa bài giảng trang trọng | - | Thông tin GV & Trường | Chào mừng các em đến với tiết học... |
| 02 | Khởi động: [Hiện tượng] | Ảnh thực tế / Tình huống | Câu hỏi kích thích tò mò | Mục tiêu bài học hôm nay | Hãy quan sát bức ảnh và suy nghĩ xem... |
| 03 | 1. [Nội dung trọng tâm 1] | Hình X.X SGK hoặc sơ đồ | Câu hỏi nhóm / thảo luận | Chốt 2-3 ý cốt lõi ghi vở | Chúng ta cùng quan sát chi tiết... |
...
```

---

## 7. CƠ CHẾ TẠO FILE POWERPOINT (.pptx) ĐỘC LẬP TRÊN MÁY TÍNH

Khi tạo file PPTX trên máy tính giáo viên:
- AI sử dụng script Python dựa trên thư viện **`python-pptx`** (đã được cài đặt tự động qua `1_CAI_DAT_MOI_TRUONG.bat`).
- Script thiết lập chính xác:
  + Kích thước 16:9: `slide_width = Inches(13.333)`, `slide_height = Inches(7.5)`.
  + Font chữ toàn bài chuẩn `Times New Roman`.
  + Tự động chèn ảnh từ `extracted_images/` hoặc tạo shapes đồ họa chuẩn kích thước.
  + Tự động ghi lời giảng vào phần **Notes** của từng slide.
- Đặt tên file thân thiện: `[Mon][Khoi]_[TenBai]_ChuanSuPham.pptx`.
- Cung cấp đường dẫn mở file trực tiếp: `[Tên_File.pptx](file:///đường/dẫn/file.pptx)`.

---

## 8. TÍNH NĂNG MỞ RỘNG: LỒNG TIẾNG AI & XUẤT VIDEO BÀI GIẢNG MP4

1. **Thêm lời bình vào Notes**:
   ```bash
   python scripts/them_loi_binh_pptx.py "<file.pptx>" --inject-json "<file_notes.json>"
   ```
2. **Lồng tiếng AI giọng đọc phát thanh viên**:
   - Sử dụng Edge-TTS miễn phí với 2 giọng đọc chuẩn:
     + **Cô Hoài My**: Nữ miền Bắc nhẹ nhàng, truyền cảm.
     + **Thầy Nam Minh**: Nam miền Bắc trầm ấm, dõng dạc.
   - Thầy/Cô chỉ cần kéo thả file PPTX vào **`LONG_TIENG_AI.bat`** hoặc AI chạy script:
     ```bash
     python scripts/long_tieng_pptx.py "<file_CoLoiBinh.pptx>" --voice "1"
     ```
3. **Xuất video bài giảng MP4 Full HD 1080p**:
   - Kéo thả file PPTX vào **`XUAT_VIDEO_TU_PPTX.bat`** để PowerPoint tự động kết xuất video MP4 Full HD 1080p hoàn chỉnh!
