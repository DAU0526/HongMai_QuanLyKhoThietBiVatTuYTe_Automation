# MedEquip – Robot Framework Test Suite

Bộ test tự động cho hệ thống **Quản lý Kho Thiết bị Y tế (MedEquip)**, xây dựng theo mô hình **Page Object Model (POM)** với **SeleniumLibrary**.

---

## Mục tiêu

Kiểm thử giao diện người dùng (UI Testing) cho 8 chức năng chính của hệ thống, bao gồm kiểm tra luồng hợp lệ (happy-path), không hợp lệ (negative) và phân quyền theo vai trò (role-based).

---

## Cấu trúc thư mục

```
robot-tests/
│
├── resources/
│   ├── locators/                        # Chứa XPath/ID locator của từng trang
│   │   ├── LoginPageLocators.py
│   │   ├── RegisterPageLocators.py
│   │   ├── InventoryPageLocators.py
│   │   ├── ImportsPageLocators.py
│   │   ├── ExportsPageLocators.py
│   │   ├── AllocationsPageLocators.py
│   │   ├── RequestsPageLocators.py
│   │   └── ReturnsPageLocators.py
│   │
│   ├── page_objects/                    # Chứa keywords tương tác với từng trang
│   │   ├── LoginPage.resource
│   │   ├── RegisterPage.resource
│   │   ├── InventoryPage.resource
│   │   ├── ImportsPage.resource
│   │   ├── ExportsPage.resource
│   │   ├── AllocationsPage.resource
│   │   ├── RequestsPage.resource
│   │   └── ReturnsPage.resource
│   │
│   ├── common_keywords.resource         # Keywords dùng chung: login, logout, navigation
│   └── environment_variables.yml        # Biến môi trường: URL, tài khoản test, browser
│
├── tests/                               # Các test suite
│   ├── LoginTests.robot                 # 13 test cases
│   ├── RegisterTests.robot              # 12 test cases
│   ├── InventoryTests.robot             # 12 test cases (active)
│   ├── ImportsTests.robot               # 10 test cases
│   ├── ExportsTests.robot               # 8 test cases
│   ├── AllocationsTests.robot           # 9 test cases (active)
│   ├── RequestsTests.robot              # 6 test cases (active)
│   └── ReturnsTests.robot               # 9 test cases
│
├── results/                             # Kết quả test (tự sinh khi chạy)
│   ├── report.html
│   ├── log.html
│   └── output.xml
│
├── requirements.txt                     # Thư viện Python cần cài
└── README.md
```

---

## Cách tổ chức theo POM

| Tầng | File | Vai trò |
|------|------|---------|
| **Locators** | `locators/*.py` | Lưu XPath/ID dưới dạng biến Python. Khi UI thay đổi chỉ cần sửa ở đây |
| **Page Objects** | `page_objects/*.resource` | Import locators, định nghĩa keywords mô tả hành động trên từng trang |
| **Test Cases** | `tests/*.robot` | Import page objects, viết test cases tái sử dụng keywords |

> **Lưu ý:** Thiết bị được **thêm mới** vào hệ thống thông qua luồng **upload file Excel** (nhập kho) — không có form thêm thủ công. Locators liên quan nằm trong `InventoryPageLocators.py` (mục _Dialog tạo phiếu nhập_) và `ImportsPageLocators.py`.

---

## Cài đặt

```bash
# 1. Cài thư viện Python
pip install -r requirements.txt

# 2. Tải ChromeDriver tự động (webdriver-manager xử lý)
# Không cần cài thủ công
```

---

## Chạy test

```bash
# Chạy tất cả test suites
robot --outputdir results tests/

# Chạy từng suite riêng
robot --outputdir results tests/LoginTests.robot
robot --outputdir results tests/RegisterTests.robot
robot --outputdir results tests/InventoryTests.robot
robot --outputdir results tests/ImportsTests.robot
robot --outputdir results tests/ExportsTests.robot
robot --outputdir results tests/AllocationsTests.robot
robot --outputdir results tests/RequestsTests.robot
robot --outputdir results tests/ReturnsTests.robot

# Chạy theo tag
robot --outputdir results --include smoke tests/
robot --outputdir results --include happy-path tests/
robot --outputdir results --include negative tests/
robot --outputdir results --include login tests/
```

---

## Tài khoản test

| Vai trò | Email | Mật khẩu |
|---------|-------|----------|
| Admin | admin@benhvien.vn | 123456 |
| Nhân viên Kho | kho@benhvien.vn | 123456 |
| Quản lý Kho | qlkho@benhvien.vn | 123456 |
| Trưởng Khoa | khoanoi@benhvien.vn | 123456 |
| Quản lý Khoa | qlkhoa@benhvien.vn | 123456 |

---

## Danh sách test cases

| Suite | Tags chính | Số TC |
|-------|-----------|-------|
| Login | smoke, happy-path, negative, validation, ui | 13 |
| Register | smoke, happy-path, negative, validation, ui | 12 |
| Inventory | smoke, happy-path, negative, filter, crud, role | 12 |
| Imports | smoke, happy-path, negative, search, approval, role | 10 |
| Exports | smoke, happy-path, negative, search, approval, cancel, role | 8 |
| Allocations | smoke, role, ui, approval | 9 |
| Requests | smoke, happy-path, negative, approval, cancel, delete | 6 |
| Returns | smoke, happy-path, negative, approval, cancel, role | 9 |
| **Tổng** | | **79 test cases** |

---

## Yêu cầu môi trường

- Frontend chạy tại: `http://localhost:8080`
- Backend API chạy tại: `http://localhost:5000`
- Python >= 3.9
- Google Chrome (ChromeDriver tự động tải qua webdriver-manager)

---

## Technology Stack

| Thành phần | Công nghệ | Phiên bản |
|-----------|-----------|-----------|
| Test Framework | Robot Framework | 7.0.1 |
| Browser Automation | SeleniumLibrary | 6.3.0 |
| WebDriver | Selenium | 4.21.0 |
| Driver Management | webdriver-manager | 4.0.1 |
| Config Parser | PyYAML | 6.0.1 |
| Browser | Google Chrome | Latest |
| Language | Python | >= 3.9 |

**Frontend (Hệ thống chính):**
- React 18 + TypeScript + Vite
- TailwindCSS + shadcn/ui (Radix UI)
- React Router DOM v6, React Query, React Hook Form + Zod
- Recharts (biểu đồ), QR Code, Framer Motion

**Backend:**
- Node.js + Express.js
- MySQL 2 (database driver)
- JWT (jsonwebtoken) + bcryptjs (xác thực)
- Multer (upload file), xlsx (xuất Excel)

---

## Requirements

### Yêu cầu phần mềm

```
robotframework==7.0.1
robotframework-seleniumlibrary==6.3.0
selenium==4.21.0
PyYAML==6.0.1
webdriver-manager==4.0.1
```

Cài đặt tất cả bằng lệnh:

```bash
pip install -r requirements.txt
```

### Yêu cầu hệ thống

- **Python** >= 3.9
- **Google Chrome** (phiên bản mới nhất) — ChromeDriver tự động tải qua `webdriver-manager`, không cần cài thủ công
- **Node.js** >= 18 (để chạy server và client của hệ thống)
- **MySQL** (database đã được seed dữ liệu mẫu)

### Khởi động hệ thống trước khi test

Trước khi chạy test, cần khởi động cả Frontend và Backend:

```bash
# Từ thư mục gốc MedEquip/
# Chạy file run.bat (Windows) — tự động cài npm và mở 2 cửa sổ
run.bat
```

Hoặc khởi động thủ công:

```bash
# Terminal 1 – Backend
cd server
npm install
npm run dev          # Chạy tại http://localhost:5000

# Terminal 2 – Frontend
cd client
npm install
npm run dev          # Chạy tại http://localhost:8080
```

---

## Automation Architecture

Dự án áp dụng mô hình **Page Object Model (POM)** kết hợp với **Keyword-Driven Testing**, tách biệt rõ ràng giữa locator, logic tương tác và test case.

```
┌─────────────────────────────────────────────────────┐
│                   TEST CASES (*.robot)               │
│   Mô tả kịch bản kiểm thử, gọi keywords từ POM      │
└────────────────────┬────────────────────────────────┘
                     │ import
┌────────────────────▼────────────────────────────────┐
│              PAGE OBJECTS (*.resource)               │
│   Keywords mô tả hành động trên từng trang UI        │
│   LoginPage, InventoryPage, ImportsPage, ...         │
└────────────────────┬────────────────────────────────┘
                     │ import
┌────────────────────▼────────────────────────────────┐
│               LOCATORS (*Locators.py)                │
│   XPath / ID của các phần tử UI dưới dạng biến Python│
│   Thay đổi UI chỉ cần sửa tại đây                   │
└─────────────────────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────┐
│           COMMON KEYWORDS (common_keywords.resource) │
│   Login/Logout, mở/đóng browser, sidebar navigation  │
│   Toast helpers, screenshot on failure               │
└─────────────────────────────────────────────────────┘
                     │
┌────────────────────▼────────────────────────────────┐
│        ENVIRONMENT VARIABLES (environment_variables.yml)│
│   URL, browser, tài khoản test từng vai trò          │
└─────────────────────────────────────────────────────┘
```

### Luồng xử lý một test case

1. `Suite Setup` → `Mở Trình Duyệt` (mở Chrome, navigate đến LOGIN_URL)
2. Test case gọi keyword từ Page Object (vd: `Login Thành Công`)
3. Page Object gọi locator từ `*Locators.py` và tương tác với UI qua SeleniumLibrary
4. `Test Teardown` → `Chụp Ảnh Khi Lỗi` (chỉ chụp khi test fail)
5. `Suite Teardown` → `Đóng Trình Duyệt`

---

## Test Coverage

### Phân loại theo chức năng

| Chức năng | Suite | Loại kiểm thử | Số TC |
|-----------|-------|--------------|-------|
| Đăng nhập | LoginTests.robot | Happy-path, Negative, UI, Redirect | 13 |
| Đăng ký | RegisterTests.robot | Happy-path, Negative, Validation | 12 |
| Tồn kho | InventoryTests.robot | CRUD, Filter, Role-based | 12 |
| Nhập kho | ImportsTests.robot | Happy-path, Negative, Search, Approval | 10 |
| Xuất kho | ExportsTests.robot | Happy-path, Negative, Approval, Cancel | 8 |
| Cấp phát | AllocationsTests.robot | Role-based, Approval, UI | 9 |
| Yêu cầu | RequestsTests.robot | Happy-path, Negative, Approval, Cancel | 6 |
| Trả thiết bị | ReturnsTests.robot | Happy-path, Negative, Approval, Cancel | 9 |
| **Tổng** | | | **79 test cases** |

### Phân loại theo vai trò người dùng được kiểm thử

| Vai trò | Quyền kiểm thử |
|---------|---------------|
| Admin | Toàn bộ chức năng |
| Nhân viên Kho (NV Kho) | Nhập kho, Xuất kho, Tồn kho |
| Quản lý Kho (QL Kho) | Phê duyệt nhập/xuất kho, Báo cáo |
| Trưởng Khoa | Tạo yêu cầu, Xem cấp phát, Trả thiết bị |

### Phân loại theo tag

| Tag | Mô tả |
|-----|-------|
| `smoke` | Kịch bản cơ bản nhất, chạy nhanh để xác nhận hệ thống hoạt động |
| `happy-path` | Luồng hợp lệ (đúng dữ liệu, đúng quyền) |
| `negative` | Luồng không hợp lệ (sai dữ liệu, thiếu quyền) |
| `validation` | Kiểm tra validate form phía client |
| `role` | Kiểm tra phân quyền theo vai trò |
| `approval` | Luồng phê duyệt/từ chối |
| `cancel` | Luồng hủy thao tác |
| `ui` | Kiểm tra giao diện (hiển thị, toggle, redirect) |
| `filter` | Kiểm tra tìm kiếm và lọc dữ liệu |
| `crud` | Kiểm tra tạo / đọc / cập nhật / xóa |

---

## Test Report

Sau mỗi lần chạy, Robot Framework tự động sinh 3 file báo cáo trong thư mục `results/`:

| File | Mô tả |
|------|-------|
| `report.html` | Báo cáo tổng quan: tỷ lệ pass/fail, thống kê theo suite và tag |
| `log.html` | Log chi tiết từng bước thực thi, kèm ảnh chụp màn hình khi lỗi |
| `output.xml` | Dữ liệu thô dạng XML, dùng để tích hợp CI/CD hoặc parse tùy chỉnh |

Xem báo cáo nhanh sau khi chạy:

```bash
# Mở report.html trực tiếp (Windows)
start results\report.html

# Hoặc dùng run_tests.bat — tự động mở report sau khi chạy xong
run_tests.bat
```

> Ảnh chụp màn hình (`selenium-screenshot-*.png`) được lưu trong `results/` và được nhúng vào `log.html` tại bước bị lỗi.

---

## Page Object Model Details

### Cấu trúc chi tiết từng tầng

#### Tầng 1 – Locators (`resources/locators/*.py`)

Mỗi file lưu toàn bộ XPath / CSS Selector / ID của một trang dưới dạng biến Python:

```python
# Ví dụ: LoginPageLocators.py
INPUT_EMAIL    = "id:email"
INPUT_PASSWORD = "id:password"
BTN_SUBMIT     = "xpath://button[@type='submit']"
MSG_ERROR      = "xpath://div[contains(@class,'text-destructive')]"
BTN_TOGGLE_PW  = "xpath://button[@type='button' and contains(@class,'absolute')]"
LBL_DASHBOARD  = "xpath://button[.//span[text()='Tổng quan']]"
BTN_LOGOUT     = "xpath://button[.//span[text()='Đăng xuất']]"
BTN_REGISTER   = "xpath://a[contains(@href,'/register')]"
```

**Lợi ích:** Khi UI thay đổi XPath, chỉ cần sửa file locator — không đụng đến test case.

#### Tầng 2 – Page Objects (`resources/page_objects/*.resource`)

Định nghĩa keywords mô tả hành động nghiệp vụ, import locators và gọi SeleniumLibrary:

```robot
# Ví dụ: LoginPage.resource
Login Thành Công
    [Arguments]    ${email}    ${password}
    Mở Trang Login
    Nhập Email       ${email}
    Nhập Mật Khẩu    ${password}
    Nhấn Đăng Nhập
    Wait Until Element Is Visible    ${LBL_DASHBOARD}    timeout=10s
```

#### Tầng 3 – Test Cases (`tests/*.robot`)

Chỉ chứa kịch bản kiểm thử, gọi keywords từ Page Object:

```robot
TC-LOGIN-01 Đăng nhập thành công với tài khoản Admin
    [Tags]    login    smoke    happy-path
    Login Thành Công    ${ADMIN_EMAIL}    ${ADMIN_PASSWORD}
    Kiểm Tra Đang Ở Dashboard
    Logout
```

#### Keywords dùng chung (`resources/common_keywords.resource`)

| Keyword | Mô tả |
|---------|-------|
| `Mở Trình Duyệt` | Mở Chrome, maximize, set implicit wait 2s / timeout 10s |
| `Đóng Trình Duyệt` | Đóng tất cả browser |
| `Đăng Nhập Admin` | Đăng nhập bằng tài khoản Admin |
| `Đăng Nhập NV Kho` | Đăng nhập bằng tài khoản Nhân viên Kho |
| `Đăng Nhập QL Kho` | Đăng nhập bằng tài khoản Quản lý Kho |
| `Đăng Nhập Truong Khoa` | Đăng nhập bằng tài khoản Trưởng Khoa |
| `Đăng Xuất` | Nhấn nút Đăng xuất, chờ về trang login |
| `Vào Trang Qua Sidebar` | Điều hướng bằng cách click menu sidebar |
| `Chờ Toast Thành Công` | Chờ toast notification thành công xuất hiện |
| `Chờ Toast Lỗi` | Chờ toast notification lỗi xuất hiện |
| `Chụp Ảnh Khi Lỗi` | Chụp screenshot màn hình |
| `Cuộn Xuống Cuối` | Scroll xuống cuối trang |
| `Element Hiển Thị` | Chờ element visible với timeout 10s |
| `Element Ẩn` | Chờ element ẩn đi với timeout 10s |

---

## Environment Configuration

Tất cả biến môi trường được quản lý tập trung trong `resources/environment_variables.yml`:

```yaml
# URL
BASE_URL:   "http://localhost:8080"
LOGIN_URL:  "http://localhost:8080/login"
REGISTER_URL: "http://localhost:8080/register"

# Trình duyệt
BROWSER: "chrome"

# Tài khoản test
ADMIN_EMAIL:        "admin@benhvien.vn"
ADMIN_PASSWORD:     "123456"
NV_KHO_EMAIL:       "kho@benhvien.vn"
NV_KHO_PASSWORD:    "123456"
QL_KHO_EMAIL:       "qlkho@benhvien.vn"
QL_KHO_PASSWORD:    "123456"
TRUONG_KHOA_EMAIL:  "khoanoi@benhvien.vn"
TRUONG_KHOA_PASSWORD: "123456"

# Dữ liệu test mẫu
TEST_THIET_BI: "Kim tiêm"
TEST_KHOA:     "Khoa Nội"
```

**Khi chạy ở môi trường khác**, chỉ cần thay đổi `BASE_URL`, `LOGIN_URL`, `REGISTER_URL` và tài khoản test trong file này — không cần sửa bất kỳ test case nào.

### Cấu hình Backend (`server/.env`)

```env
DB_HOST=localhost
DB_PORT=3306
DB_USER=root
DB_PASSWORD=your_password_here
DB_NAME=medequip_db
PORT=5000
```

---

## Smoke Test

Smoke test bao gồm các kịch bản tối thiểu để xác nhận hệ thống hoạt động bình thường trước khi chạy full regression.

### Chạy Smoke Test

```bash
robot --outputdir results --include smoke tests/
```

### Danh sách Smoke Test Cases

| TC ID | Suite | Mô tả |
|-------|-------|-------|
| TC-LOGIN-01 | Login | Đăng nhập thành công – Admin |
| TC-LOGIN-02 | Login | Đăng nhập thành công – NV Kho |
| TC-LOGIN-03 | Login | Đăng nhập thành công – QL Kho |
| TC-LOGIN-04 | Login | Đăng nhập thành công – Trưởng Khoa |
| TC-LOGIN-12 | Login | Đăng xuất thành công |
| TC-REGISTER-01 | Register | Đăng ký tài khoản thành công |
| TC-INVENTORY-01 | Inventory | Xem danh sách tồn kho |
| TC-IMPORTS-01 | Imports | Xem danh sách phiếu nhập kho |
| TC-EXPORTS-01 | Exports | Xem danh sách phiếu xuất kho |
| TC-ALLOC-01 | Allocations | Xem danh sách cấp phát |
| TC-REQUEST-01 | Requests | Xem danh sách yêu cầu |
| TC-RETURNS-01 | Returns | Xem danh sách trả thiết bị |

> Smoke test thường hoàn thành trong **< 3 phút**, phù hợp để kiểm tra nhanh sau khi deploy.

---

## Troubleshooting

### Lỗi thường gặp và cách xử lý

**1. `SessionNotCreatedException` – ChromeDriver không khớp phiên bản Chrome**
```
SessionNotCreatedException: Message: session not created: This version of 
ChromeDriver only supports Chrome version XX
```
→ Giải pháp: `webdriver-manager` tự xử lý, nhưng nếu vẫn lỗi hãy chạy:
```bash
pip install --upgrade webdriver-manager
```

---

**2. `ElementNotInteractableException` – Element bị che hoặc chưa load**
```
ElementNotInteractableException: element not interactable
```
→ Giải pháp: Kiểm tra implicit wait đã được set (`Set Selenium Implicit Wait 2s`). Nếu trang load chậm, tăng timeout trong `common_keywords.resource`.

---

**3. Test fail do Frontend chưa khởi động**
```
selenium.common.exceptions.WebDriverException: 
Reached error page: about:neterror
```
→ Giải pháp: Đảm bảo Frontend đang chạy tại `http://localhost:8080` trước khi chạy test. Dùng `run.bat` ở thư mục gốc để khởi động cả hai.

---

**4. `TimeoutException` – Dashboard không hiện sau khi login**
```
TimeoutException: Message: Timeout waiting for element
xpath://button[.//span[text()='Tổng quan']]
```
→ Giải pháp: Backend (`http://localhost:5000`) chưa khởi động hoặc database chưa kết nối được. Kiểm tra:
```bash
# Kiểm tra backend health
curl http://localhost:5000/api/test-db
```

---

**5. Lỗi `ModuleNotFoundError` khi chạy robot**
```
ModuleNotFoundError: No module named 'robot'
```
→ Giải pháp:
```bash
pip install -r requirements.txt
```

---

**6. Test chạy nhưng fail do dữ liệu không tồn tại**

Một số test case phụ thuộc vào dữ liệu mẫu trong database (vd: "Kim tiêm", "Khoa Nội"). Đảm bảo database đã được seed đúng. File dữ liệu mẫu: `du_lieu_nhap_kho_y_te.xlsx` ở thư mục gốc.

---

### Xem log chi tiết khi debug

```bash
# Chạy test với log level DEBUG
robot --outputdir results --loglevel DEBUG tests/LoginTests.robot

# Mở log.html để xem từng bước và ảnh chụp màn hình
start results\log.html
```

---

## Git Workflow

### Nhánh chính

| Nhánh | Mục đích |
|-------|---------|
| `main` | Code ổn định, đã kiểm thử |
| `develop` | Tích hợp tính năng mới |
| `feature/*` | Phát triển tính năng |
| `test/*` | Thêm/sửa test cases |

### Quy trình commit

```bash
# 1. Tạo nhánh mới
git checkout -b test/add-imports-testcases

# 2. Thêm test cases
# ... (viết code)

# 3. Stage và commit
git add robot-tests/
git commit -m "test: add 10 test cases for ImportsPage"

# 4. Push và tạo Pull Request
git push origin test/add-imports-testcases
```

### Quy ước commit message

```
feat:  thêm tính năng mới
fix:   sửa lỗi
test:  thêm/sửa test cases
docs:  cập nhật tài liệu
refactor: tái cấu trúc code
```

### File nên bỏ qua trong `.gitignore`

```
robot-tests/results/*.html
robot-tests/results/*.xml
robot-tests/results/selenium-screenshot-*.png
__pycache__/
*.pyc
```

---

## Future Improvements

### Cải tiến kỹ thuật

- [ ] **Parallel Execution** — Chạy song song nhiều suite cùng lúc với `pabot` (Parallel Robot Framework) để giảm thời gian chạy toàn bộ 79 TC
- [ ] **CI/CD Integration** — Tích hợp với GitHub Actions / Jenkins để tự động chạy test khi có push code
- [ ] **Data-Driven Testing** — Đọc dữ liệu test từ file Excel (`TESTCASE_MedEquip.xlsx`) thay vì hardcode trong test case
- [ ] **Cross-Browser Testing** — Mở rộng kiểm thử sang Firefox và Edge (hiện chỉ Chrome)
- [ ] **Headless Mode** — Chạy test không cần mở cửa sổ trình duyệt (phù hợp cho CI/CD)

```bash
# Headless Chrome (thêm vào common_keywords.resource)
${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
Call Method    ${options}    add_argument    --headless
```

### Mở rộng test coverage

- [ ] Thêm test cases cho trang **Báo cáo** (ReportsPage) và **Thông báo** (NotificationsPage)
- [ ] Kiểm thử trang **Quản lý người dùng** (UsersPage) và **Nhà cung cấp** (SuppliersPage)
- [ ] Thêm test cho chức năng **QR Code** quét thiết bị
- [ ] Kiểm thử **xuất Excel** báo cáo tồn kho
- [ ] Test **phân quyền âm** — đảm bảo NV Kho không truy cập được trang của Admin

### Cải thiện bảo trì

- [ ] Thêm **custom listener** để ghi log chi tiết hơn vào database
- [ ] Tự động **reset dữ liệu test** (test data cleanup) sau mỗi lần chạy
- [ ] **Screenshot comparison** — so sánh UI thực tế với UI mẫu để phát hiện regression về giao diện

---

## Author

**Nhóm phát triển MedEquip**

> Dự án được xây dựng trong khuôn khổ **Thực tập tốt nghiệp**, áp dụng phương pháp Vibe Coding kết hợp kiểm thử tự động Robot Framework theo mô hình POM.

| Thành phần | Mô tả |
|-----------|-------|
| Hệ thống chính | Quản lý kho thiết bị y tế (MedEquip) |
| Kiểm thử tự động | Robot Framework + SeleniumLibrary |
| Mô hình | Page Object Model (POM) |
| Tổng test cases | 79 test cases / 8 modules |

---

