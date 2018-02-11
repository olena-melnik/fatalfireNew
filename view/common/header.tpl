<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title><?php echo $title;  ?></title>
  <base href="<?php echo $base; ?>" />
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>" />
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content= "<?php echo $keywords; ?>" />
  <?php } ?>
  <meta property="og:title" content="<?php echo $title; ?>" />
  <meta property="og:type" content="website" />
  <meta property="og:url" content="<?php echo $og_url; ?>" />
  <?php if ($og_image) { ?>
  <meta property="og:image" content="<?php echo $og_image; ?>" />
  <?php } else { ?>
  <meta property="og:image" content="<?php echo $logo; ?>" />
  <?php } ?>
  <meta property="og:site_name" content="<?php echo $name; ?>" />
  <script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
  <script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="//fonts.googleapis.com/css?family=Open+Sans:400,400i,300,700" rel="stylesheet" type="text/css" />
  <link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
  <?php foreach ($styles as $style) { ?>
  <link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
  <?php } ?>
  <script src="catalog/view/javascript/common.js" type="text/javascript"></script>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
  <?php } ?>
  <?php foreach ($scripts as $script) { ?>
  <script src="<?php echo $script; ?>" type="text/javascript"></script>
  <?php } ?>
  <?php foreach ($analytics as $analytic) { ?>
  <?php echo $analytic; ?>
  <?php } ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
    <?php echo $currency; ?>
    <?php echo $language; ?>
    <div id="top-links" class="nav pull-right">
      <ul class="list-inline">
        <li><a href="<?php echo $contact; ?>"><i class="fa fa-phone"></i></a> <span class="hidden-xs hidden-sm hidden-md"><?php echo $telephone; ?></span></li>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $shopping_cart; ?>" title="<?php echo $text_shopping_cart; ?>"><i class="fa fa-shopping-cart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_shopping_cart; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>
        <li id="myId"><a href="#callback" title=""><i class="fa fa-phone"></i><span class="hidden-xs hidden-sm hidden-md">Заказать звонок</span></a></li>
      </ul>
    </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <?php if ($home == $og_url) { ?>
          <img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" />
          <?php } else { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } ?>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-5"><?php echo $search; ?>
      </div>
      <div class="col-sm-3"><?php echo $cart; ?></div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="container">
  <nav id="menu" class="navbar">
    <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
      <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
    </div>
    <div class="collapse navbar-collapse navbar-ex1-collapse">
      <ul class="nav navbar-nav">
        <?php foreach ($categories as $category) { ?>
        <?php if ($category['children']) { ?>
        <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle" data-toggle="dropdown"><?php echo $category['name']; ?></a>
          <div class="dropdown-menu">
            <div class="dropdown-inner">
              <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
              <ul class="list-unstyled">
                <?php foreach ($children as $child) { ?>
                <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>
                <?php } ?>
              </ul>
              <?php } ?>
            </div>
            <a href="<?php echo $category['href']; ?>" class="see-all"><?php echo $text_all; ?> <?php echo $category['name']; ?></a> </div>
        </li>
        <?php } else { ?>
        <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
        <?php } ?>
        <?php } ?>
      </ul>
    </div>
  </nav>
</div>
<?php } ?>

<div id="callback" class="modal">
  <form method="post" class="ajax-form" action="index.php?route=information/contact/sendMail">
    <h3 class="title modal-title"><?php echo $modal_request_call; ?></h3>
    <div class="form-group">
      <input type="text" name="callbackname" id="callbackname" class="input input_modal" placeholder="<?php echo $modal_name_placeholder; ?>" required>
      <input type="text" name="callbacktel" id="callbacktel" class="input input_modal" placeholder="<?php echo $modal_tel_placeholder; ?>*" required pattern="^((\+3)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$" title="Формат ХХХ ХХ ХХ ХХХ">
    </div>
    <p class="modal-text_small"><?php echo $modal_text_small; ?></p>
    <input type="submit" name="callbackbtn" id = "callbackbtn" class="btn btn_act btn_submit" value="<?php echo $modal_btn_send; ?>">
  </form>
</div>

<!----- START форма отправки заказаза, добавила вариант доставки "Другой вариант"---------------------->
<!-- order  -->
<div id="order" class="">
  <h3 class="title modal-title">Оформление заказа</h3>
  <div class="form-order-wrap">
    <form id="order-info" action="" method="post" class="ajax-form">

      <!-- name and phone -->
      <div class="order-step">
        <span class="order-step-title">1. Ваши данные</span>
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Ваше ФИО*</div>
            </div>
            <div class="col-sm-10">
              <div class="row min">
                <div class="col-sm-4">
                  <input type="text" name="surmane" class="input input_order" placeholder="Фамилия" required>
                </div>
                <div class="col-sm-4">
                  <input type="text" name="name" class="input input_order" placeholder="Имя" required>
                </div>
                <div class="col-sm-4">
                  <input type="text" name="fathername" class="input input_order" placeholder="Отчество" required>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Телефон*</div>
            </div>
            <div class="col-sm-10">
              <input type="text" name="phone" class="input input_order" placeholder="" required>
            </div>
          </div>
        </div>
      </div>

      <!-- delivery -->
      <div class="order-step">
        <span class="order-step-title">2. Доставка</span>
        <p class="modal-text">Бесплатная доставка Новой Почтой в течении 1-3 дней</p>
        <div class="order-list-type">
          <div class="row min">
            <div class="col-sm-2"></div>
            <div class="col-sm10">
              <ul class="check-radio">
                <li>
                  <input type="radio" id="himself" value="himself" name="delivery" class="input_radio" checked>
                  <label for="himself" class="input_label">Самовывоз</label>
                </li>
                <li>
                  <input type="radio" id="np-warehouse" value="np-warehouse" name="delivery" class="input_radio">
                  <label for="np-warehouse" class="input_label">Новая Почта - Склад</label>
                </li>
                <li>
                  <input type="radio" id="np-corier" value="np-corier" name="delivery" class="input_radio">
                  <label for="np-corier" class="input_label">Новая Почта - Курьер</label>
                </li>
                <!-- START -->
                <li>
                  <input type="radio" id="another-warehouse" value="another-warehouse" name="delivery" class="input_radio">
                  <label for="another-warehouse" class="input_label">Другой вариант</label>
                </li>
                <!-- END-->
              </ul>
            </div>
          </div>
        </div>

        <!-- nova poshta - warehouse -->
        <div id="warehouse-info" class="order-delivery-details">
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">Область</div>
              </div>
              <div class="col-sm-10">
                <input type="text" name="region" class="input input_order" placeholder="" required>
              </div>
            </div>
          </div>
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">Город</div>
              </div>
              <div class="col-sm-10">
                <input type="text" name="city" class="input input_order" placeholder="" required>
              </div>
            </div>
          </div>
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">№ склада*</div>
              </div>
              <div class="col-sm-10">
                <div class="row min">
                  <div class="col-sm-6">
                    <input type="text" name="warehouse" class="input input_order" placeholder="" required>
                    <span class="modal-text_small">* - укажите грузовое отделение</span>
                  </div>
                  <div class="col-sm-6">
                    <a href="#" class="link order-warehouse-map">Карта складов</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- START параметры другого варианта-->
        <!-- another-warehouse -->
        <div id="other-warehouse-info" class="order-delivery-details">
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">Город</div>
              </div>
              <div class="col-sm-10">
                <input type="text" name="city" class="input input_order" placeholder="" required>
              </div>
            </div>
          </div>
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">№ склада*</div>
              </div>
              <div class="col-sm-10">
                <input type="text" name="warehouse" class="input input_order" placeholder="" required>
                <span class="modal-text_small">* - укажите грузовое отделение</span>
              </div>
            </div>
          </div>
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">Улица</div>
              </div>
              <div class="col-sm-10">
                <input type="text" name="street" class="input input_order" placeholder="" required>
              </div>
            </div>
          </div>
          <div class="order-step-row">
            <div class="row min">
              <div class="col-sm-2">
                <div class="order-step-label">Дом</div>
              </div>
              <div class="col-sm-4">
                <input type="text" name="house" class="input input_order" placeholder="" required>
              </div>
              <div class="col-sm-2">
                <div class="order-step-label">Квартира</div>
              </div>
              <div class="col-sm-4">
                <input type="text" name="room" class="input input_order" placeholder="">
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- END параметры другого варианта-->

      <!-- nova poshta - corier -->
      <div id="warehouse-corier" class="order-delivery-details">
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Город</div>
            </div>
            <div class="col-sm-10">
              <input type="text" name="city" class="input input_order" placeholder="" required>
            </div>
          </div>
        </div>
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Улица</div>
            </div>
            <div class="col-sm-10">
              <input type="text" name="street" class="input input_order" placeholder="" required>
            </div>
          </div>
        </div>
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Дом</div>
            </div>
            <div class="col-sm-4">
              <input type="text" name="house" class="input input_order" placeholder="" required>
            </div>
            <div class="col-sm-2">
              <div class="order-step-label">Квартира</div>
            </div>
            <div class="col-sm-4">
              <input type="text" name="room" class="input input_order" placeholder="" required>
            </div>
          </div>
        </div>
        <div class="order-step-row">
          <div class="row min">
            <div class="col-sm-2">
              <div class="order-step-label">Подъезд</div>
            </div>
            <div class="col-sm-4">
              <input type="text" name="entrance" class="input input_order" placeholder="" required>
            </div>
            <div class="col-sm-2">
              <div class="order-step-label">Этаж</div>
            </div>
            <div class="col-sm-4">
              <input type="text" name="floor" class="input input_order" placeholder="" required>
            </div>
          </div>
        </div>
      </div>
      <!-- payment -->
      <div class="order-step">
        <span class="order-step-title">3. Метод оплаты</span>
        <div class="order-list-type">
          <div class="row min">
            <div class="col-sm-2"></div>
            <div class="col-sm-10">
              <ul class="check-radio">
                <li>
                  <input type="radio" id="paybefore" value="paybefore" name="payment" class="input_radio" checked>
                  <label for="paybefore" class="input_label">Полная предоплата</label>
                </li>
                <li>
                  <input type="radio" id="cod" value="cod" name="payment" class="input_radio">
                  <label for="cod" class="input_label">Наложеный платеж<span class="input_label-info">( 2% от суммы товара )</span></label>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>

      <!-- add comment -->
      <div class="order-step">
        <div class="order-comment">
          <a href="javascript:void(0);" class="link order-comment-link">Добавить комментарий к заказу</a>
          <textarea id="ordermssg" placeholder="Сообщение" name="comment" class="input input_area"></textarea>
        </div>
      </div>

      <!-- order button -->
      <div class="order-btn">
        <!--BUTTON ORDER -->
        <a href="#ordersuccess" class="btn btn_act popup-btn btn-add-order" >Оформить заказ</a>
        <input type="submit" value="Оформить">
      </div>

    </form>
  </div>
</div>


<!------- END--------->
<!------- START форма отправки запроса без перезагрузки страницы--------->
</body>
</html>

<script>
    $('.ajax-form').on('submit',function(){
        var msg = $(this).serialize();
        var d;
        $.ajax({
            type: 'POST',
            url: 'index.php?route=checkout/cart/sendMail',
            data: msg,
            success: function(data){
                alert(data);
            },
            error: function(xhr){
                alert('An error occurred.' + xhr.response);
            }
        });
    });

</script>
<!------- END--------->

