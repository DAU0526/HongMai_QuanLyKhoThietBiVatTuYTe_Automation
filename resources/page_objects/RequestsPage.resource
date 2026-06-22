*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/RequestsPageLocators.py

*** Keywords ***
Mở Trang Requests
    Go To    ${REQUESTS_URL}
    Wait Until Element Is Visible    ${INPUT_SEARCH}    timeout=10s

Tìm Kiếm Yêu Cầu
    [Arguments]    ${tuKhoa}
    Clear Element Text    ${INPUT_SEARCH}
    Input Text    ${INPUT_SEARCH}    ${tuKhoa}
    Wait Until Element Is Visible    ${TBL_ROWS}    timeout=5s

Đếm Số Yêu Cầu
    ${count}=    Get Element Count    ${TBL_ROWS}
    RETURN    ${count}

Lấy Trạng Thái Yêu Cầu Đầu Tiên
    Wait Until Element Is Visible    ${LBL_FIRST_STATUS}    timeout=5s
    ${text}=    Get Text    ${LBL_FIRST_STATUS}
    RETURN    ${text}

Mở Form Tạo Yêu Cầu
    Click Element    ${BTN_TAO_YEU_CAU}
    Wait Until Element Is Visible    ${DLG_CREATE}    timeout=5s

Đóng Form Yêu Cầu
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${DLG_CREATE}    timeout=5s

Duyệt Cấp Khoa Yêu Cầu Đầu Tiên
    [Documentation]    Nhấn nút Duyệt khoa (approve-dept) trên yêu cầu đầu tiên
    Wait Until Element Is Visible    ${BTN_APPROVE_DEPT}    timeout=5s
    Click Element    ${BTN_APPROVE_DEPT}
    Chờ Toast Thành Công

Duyệt Quản Lý Yêu Cầu Đầu Tiên
    [Documentation]    Nhấn nút Duyệt quản lý (approve-mgr) trên yêu cầu đầu tiên
    Wait Until Element Is Visible    ${BTN_APPROVE_MGR}    timeout=5s
    Click Element    ${BTN_APPROVE_MGR}
    Chờ Toast Thành Công

Hủy Yêu Cầu Đầu Tiên
    Wait Until Element Is Visible    ${BTN_CANCEL}    timeout=5s
    Click Element    ${BTN_CANCEL}
    Chờ Toast Thành Công

Xóa Yêu Cầu Đầu Tiên
    Wait Until Element Is Visible    ${BTN_DELETE}    timeout=5s
    Click Element    ${BTN_DELETE}
    Chờ Toast Thành Công

Kiểm Tra Bảng Có Dữ Liệu
    ${count}=    Đếm Số Yêu Cầu
    Should Be True    ${count} > 0    msg=Bảng yêu cầu không có dữ liệu
