# ============================================================
# InventoryPageLocators.py
# Chứa tất cả locators cho trang Quản lý Kho (/inventory)
# ============================================================

# --- URL ---
# INVENTORY_URL = "http://localhost:5173/inventory"

INVENTORY_URL = "http://localhost:8080/inventory"

# --- Tabs ---
TAB_TON_KHO     = "xpath://button[@role='tab'][contains(.,'Tồn kho')]"
TAB_NHAP_KHO    = "xpath://button[@role='tab'][contains(.,'Nhập kho')]"
TAB_XUAT_KHO    = "xpath://button[@role='tab'][contains(.,'Xuất kho')]"

# --- Search & Filter ---
INPUT_SEARCH    = "xpath://input[contains(@placeholder,'Tìm tên, mã thiết bị')]"
DDL_FILTER      = "xpath:(//button[@role='combobox'])[1]"
DDL_SORT        = "xpath:(//button[@role='combobox'])[2]"

# --- Filter options ---
OPT_ALL         = "xpath://div[@role='option'][normalize-space()='Tất cả thiết bị']"
OPT_TRONG_KHO   = "xpath://div[@role='option'][normalize-space()='Đang có trong kho']"
OPT_DANG_DUNG   = "xpath://div[@role='option'][normalize-space()='Đang được sử dụng']"
OPT_HU_HONG     = "xpath://div[@role='option'][normalize-space()='Có thiết bị hư hỏng']"
OPT_HET_HANG    = "xpath://div[@role='option'][normalize-space()='Đã hết sạch hàng']"

# --- Table ---
TBL_ROWS        = "xpath://table//tbody//tr"
TBL_FIRST_ROW   = "xpath://table//tbody//tr[1]"
ROW_LOW_STOCK   = "xpath://tr[contains(@class,'bg-destructive')]"

# --- Tổng tài sản ---
LBL_TOTAL_ASSET = "xpath://div[contains(@class,'text-2xl') and contains(@class,'font-mono') and contains(text(),'đ')]"

# --- Dialog chi tiết ---
DLG_DETAIL          = "xpath://div[@role='dialog']"
BTN_DETAIL_EDIT     = "xpath://div[@role='dialog']//button[contains(.,'Sửa thông tin')]"
BTN_DETAIL_CLOSE    = "xpath://div[@role='dialog']//button[normalize-space()='Thoát']"

# --- Dialog tạo phiếu nhập (Excel-based) ---
# Thiết bị được thêm mới thông qua luồng upload file Excel (Nhập kho)
# Locator này khớp với dialog "Tạo phiếu nhập hàng" trong tab Nhập kho
BTN_TAO_PHIEU_NHAP  = "xpath://button[contains(normalize-space(),'Tạo phiếu nhập hàng')]"
DLG_CREATE_PHIEU    = "xpath://div[@role='dialog']"
INPUT_FILE_EXCEL    = "xpath://input[@type='file' and @accept='.xlsx']"
INPUT_FILE_IMAGE    = "xpath://input[@type='file' and @accept='image/*']"
BTN_CONFIRM_IMPORT  = "xpath://button[contains(normalize-space(),'Xác nhận nhập kho')]"
BTN_CANCEL_DLG      = "xpath://div[@role='dialog']//button[normalize-space()='Hủy']"

# --- Dialog sửa thông tin thiết bị ---
BTN_SAVE            = "xpath://div[@role='dialog']//button[contains(normalize-space(),'Lưu thay đổi')]"

# --- Combobox loại thiết bị (trong dialog sửa) ---
DDL_LOAI_THIET_BI   = "xpath://div[@role='dialog']//button[@role='combobox'][1]"
OPT_TAI_SU_DUNG     = "xpath://div[@role='option'][normalize-space()='Tái sử dụng']"
OPT_TIEU_HAO        = "xpath://div[@role='option'][normalize-space()='Vật tư tiêu hao']"

# --- Toast ---
TOAST_SUCCESS   = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]"
TOAST_ERROR     = "xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]"
