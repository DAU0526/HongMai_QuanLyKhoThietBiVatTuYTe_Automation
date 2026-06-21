*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/ExportsPageLocators.py

*** Keywords ***
Tìm Kiếm Theo Mã Phiếu Xuất
    [Arguments]    ${maPhieu}
    Clear Element Text    ${INPUT_SEARCH_PHIEU}
    Input Text    ${INPUT_SEARCH_PHIEU}    ${maPhieu}
    Sleep    0.5s

Đếm Số Phiếu Xuất
    ${count}=    Get Element Count    ${ELM_PHIEU_LIST}
    RETURN    ${count}

Mở Rộng Phiếu Xuất Đầu Tiên
    Click Element    ${BTN_EXPAND_FIRST}
    Sleep    0.5s

Lấy Trạng Thái Phiếu Xuất Đầu Tiên
    Wait Until Element Is Visible    ${LBL_STATUS}    timeout=5s
    ${text}=    Get Text    ${LBL_STATUS}
    RETURN    ${text}

Mở Dialog Tạo Phiếu Xuất
    Click Element    ${BTN_TAO_PHIEU}
    Wait Until Element Is Visible    ${DLG_CREATE}    timeout=5s

Đóng Dialog Tạo Phiếu Xuất
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${DLG_CREATE}    timeout=5s

Duyệt Phiếu Xuất Đầu Tiên
    [Documentation]    Mở rộng phiếu đầu tiên → nhấn Duyệt xuất kho
    Mở Rộng Phiếu Xuất Đầu Tiên
    Wait Until Element Is Visible    ${BTN_APPROVE}    timeout=5s
    Click Element    ${BTN_APPROVE}
    Chờ Toast Thành Công

Hủy Phiếu Xuất Đầu Tiên
    [Documentation]    Mở rộng phiếu đầu tiên → nhấn Hủy phiếu
    Mở Rộng Phiếu Xuất Đầu Tiên
    Wait Until Element Is Visible    ${BTN_CANCEL_PHIEU}    timeout=5s
    Click Element    ${BTN_CANCEL_PHIEU}
    Chờ Toast Thành Công

Xuất Danh Sách Ra Excel
    Click Element    ${BTN_EXPORT_EXCEL}
    Sleep    2s

Kiểm Tra Nút Tạo Phiếu Hiển Thị
    Element Should Be Visible    ${BTN_TAO_PHIEU}

Kiểm Tra Nút Duyệt Hiển Thị
    Element Should Be Visible    ${BTN_APPROVE}
