<%@page import="com.fas.fahiru.vo.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    User user = new User();
	int no = user.getNo();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인의 팔로잉페이지 사라질예쩡</title>
<link rel="stylesheet" href="css/default.css" />
<link rel="stylesheet" href="css/reset.css" />
<link rel="stylesheet" href="css/followingPage.css" />
</head>
<body>

<div id="followingSection">
    <h2 class="screen_out">following 목록</h2>
    <ul id="followingList">
        <li class="following_list">

            <h3 class="following_profile">
                <img class="following_profile_img" src="img/defaultimg.png" />
                <strong class="following_profile_nickname"><a href="">Woody</a></strong>
            </h3>

            <div class="following_foodrendy_list">
                <h4 class="screen_out">follower의 foodrendy 목록</h4>
                <ul class="item_card_foodrendy_wrap">

                    <li class="item_card_foodrendy">
                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="foodrendy_score">97</div>
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">

                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>

                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>

                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>
                        </div>
                    </li>

                    <li class="item_card_foodrendy">
                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>
                        </div>
                    </li>
                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>

                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>

                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>
                    <li class="item_card_foodrendy">

                        <div class="card_foodrendy">
                            <div class="cooking_score">100</div>
                            <img class="img_card_foodrendy" src="img/rainbowCandy.PNG">
                            <div class="top back">
                                <div class="foodrendy_name">레인보우</div>
                                <div class="badge_taste"></div>
                                <div class="badge_plating"></div>
                            </div>
                            <div class="bottom back">
                                <div class="fas fa-shopping-basket buketlist_icon"></div>
                                <div class="buketlist_cnt">122</div>
                            </div>

                        </div>
                    </li>
                </ul>



            </div>
            <button class="fas fa-chevron-circle-left foodrendy_btn_left foodrendy_btn"></button>
            <button class="fas fa-chevron-circle-right foodrendy_btn_right foodrendy_btn"></button>

        </li>




    </ul>
</div><!--//followingSection-->
<script src="js/underscore-min.js"></script>
<script src="js/jquery.js"></script>
<script>

    let foodrendyMove=0;

    $(".foodrendy_btn_left").on("click",function () {
        if(foodrendyMove==0){
            $(".foodrendy_btn_left").css("disabled","disabled");
        }else{
            foodrendyMove +=270;
        }
        $(".item_card_foodrendy_wrap").css("left",foodrendyMove);
    });

    $(".foodrendy_btn_right").on("click",function () {
        if(foodrendyMove==-1080){
            foodrendyMove=0;
        }else{
            foodrendyMove -=270;
        }
        $(".item_card_foodrendy_wrap").css("left",foodrendyMove);
    });




</script>
</body>
</html>