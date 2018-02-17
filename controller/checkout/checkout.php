<?php
class ControllerCheckoutCheckout extends Controller {
	public function index() {
		// Validate cart has products and has stock.
		if ((!$this->cart->hasProducts() && empty($this->session->data['vouchers'])) || (!$this->cart->hasStock() && !$this->config->get('config_stock_checkout'))) {
			$this->response->redirect($this->url->link('checkout/cart'));
		}
		// Validate minimum quantity requirements.
		$products = $this->cart->getProducts();

		foreach ($products as $product) {
			$product_total = 0;

			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}

			if ($product['minimum'] > $product_total) {
				$this->response->redirect($this->url->link('checkout/cart'));
			}
		}

		$this->load->language('checkout/checkout');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/moment.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/locale/'.$this->session->data['language'].'.js');
		$this->document->addScript('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.js');
		$this->document->addStyle('catalog/view/javascript/jquery/datetimepicker/bootstrap-datetimepicker.min.css');

		// Required by klarna
		if ($this->config->get('klarna_account') || $this->config->get('klarna_invoice')) {
			$this->document->addScript('http://cdn.klarna.com/public/kitt/toc/v1.0/js/klarna.terms.min.js');
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_cart'),
			'href' => $this->url->link('checkout/cart')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('checkout/checkout', '', true)
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_checkout_option'] = sprintf($this->language->get('text_checkout_option'), 1);
		$data['text_checkout_account'] = sprintf($this->language->get('text_checkout_account'), 2);
		$data['text_checkout_payment_address'] = sprintf($this->language->get('text_checkout_payment_address'), 2);
		$data['text_checkout_shipping_address'] = sprintf($this->language->get('text_checkout_shipping_address'), 3);
		$data['text_checkout_shipping_method'] = sprintf($this->language->get('text_checkout_shipping_method'), 4);
		
		if ($this->cart->hasShipping()) {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 5);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 6);
		} else {
			$data['text_checkout_payment_method'] = sprintf($this->language->get('text_checkout_payment_method'), 3);
			$data['text_checkout_confirm'] = sprintf($this->language->get('text_checkout_confirm'), 4);	
		}

		if (isset($this->session->data['error'])) {
			$data['error_warning'] = $this->session->data['error'];
			unset($this->session->data['error']);
		} else {
			$data['error_warning'] = '';
		}

		$data['logged'] = $this->customer->isLogged();

		if (isset($this->session->data['account'])) {
			$data['account'] = $this->session->data['account'];
		} else {
			$data['account'] = '';
		}
        /**
         * START Объявляем переменные для многоязычности
         */
		$data['shipping_required'] = $this->cart->hasShipping();

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

        $data['form_ordering'] = $this->language->get('form_ordering');

        $data['form_fio_data'] = $this->language->get('form_fio_data');
        $data['form_user_fio'] = $this->language->get('form_user_fio');
        $data['form_user_surname'] = $this->language->get('form_user_surname');
        $data['form_user_name'] = $this->language->get('form_user_name');
        $data['form_user_patronymic'] = $this->language->get('form_user_patronymic');
        $data['form_user_phone'] = $this->language->get('form_user_phone');

        $data['form_head_delivery'] = $this->language->get('form_head_delivery');
        $data['form_text_delivery'] = $this->language->get('form_text_delivery');
        $data['form_delivery_himself'] = $this->language->get('form_delivery_himself');
        $data['form_delivery_np_warehouse'] = $this->language->get('form_delivery_np_warehouse');
        $data['form_delivery_np_courier'] = $this->language->get('form_delivery_np_courier');
        $data['form_delivery_another_warehouse'] = $this->language->get('form_delivery_another_warehouse');
        $data['form_delivery_region'] = $this->language->get('form_delivery_region');
        $data['form_delivery_city'] = $this->language->get('form_delivery_city');
        $data['form_delivery_numb_warehouse'] = $this->language->get('form_delivery_numb_warehouse');
        $data['form_delivery_numb_warehouse_text'] = $this->language->get('form_delivery_numb_warehouse_text');
        $data['form_order_warehouse_map'] = $this->language->get('form_order_warehouse_map');
        $data['form_delivery_name'] = $this->language->get('form_delivery_name');
        $data['form_delivery_street'] = $this->language->get('form_delivery_street');
        $data['form_delivery_house'] = $this->language->get('form_delivery_house');
        $data['form_delivery_room'] = $this->language->get('form_delivery_room');
        $data['form_delivery_entrance'] = $this->language->get('form_delivery_entrance');
        $data['form_delivery_floor'] = $this->language->get('form_delivery_floor');
        $data['form_make_an_order'] = $this->language->get('form_make_an_order');

        $data['form_payment_method'] = $this->language->get('form_payment_method');
        $data['form_full_prepayment'] = $this->language->get('form_full_prepayment');
        $data['form_cash_on_delivery'] = $this->language->get('form_cash_on_delivery');
        $data['form_of_the_amount_of_goods'] = $this->language->get('form_of_the_amount_of_goods');
        $data['form_comment'] = $this->language->get('form_comment');
        /**
         * END переменніе для многоязычности
         */
		$this->response->setOutput($this->load->view('checkout/checkout', $data));
	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

	public function customfield() {
		$json = array();

		$this->load->model('account/custom_field');

		// Customer Group
		if (isset($this->request->get['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->get['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->get['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$custom_fields = $this->model_account_custom_field->getCustomFields($customer_group_id);

		foreach ($custom_fields as $custom_field) {
			$json[] = array(
				'custom_field_id' => $custom_field['custom_field_id'],
				'required'        => $custom_field['required']
			);
		}

		$this->response->addHeader('Content-Type: application/json');
		$this->response->setOutput(json_encode($json));
	}

    /**
     * START функция, которая формирует и отправляет письмо с заказом
     */
    public function sendMail(){
        $products = $this->cart->getProducts();
        $productInCart = '';
        /*foreach ($products as $product){
            $productInCart .= "<tr>";
            foreach ($product as $key=>$val){
                if(gettype($val) != 'array') {
                    $productInCart .= "<td>" . $key . "</td><td>" . $val . "</td>";
                } else {
                    foreach ($val as $keyOpt => $item){
                        if(gettype($item) != 'array') {
                            $productInCart .= "<td>" . $keyOpt . "</td><td>" . $item . "</td>";
                        } else {
                            foreach ($item as $keyOpt2 => $item2){
                                $productInCart .= "<td>" . $keyOpt2 . "</td><td>" . $item2 . "</td>";
                            }
                        }

                    }
                }
            }
            $productInCart .= "</tr>";
        }*/

        // echo $productInCart;

        foreach ($products as $product){
            $productInCart.= "<tr>";
            $productInCart.= "<td>".$product['product_id']."</td>";
            $productInCart.= "<td>".$product['name']."</td>";
            $productInCart.= "<td>".$product['model']."</td>";
            $productInCart.= "<td>".$product['price']."</td>";
            $productInCart.= "<td>".($product['price']*120/100)."</td>";
            $productInCart.= "<td>".$product['quantity']."</td>";
            foreach($product['option'] as $param){
                foreach($param as $val){
                    $productInCart.= "<td>".$val."</td>";
                }
            }
            $productInCart.= "</tr>";
        }

        /**
         * START обязательные параметры
         */
        if(isset($this->request->post['surmane']) && isset($this->request->post['name']) && isset($this->request->post['fathername']) ) {
            //ФИО заказчика
            $name = $this->request->post['surmane']." ".$this->request->post['name']." ".$this->request->post['fathername'];
        }
        //Номер телефона заказчика
        $phone = $this->request->post['phone'];

        //Способ доставки
        switch ($this->request->post['delivery']){
            case 'himself':
                $delivery = "Самовывоз";
                break;
            case 'np-warehouse':
                $delivery = "Новая почта - Склад";
                break;
            case 'np-corier':
                $delivery = "Новая почта - Курьер";
                break;
            default:
                $delivery = "Другой вариант";
                break;
        }

        //Способ оплаты
        switch ($this->request->post['payment']){
            case 'paybefore':
                $payment = "Полная предоплата";
                break;
            case 'cad':
                $payment = "Наложенный платеж (2% от суммы товара)";
                break;
        }

        /**
         * END обязательные параметры
         */
        $parametrsOrder = '';
        /**
         * Функция, проверяющая наличие параметра
         * @param $param
         * @param $text
         * @return string
         */
        function issetNotNull ($param, $text){
            if(isset($param) && $param != ''){
                return "$text: ".$param."<br>";
            }
            return '';
        }

        /**
         * Нова пошта склад
         */
        $parametrsOrder.= issetNotNull($this->request->post['region'], 'Регіон');
        $parametrsOrder.= issetNotNull($this->request->post['warehouse_np'], '№ склада');
        $parametrsOrder.= issetNotNull($this->request->post['city_np'], 'Місто');
        /**
         * Нова пошта курьер
         */
        $parametrsOrder.= issetNotNull($this->request->post['city'], 'Місто');
        $parametrsOrder.= issetNotNull($this->request->post['house'], 'Будинок');
        $parametrsOrder.= issetNotNull($this->request->post['street'], 'Вулиця');
        $parametrsOrder.= issetNotNull($this->request->post['entrance'], 'Під\'їзд');
        $parametrsOrder.= issetNotNull($this->request->post['floor'], 'Поверх');
        $parametrsOrder.= issetNotNull($this->request->post['room'], 'Квартира');
        /**
         * Другой вариант
         */
        $parametrsOrder.= issetNotNull($this->request->post['name-delivery'], 'Назва перевізника');
        $parametrsOrder.= issetNotNull($this->request->post['warehouse_ow'], '№ склада');
        $parametrsOrder.= issetNotNull($this->request->post['city_ow'], 'Місто');
        $parametrsOrder.= issetNotNull($this->request->post['street_ow'], 'Вулиця');
        $parametrsOrder.= issetNotNull($this->request->post['house_ow'], 'Будинок');
        $parametrsOrder.= issetNotNull($this->request->post['room_ow'], 'Квартира');
        /*if(isset($this->request->post['region']) && $this->request->post['region'] != ''){
            $region = $this->request->post['region'];
            $parametrsOrder.= "Регіон: ".$region."<br>";
        }

        if(isset($this->request->post['name-delivery']) && $this->request->post['name-delivery'] != ''){
            $nameDelivery = $this->request->post['name-delivery'];
            $parametrsOrder.= "Назва перевізника: ".$nameDelivery."<br>";
        }

        if(isset($this->request->post['warehouse_np']) && $this->request->post['warehouse_np'] != ''){
            $warehouse = $this->request->post['warehouse_np'];
            $parametrsOrder.= "№ склада: ".$warehouse."<br>";
        } elseif($this->request->post['warehouse_ow'] && $this->request->post['warehouse_ow'] != ''){
            $warehouse = $this->request->post['warehouse_ow'];
            $parametrsOrder.= "№ склада: ".$warehouse."<br>";
        }

        if(isset($this->request->post['city_ow']) && $this->request->post['city_ow'] != ''){
            $city = $this->request->post['city_ow'];
            $parametrsOrder.= "Місто: ".$city."<br>1";
        } elseif(isset($this->request->post['city_np']) && $this->request->post['city_np'] != ''){
            $city = $this->request->post['city_np'];
            $parametrsOrder.= "Місто: ".$city."<br>2";
        } elseif (isset($this->request->post['city']) && $this->request->post['city'] != '') {
            $city = $this->request->post['city'];
            $parametrsOrder.= "Місто: ".$city."<br>3";
        }

        if(isset($this->request->post['street'])&& $this->request->post['street'] != ''){
            $street = $this->request->post['street'];
            $parametrsOrder.= "Вулиця: ".$street."<br>";
        } elseif (isset($this->request->post['street_ow'])&& $this->request->post['street_ow'] != ''){
            $street = $this->request->post['street_ow'];
            $parametrsOrder.= "Вулиця: ".$street."<br>";
        }

        if(isset($this->request->post['house'])&& $this->request->post['house'] != ''){
            $house = $this->request->post['house'];
            $parametrsOrder.= "Будинок: ".$house."<br>";
        } elseif (isset($this->request->post['house_ow']) && $this->request->post['house_ow'] != ''){
            $house = $this->request->post['house_ow'];
            $parametrsOrder.= "Будинок: ".$house."<br>";
        }
        if(isset($this->request->post['entrance'])){
            $entrance = $this->request->post['entrance'];
            $parametrsOrder.= "Під'їзд: ".$entrance."<br>";
        }

        if(isset($this->request->post['floor'])){
            $floor = $this->request->post['floor'];
            $parametrsOrder.= "Поверх: ".$floor."<br>";
        }

        if(isset($this->request->post['room'])){
            $room = $this->request->post['room'];
            $parametrsOrder.= "Квартира: ".$room."<br>";
        } elseif($this->request->post['room_ow']){
            $room = $this->request->post['room_ow'];
            $parametrsOrder.= "Квартира: ".$room."<br>";
        }*/

        if(isset($this->request->post['comment']) && $this->request->post['comment'] != ''){
            $comment = $this->request->post['comment'];
        }

        $heardLetter = "Заказ товара";
        $letter =  "    
            <html>
            <head>
                <title>Заказ товара</title>
            </head>
            <body>
            <h3>Вам пришел новый заказ</h3>
                <p>
                    Заказчик: $name;<br>
                    Телефон: $phone;<br>
                    Доставка: $delivery;<br>
                    Метод оплати: $payment;<br>
                    Параметри відправки:<br>
                    $parametrsOrder
                    <table>
                    <tr>
                    <td>Код товару</td>
                    <td>Назва товару</td>
                    <td>Модель</td>
                    <td>Ціна без НДС, грн</td>
                    <td>Ціна з НДС, грн</td>
                    <td>Кількість</td>
                    <td>Параметри</td>
                    </tr>
                        $productInCart
                    </table>
                    Коментарій до заказу: $comment;
                    </p>
                    </body>
                    </html>";

        if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
            $mail = new Mail();
            $mail->protocol = $this->config->get('config_mail_protocol');
            $mail->parameter = $this->config->get('config_mail_parameter');
            $mail->smtp_hostname = $this->config->get('config_mail_smtp_hostname');
            $mail->smtp_username = $this->config->get('config_mail_smtp_username');
            $mail->smtp_password = html_entity_decode($this->config->get('config_mail_smtp_password'), ENT_QUOTES, 'UTF-8');
            $mail->smtp_port = $this->config->get('config_mail_smtp_port');
            $mail->smtp_timeout = $this->config->get('config_mail_smtp_timeout');

            $mail->setTo($this->config->get('config_email'));
            $mail->setFrom($this->config->get('config_email'));
            $mail->setReplyTo($phone);
            $mail->setSender(html_entity_decode($name, ENT_QUOTES, 'UTF-8'));
            $mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $heardLetter), ENT_QUOTES, 'UTF-8'));
            $mail->setText($letter);
            $mail->send();
            $this->response->redirect($this->url->link('information/contact/success'));
        } else {
            echo "Error";
        }
    }
    /**
     * END
     */
}
