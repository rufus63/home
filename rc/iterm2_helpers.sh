# Usage:
#   Source this script from your Bash start-up script (eg. ~/.bashrc, ~/.bash_profile).
#
# Setting titles:
#   set_iterm_title something
#   set_iterm_title "more than 1 word"
#
# Setting tab colors:
#   tab_color "$2" 195  89  76
#   tab_color "$2" 219 154  88
#   tab_color "$2" 145 185 104
#   tab_color "$2"  92 155 204
#
# Setting pre-defined tab colors with titles:
#   tab_red "Rails Server"
#   tab_orange "Rails Console"
#   tab_blue "SQL Dev"
#   tab_green "Tests"

title_help0()
{
echo "ERROR: No argument provided."
echo "Usage:"
echo "  `basename $0` \"title\" to provide a new Terminal title."
}

title_help2()
{
echo "ERROR: Too many arguments provided."
echo "Usage:"
echo "  `basename $0` \"title\" to provide a new Terminal title."
}

function set_iterm_title() {
if [ $# -eq 0 ]
then
  title_help0;
elif [ $# -eq 1 ]
then
  echo -ne "\033]0;$1\007"
elif [ $# -gt 1 ]
then
  title_help2;
fi
}
alias title='set_iterm_title'

function titlepwd() {
  set_iterm_title `pwd`
}

function tab_maroon { set_iterm_title "$1"; tab_color "$2" 128 0 0; }
function tab_dark_red { set_iterm_title "$1"; tab_color "$2" 139 0 0; }
function tab_brown { set_iterm_title "$1"; tab_color "$2" 165 42 42; }
function tab_firebrick { set_iterm_title "$1"; tab_color "$2" 178 34 34; }
function tab_crimson { set_iterm_title "$1"; tab_color "$2" 220 20 60; }
function tab_tomato { set_iterm_title "$1"; tab_color "$2" 255 99 71; }
function tab_coral { set_iterm_title "$1"; tab_color "$2" 255 127 80; }
function tab_indian_red { set_iterm_title "$1"; tab_color "$2" 205 92 92; }
function tab_light_coral { set_iterm_title "$1"; tab_color "$2" 240 128 128; }
function tab_dark_salmon { set_iterm_title "$1"; tab_color "$2" 233 150 122; }
function tab_salmon { set_iterm_title "$1"; tab_color "$2" 250 128 114; }
function tab_light_salmon { set_iterm_title "$1"; tab_color "$2" 255 160 122; }
function tab_orange_red { set_iterm_title "$1"; tab_color "$2" 255 69 0; }
function tab_dark_orange { set_iterm_title "$1"; tab_color "$2" 255 140 0; }
function tab_gold { set_iterm_title "$1"; tab_color "$2" 255 215 0; }
function tab_dark_golden_rod { set_iterm_title "$1"; tab_color "$2" 184 134 11; }
function tab_golden_rod { set_iterm_title "$1"; tab_color "$2" 218 165 32; }
function tab_pale_golden_rod { set_iterm_title "$1"; tab_color "$2" 238 232 170; }
function tab_dark_khaki { set_iterm_title "$1"; tab_color "$2" 189 183 107; }
function tab_khaki { set_iterm_title "$1"; tab_color "$2" 240 230 140; }
function tab_olive { set_iterm_title "$1"; tab_color "$2" 128 128 0; }
function tab_yellow_green { set_iterm_title "$1"; tab_color "$2" 154 205 50; }
function tab_dark_olive_green { set_iterm_title "$1"; tab_color "$2" 85  107 47; }
function tab_olive_drab { set_iterm_title "$1"; tab_color "$2" 107 142 35; }
function tab_lawn_green { set_iterm_title "$1"; tab_color "$2" 124 252 0; }
function tab_chart_reuse { set_iterm_title "$1"; tab_color "$2" 127 255 0; }
function tab_green_yellow { set_iterm_title "$1"; tab_color "$2" 173 255 47; }
function tab_dark_green { set_iterm_title "$1"; tab_color "$2" 0 100 0; }
function tab_forest_green { set_iterm_title "$1"; tab_color "$2" 34  139 34; }
function tab_lime { set_iterm_title "$1"; tab_color "$2" 0 255 0; }
function tab_lime_green { set_iterm_title "$1"; tab_color "$2" 50  205 50; }
function tab_light_green { set_iterm_title "$1"; tab_color "$2" 144 238 144; }
function tab_pale_green { set_iterm_title "$1"; tab_color "$2" 152 251 152; }
function tab_dark_sea_green { set_iterm_title "$1"; tab_color "$2" 143 188 143; }
function tab_medium_spring_green { set_iterm_title "$1"; tab_color "$2" 0 250 154; }
function tab_spring_green { set_iterm_title "$1"; tab_color "$2" 0 255 127; }
function tab_sea_green { set_iterm_title "$1"; tab_color "$2" 46  139 87; }
function tab_medium_aqua_marine { set_iterm_title "$1"; tab_color "$2" 102 205 170; }
function tab_medium_sea_green { set_iterm_title "$1"; tab_color "$2" 60  179 113; }
function tab_light_sea_green { set_iterm_title "$1"; tab_color "$2" 32  178 170; }
function tab_dark_slate_gray { set_iterm_title "$1"; tab_color "$2" 47  79 79; }
function tab_teal { set_iterm_title "$1"; tab_color "$2" 0 128 128; }
function tab_dark_cyan { set_iterm_title "$1"; tab_color "$2" 0 139 139; }
function tab_aqua { set_iterm_title "$1"; tab_color "$2" 0 255 255; }
function tab_cyan { set_iterm_title "$1"; tab_color "$2" 0 255 255; }
function tab_light_cyan { set_iterm_title "$1"; tab_color "$2" 224 255 255; }
function tab_dark_turquoise { set_iterm_title "$1"; tab_color "$2" 0 206 209; }
function tab_turquoise { set_iterm_title "$1"; tab_color "$2" 64  224 208; }
function tab_medium_turquoise { set_iterm_title "$1"; tab_color "$2" 72  209 204; }
function tab_pale_turquoise { set_iterm_title "$1"; tab_color "$2" 175 238 238; }
function tab_aqua_marine { set_iterm_title "$1"; tab_color "$2" 127 255 212; }
function tab_powder_blue { set_iterm_title "$1"; tab_color "$2" 176 224 230; }
function tab_cadet_blue { set_iterm_title "$1"; tab_color "$2" 95  158 160; }
function tab_steel_blue { set_iterm_title "$1"; tab_color "$2" 70  130 180; }
function tab_corn_flower_blue { set_iterm_title "$1"; tab_color "$2" 100 149 237; }
function tab_deep_sky_blue { set_iterm_title "$1"; tab_color "$2" 0 191 255; }
function tab_dodger_blue { set_iterm_title "$1"; tab_color "$2" 30  144 255; }
function tab_light_blue { set_iterm_title "$1"; tab_color "$2" 173 216 230; }
function tab_sky_blue { set_iterm_title "$1"; tab_color "$2" 135 206 235; }
function tab_light_sky_blue { set_iterm_title "$1"; tab_color "$2" 135 206 250; }
function tab_midnight_blue { set_iterm_title "$1"; tab_color "$2" 25  25_ 112; }
function tab_navy { set_iterm_title "$1"; tab_color "$2" 0 0 128; }
function tab_dark_blue { set_iterm_title "$1"; tab_color "$2" 0 0 139; }
function tab_medium_blue { set_iterm_title "$1"; tab_color "$2" 0 0 205; }
function tab_royal_blue { set_iterm_title "$1"; tab_color "$2" 65  105 225; }
function tab_blue_violet { set_iterm_title "$1"; tab_color "$2" 138 43 226; }
function tab_indigo { set_iterm_title "$1"; tab_color "$2" 75  0 130; }
function tab_dark_slate_blue { set_iterm_title "$1"; tab_color "$2" 72  61 139; }
function tab_slate_blue { set_iterm_title "$1"; tab_color "$2" 106 90 205; }
function tab_medium_slate_blue { set_iterm_title "$1"; tab_color "$2" 123 104 238; }
function tab_medium_purple { set_iterm_title "$1"; tab_color "$2" 147 112 219; }
function tab_dark_magenta { set_iterm_title "$1"; tab_color "$2" 139 0 139; }
function tab_dark_violet { set_iterm_title "$1"; tab_color "$2" 148 0 211; }
function tab_dark_orchid { set_iterm_title "$1"; tab_color "$2" 153 50 204; }
function tab_medium_orchid { set_iterm_title "$1"; tab_color "$2" 186 85_ 211; }
function tab_purple { set_iterm_title "$1"; tab_color "$2" 128 0 128; }
function tab_thistle { set_iterm_title "$1"; tab_color "$2" 216 191 216; }
function tab_plum { set_iterm_title "$1"; tab_color "$2" 221 160 221; }
function tab_violet { set_iterm_title "$1"; tab_color "$2" 238 130 238; }
function tab_magenta_fuchsia { set_iterm_title "$1"; tab_color "$2" 255 0 255; }
function tab_orchid { set_iterm_title "$1"; tab_color "$2" 218 112 214; }
function tab_medium_violet_red { set_iterm_title "$1"; tab_color "$2" 199 21 133; }
function tab_pale_violet_red { set_iterm_title "$1"; tab_color "$2" 219 112 147; }
function tab_deep_pink { set_iterm_title "$1"; tab_color "$2" 255 20 147; }
function tab_hot_pink { set_iterm_title "$1"; tab_color "$2" 255 105 180; }
function tab_light_pink { set_iterm_title "$1"; tab_color "$2" 255 182 193; }
function tab_pink { set_iterm_title "$1"; tab_color "$2" 255 192 203; }
function tab_antique_white { set_iterm_title "$1"; tab_color "$2" 250 235 215; }
function tab_beige { set_iterm_title "$1"; tab_color "$2" 245 245 220; }
function tab_bisque { set_iterm_title "$1"; tab_color "$2" 255 228 196; }
function tab_blanched_almond { set_iterm_title "$1"; tab_color "$2" 255 235 205; }
function tab_wheat { set_iterm_title "$1"; tab_color "$2" 245 222 179; }
function tab_corn_silk { set_iterm_title "$1"; tab_color "$2" 255 248 220; }
function tab_lemon_chiffon { set_iterm_title "$1"; tab_color "$2" 255 250 205; }
function tab_light_golden_rod_yellow { set_iterm_title "$1"; tab_color "$2" 250 250 210; }
function tab_light_yellow { set_iterm_title "$1"; tab_color "$2" 255 255 224; }
function tab_saddle_brown { set_iterm_title "$1"; tab_color "$2" 139 69 19; }
function tab_sienna { set_iterm_title "$1"; tab_color "$2" 160 82 45; }
function tab_chocolate { set_iterm_title "$1"; tab_color "$2" 210 105 30; }
function tab_peru { set_iterm_title "$1"; tab_color "$2" 205 133 63; }
function tab_sandy_brown { set_iterm_title "$1"; tab_color "$2" 244 164 96; }
function tab_burly_wood { set_iterm_title "$1"; tab_color "$2" 222 184 135; }
function tab_tan { set_iterm_title "$1"; tab_color "$2" 210 180 140; }
function tab_rosy_brown { set_iterm_title "$1"; tab_color "$2" 188 143 143; }
function tab_moccasin { set_iterm_title "$1"; tab_color "$2" 255 228 181; }
function tab_navajo_white { set_iterm_title "$1"; tab_color "$2" 255 222 173; }
function tab_peach_puff { set_iterm_title "$1"; tab_color "$2" 255 218 185; }
function tab_misty_rose { set_iterm_title "$1"; tab_color "$2" 255 228 225; }
function tab_lavender_blush { set_iterm_title "$1"; tab_color "$2" 255 240 245; }
function tab_linen { set_iterm_title "$1"; tab_color "$2" 250 240 230; }
function tab_old_lace { set_iterm_title "$1"; tab_color "$2" 253 245 230; }
function tab_papaya_whip { set_iterm_title "$1"; tab_color "$2" 255 239 213; }
function tab_sea_shell { set_iterm_title "$1"; tab_color "$2" 255 245 238; }
function tab_mint_cream { set_iterm_title "$1"; tab_color "$2" 245 255 250; }
function tab_slate_gray { set_iterm_title "$1"; tab_color "$2" 112 128 144; }
function tab_light_slate_gray { set_iterm_title "$1"; tab_color "$2" 119 136 153; }
function tab_light_steel_blue { set_iterm_title "$1"; tab_color "$2" 176 196 222; }
function tab_lavender { set_iterm_title "$1"; tab_color "$2" 230 230 250; }
function tab_floral_white { set_iterm_title "$1"; tab_color "$2" 255 250 240; }
function tab_alice_blue { set_iterm_title "$1"; tab_color "$2" 240 248 255; }
function tab_ghost_white { set_iterm_title "$1"; tab_color "$2" 248 248 255; }
function tab_honeydew { set_iterm_title "$1"; tab_color "$2" 240 255 240; }
function tab_ivory { set_iterm_title "$1"; tab_color "$2" 255 255 240; }
function tab_azure { set_iterm_title "$1"; tab_color "$2" 240 255 255; }
function tab_snow { set_iterm_title "$1"; tab_color "$2" 255 250 250; }
function tab_black { set_iterm_title "$1"; tab_color "$2" 0 0 0; }
function tab_dim_gray_dim_grey { set_iterm_title "$1"; tab_color "$2" 105 105 105; }
function tab_gray_grey { set_iterm_title "$1"; tab_color "$2" 128 128 128; }
function tab_dark_gray_dark_grey { set_iterm_title "$1"; tab_color "$2" 169 169 169; }
function tab_silver { set_iterm_title "$1"; tab_color "$2" 192 192 192; }
function tab_light_gray_light_grey { set_iterm_title "$1"; tab_color "$2" 211 211 211 ; }
function tab_gainsboro { set_iterm_title "$1"; tab_color "$2" 220 220 220; }
function tab_white_smoke { set_iterm_title "$1"; tab_color "$2" 245 245 245; }
function tab_white { set_iterm_title "$1"; tab_color "$2" 255 255 255; }

# Pure colors to be overridden later
function tab_pure_red { set_iterm_title "$1"; tab_color "$2" 255 0 0; }
function tab_pure_orange { set_iterm_title "$1"; tab_color "$2" 255 165 0; }
function tab_pure_green { set_iterm_title "$1"; tab_color "$2" 0 128 0; }
function tab_pure_blue { set_iterm_title "$1"; tab_color "$2" 0 0 255; }
function tab_pure_yellow { set_iterm_title "$1"; tab_color "$2" 255 255 0; }

# Overridden colors
function tab_red()    { set_iterm_title "$1"; tab_color "$2" 195  89  76; }
function tab_orange() { set_iterm_title "$1"; tab_color "$2" 219 154  88; }
function tab_green()  { set_iterm_title "$1"; tab_color "$2"  65 174  76; }
function tab_blue()   { set_iterm_title "$1"; tab_color "$2"  92 155 204; }
function tab_yellow() { set_iterm_title "$1"; tab_color "$2" 240 240   0; }

function tab_dark_teal() { set_iterm_title "$1"; tab_color "$2"   0  30  38; }
function tab_faded_grey() { set_iterm_title "$1"; tab_color "$2" 112 128 131; } 

function tab_nasty_yellow_green { set_iterm_title "$1"; tab_color "$2" 75 101 25; }
function tab_faded_orange_red { set_iterm_title "$1"; tab_color "$2" 128 35 0; }

function tab_faded_maroon { set_iterm_title "$1"; tab_color "$2" 64 0 0; }

function get_hex() {
   printf "%02X" "$1"
}

function tab_color() {
  red=$(get_hex $2)
  green=$(get_hex $3)
  blue=$(get_hex $4)

  echo -n -e "\033]P${1}${red}${green}${blue}\033\\"
}
