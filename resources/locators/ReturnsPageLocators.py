# ============================================================
# ReturnsPageLocators.py
# Chứa tất cả locators cho trang Trả thiết bị (/returns)
# ============================================================

# --- URL ---
# RETURNS_URL         = "http://localhost:5173/returns"

RETURNS_URL         = "http://localhost:8080/returns"

# --- Search ---
INPUT_SEARCH        = "xpath://input[contains(@placeholder,'Tìm phiếu')]"

# --- Buttons header ---
BTN_TAO_PHIEU_TRA   = "xpath://button[contains(normalize-space(),'Tạo phiếu trả')]"

# --- Table ---
TBL_ROWS            = "xpath://table//tbody//tr"
TBL_FIRST_ROW       = "xpath://table//tbody//tr[1]"
LBL_FIRST_STATUS    = "xpath://table//tbody//tr[1]//span[contains(@class,'rounded-full')]"

# --- Buttons hành động ---
BTN_XAC_NHAN        = "xpath://button[contains(normalize-space(),'Xác nhận')]"
BTN_TU_CHOI         = "xpath://button[normalize-space()='Từ chối']"
BTN_HUY             = "xpath://button[normalize-space()='Hủy']"
BTN_XOA             = "xpath://button[normalize-space()='Xóa']"
BTN_GIA_HAN         = "xpath://button[contains(normalize-space(),'Gia hạn')]"

# --- Dialog tạo phiếu trả ---
DLG_CREATE          = "xpath://div[@role='dialog']"
DDL_PHIEU_CAP_PHAT  = "xpath://div[@role='dialog']//button[@role='combobox'][1]"
DDL_TINH_TRANG      = "xpath:(//div[@role='dialog']//button[@role='combobox'])[2]"
TEXTAREA_GHI_CHU    = "xpath://div[@role='dialog']//textarea"
INPUT_ANH_MC        = "xpath://div[@role='dialog']//input[@type='file']"
BTN_SUBMIT          = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Tạo phiếu trả')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[normalize-space()='Hủy']"

# --- Dialog xác nhận / từ chối ---
BTN_CONFIRM         = "xpath://button[normalize-space()='Xác nhận']"
INPUT_REJECT_REASON = "xpath://div[@role='dialog']//textarea"
BTN_SUBMIT_REJECT   = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Từ chối')]"

# --- Dialog gia hạn ---
DLG_GIA_HAN         = "xpath://div[@role='dialog'][.//h2[contains(.,'Gia hạn')]]"
INPUT_NGAY_GIA_HAN  = "xpath://div[@role='dialog']//input[@type='date']"
INPUT_LY_DO_GH      = "xpath://div[@role='dialog']//textarea"
BTN_SUBMIT_GH       = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Xác nhận')]"

# --- Toast ---
TOAST_SUCCESS       = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR         = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
