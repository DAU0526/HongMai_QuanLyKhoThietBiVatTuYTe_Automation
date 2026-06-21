# ============================================================
# RequestsPageLocators.py
# Chứa tất cả locators cho trang Yêu cầu thiết bị (/requests)
# ============================================================

# --- URL ---
# REQUESTS_URL        = "http://localhost:5173/requests"

REQUESTS_URL        = "http://localhost:8080/requests"
# --- Search ---
INPUT_SEARCH        = "xpath://input[contains(@placeholder,'Tìm phiếu')]"

# --- Buttons header ---
BTN_TAO_YEU_CAU     = "xpath://button[contains(normalize-space(),'Tạo yêu cầu')]"

# --- Table ---
TBL_ROWS            = "xpath://table//tbody//tr"
TBL_FIRST_ROW       = "xpath://table//tbody//tr[1]"
LBL_FIRST_STATUS    = "xpath://table//tbody//tr[1]/td[last()]//div[contains(@class,'rounded')]"

# --- Buttons hành động trên từng row ---
BTN_APPROVE_DEPT    = "xpath://button[contains(normalize-space(),'Duyệt khoa')]"
BTN_APPROVE_MGR     = "xpath://button[contains(normalize-space(),'Duyệt quản lý')]"
BTN_CANCEL          = "xpath://button[contains(normalize-space(),'Hủy')]"
BTN_DELETE          = "xpath://button[contains(normalize-space(),'Xóa')]"

# --- Dialog tạo yêu cầu ---
DLG_CREATE          = "xpath://div[@role='dialog']"
DDL_KHOA            = "xpath://div[@role='dialog']//button[@role='combobox'][1]"
INPUT_LY_DO         = "xpath://div[@role='dialog']//input[contains(@placeholder,'Cần bổ sung')]"
BTN_ADD_ITEM        = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Thêm dòng')]"
DDL_THIET_BI        = "xpath:(//div[@role='dialog']//button[@role='combobox'])[2]"
INPUT_SO_LUONG      = "xpath://div[@role='dialog']//input[@type='number']"
BTN_SUBMIT          = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Gửi yêu cầu')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[normalize-space()='Hủy bỏ']"

# --- Toast ---
TOAST_SUCCESS       = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR         = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
