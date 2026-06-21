# ============================================================
# AllocationsPageLocators.py
# Chứa tất cả locators cho trang Cấp phát (/requests - AllocationsPage)
# ============================================================

# --- URL ---
# ALLOCATIONS_URL = "http://localhost:5173/requests"

ALLOCATIONS_URL = "http://localhost:8080/allocations"

# --- Search ---
INPUT_SEARCH        = "xpath://input[contains(@placeholder,'Tìm phiếu cấp phát')]"

# --- Buttons header ---
BTN_GUI_YEU_CAU     = "xpath://button[contains(normalize-space(),'Gửi yêu cầu cấp phát')]"
BTN_QUET_QR         = "xpath://button[contains(normalize-space(),'Quét mã phiếu')]"

# --- Tabs ---
TAB_LICH_SU         = "xpath://button[@role='tab'][contains(normalize-space(),'Lịch sử cấp phát')]"
TAB_CHO_XU_LY       = "xpath://button[@role='tab'][contains(normalize-space(),'Chờ xử lý')]"
TAB_YEU_CAU_TOI     = "xpath://button[@role='tab'][contains(normalize-space(),'Yêu cầu của tôi')]"
LBL_PENDING_BADGE   = "xpath://button[@role='tab'][contains(.,'Chờ xử lý')]//div[contains(@class,'bg-destructive')]"

# --- Table lịch sử cấp phát ---
TBL_ROWS            = "xpath://table//tbody//tr"
TBL_FIRST_ROW       = "xpath://table//tbody//tr[1]"
LBL_FIRST_STATUS    = "xpath://table//tbody//tr[1]//div[contains(@class,'rounded') or contains(@class,'Badge')]"

# --- Card phiếu chờ xử lý ---
ELM_PENDING_CARD    = "xpath://div[contains(@class,'rounded-xl') and contains(@class,'p-5')]"
BTN_XU_LY           = "xpath://button[contains(normalize-space(),'Xử lý xuất kho')]"

# --- Dialog tạo yêu cầu cấp phát ---
DLG_CREATE          = "xpath://div[@role='dialog']"
DDL_KHOA            = "xpath://div[@role='dialog']//button[@role='combobox'][1]"
INPUT_LY_DO         = "xpath://div[@role='dialog']//input[contains(@placeholder,'Cần bổ sung')]"
BTN_ADD_ITEM        = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Thêm dòng')]"
DDL_THIET_BI        = "xpath:(//div[@role='dialog']//button[@role='combobox'])[2]"
INPUT_SO_LUONG      = "xpath://div[@role='dialog']//input[@type='number']"
BTN_SUBMIT          = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Gửi yêu cầu')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[normalize-space()='Hủy bỏ']"

# --- Dialog xử lý cấp phát ---
DLG_PROCESS_TITLE   = "xpath://div[@role='dialog']//h2[contains(.,'Xử lý phiếu')]"
BTN_FINISH_PROCESS  = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Hoàn tất')]"

# --- Toast ---
TOAST_SUCCESS       = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR         = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
