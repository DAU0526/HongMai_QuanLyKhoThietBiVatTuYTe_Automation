*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/ImportsPageLocators.py

*** Keywords ***
Tìm Kiếm Theo Mã Phiếu
    [Arguments]    ${maPhieu}
    Clear Element Text    ${INPUT_SEARCH_PHIEU}
    Input Text    ${INPUT_SEARCH_PHIEU}    ${maPhieu}
    Wait Until Element Is Visible    ${ELM_PHIEU_LIST}    timeout=5s

Tìm Kiếm Theo Thiết Bị
    [Arguments]    ${tuKhoa}
    Clear Element Text    ${INPUT_SEARCH_TB}
    Input Text    ${INPUT_SEARCH_TB}    ${tuKhoa}
    Wait Until Element Is Visible    ${ELM_PHIEU_LIST}    timeout=5s

Đếm Số Phiếu
    ${count}=    Get Element Count    ${ELM_PHIEU_LIST}
    RETURN    ${count}

Mở Rộng Phiếu Đầu Tiên
    Click Element    ${BTN_EXPAND_FIRST}
    Wait Until Element Is Visible    ${LBL_STATUS}    timeout=5s

Lấy Trạng Thái Phiếu Đầu Tiên
    Wait Until Element Is Visible    ${LBL_STATUS}    timeout=5s
    ${text}=    Get Text    ${LBL_STATUS}
    RETURN    ${text}

Duyệt Phiếu Đầu Tiên
    [Documentation]    Mở rộng phiếu đầu tiên rồi nhấn Duyệt nhập kho
    Mở Rộng Phiếu Đầu Tiên
    Wait Until Element Is Visible    ${BTN_APPROVE}    timeout=5s
    Click Element    ${BTN_APPROVE}
    Chờ Toast Thành Công

Từ Chối Phiếu Đầu Tiên
    [Arguments]    ${lyDo}
    [Documentation]    Mở rộng phiếu đầu tiên → từ chối → nhập lý do → xác nhận
    Mở Rộng Phiếu Đầu Tiên
    Wait Until Element Is Visible    ${BTN_REJECT}    timeout=5s
    Click Element    ${BTN_REJECT}
    Wait Until Element Is Visible    ${INPUT_REJECT_REASON}    timeout=5s
    Input Text    ${INPUT_REJECT_REASON}    ${lyDo}
    Click Element    ${BTN_CONFIRM_REJECT}
    Chờ Toast Thành Công

Xóa Phiếu Đầu Tiên
    [Documentation]    Mở rộng → nhấn Xóa lịch sử → xác nhận
    Mở Rộng Phiếu Đầu Tiên
    Wait Until Element Is Visible    ${BTN_DELETE_PHIEU}    timeout=5s
    Click Element    ${BTN_DELETE_PHIEU}
    Wait Until Element Is Visible    ${BTN_CONFIRM_DELETE}    timeout=5s
    Click Element    ${BTN_CONFIRM_DELETE}
    Chờ Toast Thành Công

Chọn Tất Cả Phiếu
    Click Element    ${CHK_SELECT_ALL}

Xóa Nhiều Phiếu Đã Chọn
    Wait Until Element Is Visible    ${BTN_XOA_CHON}    timeout=5s
    Click Element    ${BTN_XOA_CHON}
    Wait Until Element Is Visible    ${BTN_CONFIRM_DELETE}    timeout=5s
    Click Element    ${BTN_CONFIRM_DELETE}
    Chờ Toast Thành Công

Mở Dialog Tạo Phiếu Nhập
    Click Element    ${BTN_TAO_PHIEU}
    Wait Until Element Is Visible    ${DLG_CREATE}    timeout=5s

Đóng Dialog Tạo Phiếu Nhập
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${DLG_CREATE}    timeout=5s

Kiểm Tra Nút Xóa Ẩn
    Element Should Not Be Visible    ${BTN_DELETE_PHIEU}

Kiểm Tra Nút Duyệt Hiển Thị
    Element Should Be Visible    ${BTN_APPROVE}
