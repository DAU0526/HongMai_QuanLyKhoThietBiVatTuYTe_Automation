# ============================================================
# ImportsPageLocators.py
# Chứa tất cả locators cho trang Nhập kho (tab trong /inventory)
# ============================================================

# --- Buttons header ---
BTN_TAO_PHIEU       = "xpath://button[contains(normalize-space(),'Tạo phiếu nhập hàng')]"
BTN_XOA_CHON       = "xpath://button[contains(normalize-space(),'Xóa đã chọn')]"

# --- Search ---
INPUT_SEARCH_PHIEU  = "xpath://input[@placeholder='Mã phiếu...']"
INPUT_SEARCH_TB     = "xpath://input[contains(@placeholder,'Thiết bị hoặc nhà cung cấp')]"

# --- Checkbox chọn tất cả ---
CHK_SELECT_ALL      = "id:select-all"

# --- Phiếu nhập (accordion row) ---
ELM_PHIEU_LIST      = "xpath://div[contains(@class,'rounded-xl') and contains(@class,'border') and contains(@class,'bg-card')]"
ELM_PHIEU_FIRST     = "xpath:(//div[contains(@class,'rounded-xl') and contains(@class,'border') and contains(@class,'bg-card')])[1]"
BTN_EXPAND_FIRST    = "xpath:(//div[contains(@class,'cursor-pointer') and contains(@class,'hover:bg-muted')])[1]"

# --- Badge trạng thái (trong phiếu đã mở rộng) ---
LBL_STATUS          = "xpath:(//div[contains(@class,'rounded-full') and contains(@class,'font-bold')])[1]"

# --- Buttons hành động (sau khi mở rộng phiếu) ---
BTN_APPROVE         = "xpath://button[contains(normalize-space(),'Duyệt nhập kho')]"
BTN_REJECT          = "xpath://button[normalize-space()='Từ chối']"
BTN_VIEW_CHUNG_TU   = "xpath://button[contains(normalize-space(),'Xem chứng từ')]"
BTN_DELETE_PHIEU    = "xpath://button[contains(normalize-space(),'Xóa lịch sử')]"

# --- Dialog tạo phiếu nhập ---
DLG_CREATE          = "xpath://div[@role='dialog']"
INPUT_FILE_EXCEL    = "xpath://input[@type='file' and @accept='.xlsx']"
INPUT_FILE_IMAGE    = "xpath://input[@type='file' and @accept='image/*']"
BTN_CONFIRM_IMPORT  = "xpath://button[contains(normalize-space(),'Xác nhận nhập kho')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Hủy')]"

# --- Dialog xác nhận từ chối ---
INPUT_REJECT_REASON = "xpath://div[@role='dialog']//textarea"
BTN_CONFIRM_REJECT  = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Xác nhận từ chối')]"

# --- Dialog xác nhận xóa ---
BTN_CONFIRM_DELETE  = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Xóa')]"

# --- Toast ---
TOAST_SUCCESS       = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR         = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
