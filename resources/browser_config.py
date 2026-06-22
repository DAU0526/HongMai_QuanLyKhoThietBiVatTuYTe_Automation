# ============================================================
# browser_config.py
# Tài liệu tham khảo các ChromeOptions được cấu hình trong
# common_keywords.resource > keyword "Mở Trình Duyệt"
#
# File này KHÔNG được import trực tiếp vào Robot Framework.
# Mục đích: lưu lại config browser để dễ tham khảo và mở rộng.
# ============================================================
#
# Các options đang được dùng trong common_keywords.resource:
#
#   --disable-notifications      : Tắt popup "Cho phép thông báo"
#   --disable-popup-blocking     : Tắt chặn popup của trình duyệt
#   --disable-infobars           : Tắt thanh thông tin (Extensions, etc.)
#   --start-maximized            : Mở cửa sổ full màn hình
#   --no-sandbox                 : Cần thiết khi chạy trên Linux/CI
#   --disable-dev-shm-usage      : Tránh lỗi bộ nhớ trên Linux/Docker
#   excludeSwitches: enable-automation  : Tắt banner "Chrome đang bị kiểm soát"
#   useAutomationExtension: False       : Tắt extension automation
#
# Để bật Headless mode (chạy không mở cửa sổ, dùng cho CI/CD):
#   Bỏ comment dòng sau trong keyword "Mở Trình Duyệt":
#   Call Method    ${options}    add_argument    --headless=new
#
# Để chạy trên Firefox thay Chrome:
#   Đổi BROWSER: "firefox" trong environment_variables.yml
#   Và thay Open Browser dùng FirefoxOptions thay ChromeOptions
# ============================================================
