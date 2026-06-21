# ============================================================
# ExportsPageLocators.py
# Chứa tất cả locators cho trang Xuất kho (tab trong /inventory)
# ============================================================

# --- Buttons header ---
BTN_TAO_PHIEU       = "xpath://button[contains(normalize-space(),'Tạo phiếu xuất kho')]"
BTN_EXPORT_EXCEL    = "xpath://button[contains(normalize-space(),'Xuất Excel')]"
BTN_XOA_CHON       = "xpath://button[contains(normalize-space(),'Xóa đã chọn')]"

# --- Search ---
INPUT_SEARCH_PHIEU  = "xpath://input[@placeholder='Mã phiếu...']"

# --- Phiếu xuất (accordion row) ---
ELM_PHIEU_LIST      = "xpath://div[contains(@class,'rounded-xl') and contains(@class,'border') and contains(@class,'bg-card')]"
ELM_PHIEU_FIRST     = "xpath:(//div[contains(@class,'rounded-xl') and contains(@class,'border') and contains(@class,'bg-card')])[1]"
BTN_EXPAND_FIRST    = "xpath:(//div[contains(@class,'cursor-pointer')])[1]"
LBL_STATUS          = "xpath:(//div[contains(@class,'rounded-full') and contains(@class,'font-bold')])[1]"

# --- Buttons hành động ---
BTN_APPROVE         = "xpath://button[contains(normalize-space(),'Duyệt xuất kho')]"
BTN_CANCEL_PHIEU    = "xpath://button[contains(normalize-space(),'Hủy phiếu')]"
BTN_DELETE_PHIEU    = "xpath://button[contains(normalize-space(),'Xóa lịch sử')]"

# --- Dialog tạo phiếu xuất ---
DLG_CREATE          = "xpath://div[@role='dialog']"
INPUT_LY_DO         = "xpath://div[@role='dialog']//input[@placeholder]"
TEXTAREA_GHI_CHU    = "xpath://div[@role='dialog']//textarea"
DDL_THIET_BI        = "xpath://div[@role='dialog']//button[@role='combobox'][1]"
INPUT_SO_LUONG      = "xpath://div[@role='dialog']//input[@type='number']"
BTN_ADD_ITEM        = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Thêm dòng')]"
BTN_SUBMIT          = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Tạo phiếu')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[normalize-space()='Hủy']"

# --- Dialog xác nhận xóa ---
BTN_CONFIRM_DELETE  = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Xóa')]"

# --- Toast ---
TOAST_SUCCESS       = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR         = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
