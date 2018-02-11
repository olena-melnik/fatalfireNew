$(document).ready(function(){

	// Show Navbar on Scroll
	$(window).scroll(function(){
		if ($(window).scrollTop() >= 250) {
			$('#navbar').fadeIn(250);
		}
		else{
			$('#navbar').fadeOut();
		}
	});

	// Show/hide filter checkbox
	$('.filter-item-head').on('click', function(e){
		$(this).find('.filter-item-head-icon').toggleClass('icon-rotate');
		$(this).next().slideToggle(250);
	});

	// Show/hide delivery info
	$('.order-delivery-details').hide();
	var $himself = $('#himself');
	var $warehouse = $('#np-warehouse');
	var $corier = $('#np-corier');

	//START
	var $other = $('#another-warehouse');
	//END


	$himself.click(function(){
		$('.order-delivery-details').hide();
	});
	$warehouse.click(function(){
        $('#other-warehouse-info').hide();
		$('#warehouse-corier').hide();
		$('#warehouse-info').show();
	});
	$corier.click(function(){
        $('#other-warehouse-info').hide();
		$('#warehouse-info').hide();
		$('#warehouse-corier').show();
	});

    //START
	$other.click(function(){
        $('#warehouse-info').hide();
        $('#warehouse-corier').hide();
        $('#other-warehouse-info').show();
	})
    //END


	// Show/hide textarea in order popup
	$('.order-comment-link').click(function(event){
		event.preventDefault();
		$('#ordermssg').show();
	});

	// Price range-slider
	$( "#slider-range" ).slider({
		step: 10,
		range: true,
		min: 0,
		max: 50000,
		values: [ 4930, 36970 ],
		slide: function( event, ui ) {
			$( "#amount-from" ).val( ui.values[ 0 ] );
			$( "#amount-to" ).val( ui.values[ 1 ] );
		}
	});

	$( "#amount-from" ).val( $( "#slider-range" ).slider( "values", 0 ) );
	$( "#amount-to" ).val( $( "#slider-range" ).slider( "values", 1 ) );

	// Изменение местоположения ползунка при вводиде данных в первый элемент input
	$("input#amount-from").change(function(){
		var value1=$("input#amount-from").val();
		var value2=$("input#amount-to").val();
	    if(parseInt(value1) > parseInt(value2)){
			value1 = value2;
			$("input#amount-from").val(value1);
		}
		$("#slider-range").slider("values",0,value1);	
	});
	      
  // Изменение местоположения ползунка при вводиде данных в второй элемент input 	
  $("input#amount-to").change(function(){
  	var value1=$("input#amount-from").val();
  	var value2=$("input#amount-to").val();

  	if(parseInt(value1) > parseInt(value2)){
  		value2 = value1;
  		$("input#amount-to").val(value2);
  	}
  	$("#slider-range").slider("values",1,value2);
  });

  // фильтрация ввода в поля
	jQuery('#amount-from, #amount-to').keypress(function(event){
		var key, keyChar;
		if(!event) var event = window.event;
		
		if (event.keyCode) key = event.keyCode;
		else if(event.which) key = event.which;
	
		if(key==null || key==0 || key==8 || key==13 || key==9 || key==46 || key==37 || key==39 ) return true;
		keyChar=String.fromCharCode(key);
		
		if(!/\d/.test(keyChar))	return false;
	
	});

	// product item list/grid
	var product = $(".product-list");
	$("#product-grid").on("click", function(){
		$(".btn-catalog").removeClass("is-active");
		$(this).addClass("is-active");
	  if(product.hasClass("list")){
	    product.removeClass("list").addClass("grid");
	    product.find(".col-lg-12").removeClass("col-lg-12").removeClass("col-md-12").addClass("col-lg-4").addClass("col-md-6");
	    product.find(".product-raiting-wrap").hide();
	  }
	});
	$("#product-list").on("click", function(){
		$(".btn-catalog").removeClass("is-active");
		$(this).addClass("is-active");
	  if(product.hasClass("grid")){
	    product.removeClass("grid").addClass("list");
	    product.find(".col-lg-4").removeClass("col-lg-4").removeClass("col-md-6").addClass("col-lg-12").addClass("col-md-12");
	    product.find(".product-raiting-wrap").show();
	  }
	});

	// Scroll2top
	$("body").append('<span class="scroll2top">').children('.scroll2top').hide();
	$(window).scroll(function(){
		if ($(window).scrollTop() >= 250) {
			$(".scroll2top").fadeIn();
		} 
		else{
			$(".scroll2top").fadeOut();
		}
	});

	$(".scroll2top").click(function() {
		$("html, body").animate({
			scrollTop: 0
		}, 350);
	});

	 // Tabs Item card
  $('.tabs-nav a').on('click', function (e) {
      e.preventDefault();
      var toGo = $(this).attr('href');                  // посилання на блок
      var parent = $(this).closest('tabs-nav a');       // найближчий схожий родич
      if (!parent.hasClass('is-active')) {              // перевірка на умову
          $('.tabs-nav li a').removeClass('is-active'); // видаляю клас в кнопки
          $('.tabs-content').removeClass('is-active');  // видаляю клас в блоці
          $(toGo).addClass('is-active');                // даю клас посиланню (блок на який посилає кнопка)
          $(this).addClass('is-active');                // даю клас кнопці на яку клацнув
      } else {
      }
  });

  // Photo gallery Item card
  $('.popup-gallery').magnificPopup({
		delegate: 'a',
		type: 'image',
		tLoading: 'Загрузка #%curr%...',
		mainClass: 'mfp-img-mobile',
		gallery: {
			enabled: true,
			navigateByImgClick: true,
			preload: [0,1] // Will preload 0 - before current, and 1 after the current image
		}
	});

  // Trigger to Big photo
	$(".item-photo").on("click", function(){
		$(this).next().children(":first-child").children().trigger("click");
	})

	// Call popup
	$('.popup-btn').magnificPopup({
		tClose: 'Закрыть'
	});

	// Continue shopping btn (close popup)
	$(document).on('click', '.popup-close', function (e) {
		e.preventDefault();
		$.magnificPopup.close();
	});

	// FAQ accordeon
	$('.tab-accord-quest').on('click', function(e){ // запуск функції по кліку по об'єкту
    $(this).next().slideToggle(250);   					  // переключаю наступний елемент в дереві DOM з анімацією в 250мс
  });

});	// end ready

