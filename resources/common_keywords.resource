*** Settings ***
Library     SeleniumLibrary
Library     Collections
Variables   environment_variables.yml

*** Keywords ***
# ============================================================
# MỞ / ĐÓNG TRÌNH DUYỆT
# ============================================================

Mở Trình Duyệt
    [Documentation]    Mở Chrome với ChromeOptions đầy đủ, set timeout mặc định
    ${options}=    Evaluate
    ...    __import__('selenium.webdriver', fromlist=['ChromeOptions']).ChromeOptions()
    Call Method    ${options}    add_argument    --disable-notifications
    Call Method    ${options}    add_argument    --disable-popup-blocking
    Call Method    ${options}    add_argument    --disable-infobars
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --disable-dev-shm-usage
    Call Method    ${options}    add_experimental_option    excludeSwitches    ${{ ["enable-automation"] }}
    Call Method    ${options}    add_experimental_option    useAutomationExtension    ${False}
    # Bỏ comment dòng dưới để chạy headless (CI/CD):
    # Call Method    ${options}    add_argument    --headless=new
    Open Browser    ${LOGIN_URL}    ${BROWSER}    options=${options}
    Maximize Browser Window
    Set Selenium Implicit Wait    2s
    Set Selenium Timeout    10s

Đóng Trình Duyệt
    Close All Browsers

# ============================================================
# ĐĂNG NHẬP THEO VAI TRÒ – dùng chung ở nhiều test suite
# ============================================================

Đăng Nhập Admin
    [Documentation]    Đăng nhập bằng tài khoản Admin
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${ADMIN_EMAIL}
    Input Password   id:password    ${ADMIN_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập NV Kho
    [Documentation]    Đăng nhập bằng tài khoản Nhân viên Kho
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${NV_KHO_EMAIL}
    Input Password   id:password    ${NV_KHO_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập QL Kho
    [Documentation]    Đăng nhập bằng tài khoản Quản lý Kho
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${QL_KHO_EMAIL}
    Input Password   id:password    ${QL_KHO_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Nhập Truong Khoa
    [Documentation]    Đăng nhập bằng tài khoản Trưởng Khoa
    Go To    ${LOGIN_URL}
    Wait Until Element Is Visible    id:email
    Input Text       id:email       ${TRUONG_KHOA_EMAIL}
    Input Password   id:password    ${TRUONG_KHOA_PASSWORD}
    Click Button    xpath://button[@type='submit']
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Tổng quan']]    timeout=10s

Đăng Xuất
    [Documentation]    Nhấn nút Đăng xuất, chờ về trang login
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='Đăng xuất'] or (not(span) and .//svg)]
    ...    timeout=5s
    Click Element    xpath://button[.//span[text()='Đăng xuất']]
    Wait Until Keyword Succeeds    15s    0.5s    Location Should Contain    /login
    Wait Until Element Is Visible    id:email    timeout=15s

# ============================================================
# ĐIỀU HƯỚNG SIDEBAR
# ============================================================

Vào Trang Qua Sidebar
    [Arguments]    ${ten_menu}
    Click Element    xpath://button[.//span[text()='${ten_menu}']]
    Wait Until Element Is Visible
    ...    xpath://button[.//span[text()='${ten_menu}']][contains(@class,'active') or contains(@class,'bg-')]
    ...    timeout=5s

# ============================================================
# HELPERS
# ============================================================

Chờ Toast Thành Công
    Wait Until Element Is Visible
    ...    xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Thành công')]
    ...    timeout=10s

Chờ Toast Lỗi
    Wait Until Element Is Visible
    ...    xpath://div[@role='status' or contains(@class,'toast')][contains(.,'Lỗi')]
    ...    timeout=5s

Chụp Ảnh Khi Lỗi
    Capture Page Screenshot

Cuộn Xuống Cuối
    Execute Javascript    window.scrollTo(0, document.body.scrollHeight)

Element Hiển Thị
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s

Element Ẩn
    [Arguments]    ${locator}
    Wait Until Element Is Not Visible    ${locator}    timeout=10s

# ============================================================
# JAVASCRIPT UTILITIES
# ============================================================

Click Bằng Javascript
    [Documentation]    Dùng JS click khi Selenium bị chặn do overlay/animation
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].click();    ARGUMENTS    ${element}

Xóa Và Nhập Text Bằng Javascript
    [Documentation]    Dùng JS xóa value rồi dùng Selenium nhập lại — an toàn với React controlled input
    [Arguments]    ${locator}    ${value}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].value = '';    ARGUMENTS    ${element}
    Execute Javascript
    ...    arguments[0].dispatchEvent(new Event('input', {bubbles: true}));
    ...    ARGUMENTS    ${element}
    Input Text    ${locator}    ${value}

Cuộn Đến Element
    [Documentation]    Scroll element vào vùng nhìn thấy trước khi tương tác
    [Arguments]    ${locator}
    ${element}=    Get WebElement    ${locator}
    Execute Javascript    arguments[0].scrollIntoView({block: 'center'});    ARGUMENTS    ${element}
    Wait Until Element Is Visible    ${locator}    timeout=5s

Chờ Trang Tải Xong
    [Documentation]    Chờ document.readyState = complete (sau navigate)
    Wait Until Keyword Succeeds    10s    0.5s
    ...    Execute Javascript    return document.readyState === 'complete'

Chờ Không Còn Loading
    [Documentation]    Chờ spinner/overlay ẩn đi — tránh click nhầm lúc trang đang load
    [Arguments]    ${spinner_locator}=xpath://*[contains(@class,'loading') or contains(@class,'spinner')]
    Run Keyword And Ignore Error
    ...    Wait Until Element Is Not Visible    ${spinner_locator}    timeout=5s
