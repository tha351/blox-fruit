-- 1. Tải thư viện UI Fluent (Cái này giúp vẽ giao diện tự động)
local Fluent = loadstring(game:HttpGet("https://github.com"))()

-- 2. Khởi tạo Cửa sổ Menu chính (Window)
local Window = Fluent:CreateWindow({
    Title = "Genmini Hub =))",          -- Tên lớn của Menu
    SubTitle = "Bản Tự Chế",            -- Dòng chữ nhỏ bên dưới tên
    TabWidth = 160,                     -- Chiều rộng của thanh danh mục
    Size = UDim2.fromOffset(580, 460),  -- Kích thước của Menu (Dài x Rộng)
    Acrylic = true,                     -- Hiệu ứng làm mờ xuyên thấu (Đẹp)
    Theme = "Dark",                    -- Giao diện tối (Có thể đổi thành Light, Rose, Aqua...)
    MinimizeKey = Enum.KeyCode.LeftControl -- Phím ẩn/hiện menu trên PC (Phím Ctrl trái)
})

-- 3. Tạo các Tab (Danh mục menu bên trái)
local Tabs = {
    Main = Window:AddTab({ Title = "Chức Năng Chính", Icon = "sword" }), -- Tab cày cuốc
    Misc = Window:AddTab({ Title = "Khác", Icon = "settings" })         -- Tab cài đặt phụ
}

-- 4. Thêm các nút bấm và công tắc vào trong Tab

---- [TAB 1: CHỨC NĂNG CHÍNH] ----

-- A. Nút gạt Bật/Tắt (Toggle) - Thường dùng cho Auto Farm, Auto Rain
Tabs.Main:AddToggle("MyToggle", {
    Title = "Tự Động Đánh Quái (Auto Farm)",
    Default = false, -- Mặc định là tắt
    Callback = function(Value)
        -- Viết code chức năng của bạn ở đây. 
        -- Value sẽ trả về true (nếu bật) hoặc false (nếu tắt)
        print("Trạng thái Auto Farm là: ", Value)
    end
})

-- B. Nút bấm một lần (Button) - Thường dùng để dịch chuyển, lấy một món đồ
Tabs.Main:AddButton({
    Title = "Dịch Chuyển Tới Đảo Khởi Đầu",
    Description = "Bấm vào để bay về đảo tân thủ",
    Callback = function()
        -- Viết code dịch chuyển ở đây
        print("Đang dịch chuyển...")
    end
})

---- [TAB 2: KHÁC] ----

-- C. Thanh trượt chọn mức độ (Slider) - Thường dùng chỉnh tốc độ chạy, khoảng cách gom quái
Tabs.Misc:AddSlider("MySlider", {
    Title = "Tốc độ chạy (WalkSpeed)",
    Description = "Kéo để nhân vật chạy nhanh hơn",
    Default = 16,
    Min = 16,
    Max = 150,
    Rounding = 0,
    Callback = function(Value)
        -- Viết code chỉnh tốc độ nhân vật ở đây
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

-- D. Ô lựa chọn danh sách (Dropdown) - Thường dùng chọn vũ khí, chọn đảo, chọn hệ Raid
Tabs.Misc:AddDropdown("MyDropdown", {
    Title = "Chọn Vũ Khí Muốn Dùng",
    Values = {"Cận Chiến (Melee)", "Kiếm (Sword)", "Trái Ác Quỷ (Fruit)"},
    Current = "Cận Chiến (Melee)", -- Lựa chọn mặc định
    Callback = function(Value)
        print("Bạn đã chọn vũ khí: ", Value)
    end
})

-- 5. Gửi thông báo nhỏ góc màn hình khi Menu bật thành công
Fluent:Notify({
    Title = "Genmini Hub",
    Content = "Menu của bạn đã khởi chạy thành công!",
    Duration = 5 -- Hiện trong 5 giây
})

-- Mặc định khi mở lên sẽ chọn sẵn Tab 1
Window:SelectTab(1)
