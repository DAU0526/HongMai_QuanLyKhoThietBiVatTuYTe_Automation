# ============================================================
# RegisterPageLocators.py
# Chứa tất cả locators cho trang Đăng ký (/register)
# ============================================================

# --- URL ---
# REGISTER_URL = "http://localhost:5173/register"

REGISTER_URL = "http://localhost:8080/register"

# --- Input fields ---
INPUT_HO_TEN        = "id:hoTen"
INPUT_EMAIL         = "id:email"
INPUT_PHONE         = "id:soDienThoai"
INPUT_PASSWORD      = "id:password"
INPUT_CONFIRM_PW    = "id:confirmPassword"

# --- Dropdown vai trò (Shadcn Select - dùng xpath) ---
DDL_VAI_TRO         = "xpath:(//button[@role='combobox'])[1]"
DDL_KHOA            = "xpath:(//button[@role='combobox'])[2]"

# --- Options vai trò ---
OPT_TRUONG_KHOA     = "xpath://div[@role='option'][normalize-space()='Trưởng Khoa']"
OPT_NV_KHO          = "xpath://div[@role='option'][normalize-space()='Nhân viên Kho']"
OPT_QL_KHO          = "xpath://div[@role='option'][normalize-space()='Quản lý Kho']"
OPT_QL_KHOA         = "xpath://div[@role='option'][normalize-space()='Quản lý Khoa']"

# --- Buttons ---
BTN_SUBMIT          = "xpath://button[@type='submit']"
BTN_TOGGLE_PW       = "xpath://input[@id='password']/following-sibling::button"
BTN_TOGGLE_CONFIRM  = "xpath://input[@id='confirmPassword']/following-sibling::button"
BTN_BACK_LOGIN      = "xpath://button[contains(text(),'Quay lại Đăng nhập')]"
BTN_GO_LOGIN        = "xpath://button[contains(text(),'Đăng nhập ngay')]"

# --- Thông báo ---
MSG_ERROR           = "xpath://div[contains(@class,'bg-destructive')]//p"
MSG_SUCCESS         = "xpath://p[contains(@class,'text-green-600')]"
ICO_SUCCESS         = "xpath://svg[contains(@class,'text-green-500')]"
