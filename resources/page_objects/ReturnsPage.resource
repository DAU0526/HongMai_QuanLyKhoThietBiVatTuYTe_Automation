*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/ReturnsPageLocators.py

*** Keywords ***
Mở Trang Returns
    Go To    ${RETURNS_URL}
    Sleep    1s

Tìm Kiếm Phiếu Trả
    [Arguments]    ${tuKhoa}
    Clear Element Text    ${INPUT_SEARCH}
    Input Text    ${INPUT_SEARCH}    ${tuKhoa}
    Sleep    0.5s

Đếm Số Phiếu Trả
    ${count}=    Get Element Count    ${TBL_ROWS}
    RETURN    ${count}

Lấy Trạng Thái Phiếu Trả Đầu Tiên
    Wait Until Element Is Visible    ${LBL_FIRST_STATUS}    timeout=5s
    ${text}=    Get Text    ${LBL_FIRST_STATUS}
    RETURN    ${text}

Mở Form Tạo Phiếu Trả
    Wait Until Element Is Visible    ${BTN_TAO_PHIEU_TRA}    timeout=5s
    Click Element    ${BTN_TAO_PHIEU_TRA}
    Wait Until Element Is Visible    ${DLG_CREATE}    timeout=5s

Đóng Form Tạo Phiếu Trả
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${DLG_CREATE}    timeout=5s

Chọn Phiếu Cấp Phát
    [Arguments]    ${maPhieuCP}
    Click Element    ${DDL_PHIEU_CAP_PHAT}
    ${opt}=    Set Variable    xpath://div[@role='option'][contains(normalize-space(),'${maPhieuCP}')]
    Wait Until Element Is Visible    ${opt}    timeout=5s
    Click Element    ${opt}

Chọn Tình Trạng
    [Arguments]    ${tinhTrang}
    Click Element    ${DDL_TINH_TRANG}
    ${opt}=    Set Variable    xpath://div[@role='option'][normalize-space()='${tinhTrang}']
    Wait Until Element Is Visible    ${opt}    timeout=5s
    Click Element    ${opt}

Nhập Ghi Chú
    [Arguments]    ${ghiChu}
    Input Text    ${TEXTAREA_GHI_CHU}    ${ghiChu}

Gửi Phiếu Trả
    Click Element    ${BTN_SUBMIT}
    Chờ Toast Thành Công

Xác Nhận Phiếu Trả Đầu Tiên
    [Documentation]    NV_KHO xác nhận phiếu trả → nhấn Xác nhận lần 2 trong dialog
    Wait Until Element Is Visible    ${BTN_XAC_NHAN}    timeout=5s
    Click Element    ${BTN_XAC_NHAN}
    Wait Until Element Is Visible    ${BTN_CONFIRM}    timeout=5s
    Click Element    ${BTN_CONFIRM}
    Chờ Toast Thành Công

Từ Chối Phiếu Trả Đầu Tiên
    [Arguments]    ${lyDo}
    [Documentation]    NV_KHO từ chối → nhập lý do → xác nhận
    Wait Until Element Is Visible    ${BTN_TU_CHOI}    timeout=5s
    Click Element    ${BTN_TU_CHOI}
    Wait Until Element Is Visible    ${INPUT_REJECT_REASON}    timeout=5s
    Input Text    ${INPUT_REJECT_REASON}    ${lyDo}
    Click Element    ${BTN_SUBMIT_REJECT}
    Chờ Toast Thành Công

Hủy Phiếu Trả Đầu Tiên
    Wait Until Element Is Visible    ${BTN_HUY}    timeout=5s
    Click Element    ${BTN_HUY}
    Chờ Toast Thành Công

Xóa Phiếu Trả Đầu Tiên
    Wait Until Element Is Visible    ${BTN_XOA}    timeout=5s
    Click Element    ${BTN_XOA}
    Chờ Toast Thành Công

Kiểm Tra Nút Tạo Phiếu Trả Hiển Thị
    Element Should Be Visible    ${BTN_TAO_PHIEU_TRA}

Kiểm Tra Nút Tạo Phiếu Trả Ẩn
    Element Should Not Be Visible    ${BTN_TAO_PHIEU_TRA}
