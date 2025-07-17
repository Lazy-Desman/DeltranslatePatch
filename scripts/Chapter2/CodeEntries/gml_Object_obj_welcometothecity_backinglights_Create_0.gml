timer = random(900)
c_rainbow = make_color_hsv(((room_speed / 50) % 255), 255, 255)
createAndStay = (global.plot >= 67 ? 0 : 1)
count = 0
newcount = 0
welcome_sign_x1 = get_chapter_lang_setting("welcome_sign_x1", [15, 53, 73, 95, 119, 147, 185, 218, 246, 287, 315, 342, 375, 399, 411, 439])
welcome_sign_x2 = get_chapter_lang_setting("welcome_sign_x2", [49, 69, 91, 115, 143, 181, 201, 242, 270, 311, 338, 358, 395, 407, 435, 461])

start_x = 565
