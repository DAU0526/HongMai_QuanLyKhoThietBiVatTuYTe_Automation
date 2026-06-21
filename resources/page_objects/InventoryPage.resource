*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/InventoryPageLocators.py

*** Keywords ***
Mở Trang Inventory
    Go To    ${INVENTORY_URL}
    Wait Until Element Is Visible    ${INPUT_SEARCH}    timeout=10s

Chuyển Tab Tồn Kho
    Click Element    ${TAB_TON_KHO}
    Sleep    0.5s

Chuyển Tab Nhập Kho
    Click Element    ${TAB_NHAP_KHO}
    Sleep    0.5s

Chuyển Tab Xuất Kho
    Click Element    ${TAB_XUAT_KHO}
    Sleep    0.5s

Tìm Kiếm Thiết Bị
    [Arguments]    ${tuKhoa}
    Clear Element Text    ${INPUT_SEARCH}
    Input Text    ${INPUT_SEARCH}    ${tuKhoa}
    Sleep    0.5s

Lọc Theo Trạng Thái
    [Arguments]    ${optLocator}
    Click Element    ${DDL_FILTER}
    Wait Until Element Is Visible    ${optLocator}    timeout=5s
    Click Element    ${optLocator}
    Sleep    0.5s

Đếm Số Dòng Bảng
    ${count}=    Get Element Count    ${TBL_ROWS}
    RETURN    ${count}

Kiểm Tra Bảng Có Dữ Liệu
    ${count}=    Đếm Số Dòng Bảng
    Should Be True    ${count} > 0    msg=Bảng tồn kho không có dữ liệu

Xem Chi Tiết Thiết Bị Đầu Tiên
    Click Element    ${TBL_FIRST_ROW}
    Wait Until Element Is Visible    ${DLG_DETAIL}    timeout=5s

Đóng Dialog Chi Tiết
    Click Element    ${BTN_DETAIL_CLOSE}
    Wait Until Element Is Not Visible    ${DLG_DETAIL}    timeout=5s

Mở Form Thêm Thiết Bị
    Click Element    ${BTN_ADD_THIET_BI}
    Wait Until Element Is Visible    ${INPUT_TEN_THIET_BI}    timeout=5s

Điền Form Thiết Bị
    [Arguments]    ${tenThietBi}    ${loaiOption}    ${dvCoSo}    ${dvNhap}
    Clear Element Text    ${INPUT_TEN_THIET_BI}
    Input Text    ${INPUT_TEN_THIET_BI}    ${tenThietBi}
    Click Element    ${DDL_LOAI_THIET_BI}
    Wait Until Element Is Visible    ${loaiOption}    timeout=5s
    Click Element    ${loaiOption}
    Clear Element Text    ${INPUT_DV_CO_SO}
    Input Text    ${INPUT_DV_CO_SO}    ${dvCoSo}
    Clear Element Text    ${INPUT_DV_NHAP}
    Input Text    ${INPUT_DV_NHAP}    ${dvNhap}

Lưu Thiết Bị
    Click Element    ${BTN_SAVE}
    Wait Until Element Is Not Visible    ${BTN_SAVE}    timeout=10s

Hủy Form
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${BTN_CANCEL_DLG}    timeout=5s

Kiểm Tra Cảnh Báo Low Stock Hiển Thị
    ${count}=    Get Element Count    ${ROW_LOW_STOCK}
    RETURN    ${count}

Kiểm Tra Tổng Tài Sản Hiển Thị
    Element Should Be Visible    ${LBL_TOTAL_ASSET}
    ${text}=    Get Text    ${LBL_TOTAL_ASSET}
    Should Contain    ${text}    đ

Kiểm Tra Tổng Tài Sản Ẩn
    Element Should Not Be Visible    ${LBL_TOTAL_ASSET}
