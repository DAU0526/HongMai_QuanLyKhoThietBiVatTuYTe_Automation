*** Settings ***
Library     SeleniumLibrary
Resource    ../common_keywords.resource
Variables   ../locators/AllocationsPageLocators.py

*** Keywords ***
Mở Trang Allocations
    Go To    ${ALLOCATIONS_URL}
    Wait Until Element Is Visible    ${TAB_LICH_SU}    timeout=10s

Chuyển Tab Lịch Sử Cấp Phát
    Click Element    ${TAB_LICH_SU}
    Wait Until Element Is Visible    ${TBL_ROWS}    timeout=5s

Chuyển Tab Chờ Xử Lý
    Click Element    ${TAB_CHO_XU_LY}
    Wait Until Element Is Visible    ${LBL_PENDING_BADGE}    timeout=5s

Chuyển Tab Yêu Cầu Của Tôi
    Click Element    ${TAB_YEU_CAU_TOI}
    Wait Until Element Is Visible    ${INPUT_SEARCH}    timeout=5s

Tìm Kiếm Phiếu
    [Arguments]    ${tuKhoa}
    Clear Element Text    ${INPUT_SEARCH}
    Input Text    ${INPUT_SEARCH}    ${tuKhoa}
    Wait Until Element Is Visible    ${ELM_PENDING_CARD}    timeout=5s

Đếm Phiếu Chờ Xử Lý
    ${count}=    Get Element Count    ${ELM_PENDING_CARD}
    RETURN    ${count}

Kiểm Tra Tab Lịch Sử Hiển Thị
    Element Should Be Visible    ${TAB_LICH_SU}

Kiểm Tra Tab Lịch Sử Ẩn
    Element Should Not Be Visible    ${TAB_LICH_SU}

Kiểm Tra Tab Yêu Cầu Của Tôi Hiển Thị
    Element Should Be Visible    ${TAB_YEU_CAU_TOI}

Kiểm Tra Nút Quét QR Hiển Thị
    Element Should Be Visible    ${BTN_QUET_QR}

Kiểm Tra Nút Quét QR Ẩn
    Element Should Not Be Visible    ${BTN_QUET_QR}

Kiểm Tra Nút Gửi Yêu Cầu Hiển Thị
    Element Should Be Visible    ${BTN_GUI_YEU_CAU}

Kiểm Tra Nút Gửi Yêu Cầu Ẩn
    Element Should Not Be Visible    ${BTN_GUI_YEU_CAU}

Mở Form Gửi Yêu Cầu Cấp Phát
    Click Element    ${BTN_GUI_YEU_CAU}
    Wait Until Element Is Visible    ${DLG_CREATE}    timeout=5s

Đóng Form Yêu Cầu
    Click Element    ${BTN_CANCEL_DLG}
    Wait Until Element Is Not Visible    ${DLG_CREATE}    timeout=5s

Gửi Yêu Cầu Cấp Phát
    [Arguments]    ${tenKhoa}    ${lyDo}    ${tenThietBi}    ${soLuong}
    [Documentation]    Điền đầy đủ form → nhấn Gửi yêu cầu
    Mở Form Gửi Yêu Cầu Cấp Phát
    Click Element    ${DDL_KHOA}
    ${opt_khoa}=    Set Variable    xpath://div[@role='option'][normalize-space()='${tenKhoa}']
    Wait Until Element Is Visible    ${opt_khoa}    timeout=5s
    Click Element    ${opt_khoa}
    Clear Element Text    ${INPUT_LY_DO}
    Input Text    ${INPUT_LY_DO}    ${lyDo}
    Click Element    ${DDL_THIET_BI}
    ${opt_tb}=    Set Variable    xpath://div[@role='option'][contains(normalize-space(),'${tenThietBi}')]
    Wait Until Element Is Visible    ${opt_tb}    timeout=5s
    Click Element    ${opt_tb}
    Clear Element Text    ${INPUT_SO_LUONG}
    Input Text    ${INPUT_SO_LUONG}    ${soLuong}
    Click Element    ${BTN_SUBMIT}
    Chờ Toast Thành Công

Xử Lý Phiếu Chờ Đầu Tiên
    [Documentation]    NV_KHO nhấn Xử lý xuất kho trên card đầu tiên
    Wait Until Element Is Visible    ${BTN_XU_LY}    timeout=5s
    Click Element    ${BTN_XU_LY}
    Wait Until Element Is Visible    ${DLG_PROCESS_TITLE}    timeout=5s

Hoàn Tất Xử Lý
    Click Element    ${BTN_FINISH_PROCESS}
    Chờ Toast Thành Công
