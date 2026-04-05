var dist = room_width-o_player.x
var mulit = 12

// --- Layer 1 ---
var amt_d_1 = 1*mulit
var displace_1 = (dist/room_width)*amt_d_1-(amt_d_1/2)
var lay_id_1 = layer_get_id("trees_bk_sm_1")
layer_x(lay_id_1, displace_1)

// --- Layer 2 ---
var amt_d_2 = 2*mulit
var displace_2 = (dist/room_width)*amt_d_2-(amt_d_2/2)
var lay_id_2 = layer_get_id("trees_bk_sm_2")
layer_x(lay_id_2, displace_2)

// --- Layer 3 ---
var amt_d_3 = 3*mulit
var displace_3 = (dist/room_width)*amt_d_3-(amt_d_3/2)
var lay_id_3 = layer_get_id("bushes_1")
layer_x(lay_id_3, displace_3)

// --- Layer 4 ---
var amt_d_4 = 4*mulit
var displace_4 = (dist/room_width)*amt_d_4-(amt_d_4/2)
var lay_id_4 = layer_get_id("bushes_2")
layer_x(lay_id_4, displace_4)

// --- Layer 5 ---
var amt_d_5 = 5*mulit
var displace_5 = (dist/room_width)*amt_d_5-(amt_d_5/2)
var lay_id_5 = layer_get_id("bushes_3")
layer_x(lay_id_5, displace_5)

// --- Layer 6 ---
var amt_d_6 = 6*mulit
var displace_6 = (dist/room_width)*amt_d_5-(amt_d_6/2)
var lay_id_6 = layer_get_id("bushes_4_bk")
layer_x(lay_id_6, displace_6)



