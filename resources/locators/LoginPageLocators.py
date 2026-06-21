# ============================================================
# LoginPageLocators.py
# Chứa tất cả locators cho trang Đăng nhập (/login)
# ============================================================

# --- URL ---
# LOGIN_URL = "http://localhost:5173/login"

LOGIN_URL = "http://localhost:8080/login"

# --- Input fields ---
INPUT_EMAIL     = "id:email"
INPUT_PASSWORD  = "id:password"

# --- Buttons ---
BTN_SUBMIT      = "xpath://button[@type='submit']"
BTN_TOGGLE_PW   = "xpath://input[@id='password']/following-sibling::button"
BTN_REGISTER    = "xpath://button[contains(text(),'Đăng ký ngay')]"
BTN_LOGOUT      = "xpath://button[.//span[text()='Đăng xuất']]"

# --- Thông báo ---
MSG_ERROR       = "xpath://div[contains(@class,'bg-destructive')]//p"

# --- Sau khi đăng nhập thành công ---
LBL_DASHBOARD   = "xpath://button[.//span[text()='Tổng quan']]"
