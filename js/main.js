jQuery(document).ready(function(){
	var productCustomization = $('.cd-customization'),
		cart = $('.cd-cart'),
		animating = false;
	if($('.empty-cart')[0]) {
		(cart.hasClass('items-added')) && cart.removeClass('items-added');
	}
	
	initCustomization(productCustomization);

	$('body').on('click', function(event){
		//if user clicks outside the .cd-gallery list items - remove the .hover class and close the open ul.size/ul.color list elements
		if( $(event.target).is('body') || $(event.target).is('.cd-gallery') ) {
			deactivateCustomization();
		}
	});

	function initCustomization(items) {
	
		items.each(function(){
			var actual = $(this),
				selectOptions = actual.find('[data-type="select"]'),
				addToCartBtn = actual.find('.add-to-cart'),
				touchSettings = actual.next('.cd-customization-trigger');

			//detect click on ul.size/ul.color list elements 
			selectOptions.on('click', function(event) { 
				var selected = $(this);
				//open/close options list
				selected.toggleClass('is-open');
				resetCustomization(selected);
				
				if($(event.target).is('li')) {
					// update selected option
					var activeItem = $(event.target),
						index = activeItem.index() + 1;
					
					activeItem.addClass('active').siblings().removeClass('active');
					selected.removeClass('selected-1 selected-2 selected-3').addClass('selected-'+index);
					// if color has been changed, update the visible product image 
					selected.hasClass('color') && updateSlider(selected, index-1);
				}
			});

			//detect click on the add-to-cart button
			addToCartBtn.on('click', function() {
				var curamount = $('.pshop-input-quantity').find('input').val(),
					curprice = $('.commodity-price').val(),
					curid = $('.commodity-id').val();
			    $.ajax(
                {
                       type: "POST",
                       url: "./functions/json.php",
                       data: {functionname: 'additem', arguments: [curid, curamount, curprice]},
                       dataType: 'json',
                       
                       success: function(data) {
                           if(data['error'] == 1)
                           	alert(data['result']);
                       },
                       error: function(data) {
                           alert(data['error']);
                       },
                 });
				if(!animating) {
					//animate if not already animating
					animating =  true;
					resetCustomization(addToCartBtn);

					addToCartBtn.addClass('is-added').find('path').eq(0).animate({
						//draw the check icon
						'stroke-dashoffset':0
					}, 300, function(){
						setTimeout(function(){
							updateCart();
							addToCartBtn.removeClass('is-added').find('em').on('webkitTransitionEnd otransitionend oTransitionEnd msTransitionEnd transitionend', function(){
								//wait for the end of the transition to reset the check icon
								addToCartBtn.find('path').eq(0).css('stroke-dashoffset', '19.79');
								animating =  false;
							});

							if( $('.no-csstransitions').length > 0 ) {
								// check if browser doesn't support css transitions
								addToCartBtn.find('path').eq(0).css('stroke-dashoffset', '19.79');
								animating =  false;
							}
						}, 600);
					});	
				}
			});

			//detect click on the settings icon - touch devices only
			touchSettings.on('click', function(event){
				event.preventDefault();
				resetCustomization(addToCartBtn);
			});
		});
	}

	function updateSlider(actual, index) {
		var slider = actual.parent('.cd-customization').prev('a').children('.cd-slider-wrapper'),
			slides = slider.children('li');

		slides.eq(index).removeClass('move-left').addClass('selected').prevAll().removeClass('selected').addClass('move-left').end().nextAll().removeClass('selected move-left');
	}

	function resetCustomization(selectOptions) {
		//close ul.clor/ul.size if they were left open and user is not interacting with them anymore
		//remove the .hover class from items if user is interacting with a different one
		selectOptions.siblings('[data-type="select"]').removeClass('is-open').end().parents('.cd-single-item').addClass('hover').parent('li').siblings('li').find('.cd-single-item').removeClass('hover').end().find('[data-type="select"]').removeClass('is-open');
	}

	function deactivateCustomization() {
		productCustomization.parent('.cd-single-item').removeClass('hover').end().find('[data-type="select"]').removeClass('is-open');
	}

	function updateCart() {
		//show counter if this is the first item added to the cart
		( !cart.hasClass('items-added') ) && cart.addClass('items-added'); 

		var cartItems = cart.find('span'),
			text = parseInt(cartItems.text()) + parseInt($('.pshop-input-quantity').find('input').val());
		cartItems.text(text);
	}
	
	function removeCart(parent,discount) {
		//show counter if this is the first item added to the cart
		( !cart.hasClass('items-added') ) && cart.addClass('items-added'); 

		var cartItems = cart.find('span'),
			totalItem = $('.total-price').find('span'),
			finalItem = $('.final-price').find('span');
			total = parseInt(totalItem.text()) - parseInt(parent.find('.commdity_item_sum').text());
			if(discount==0){
				final = total;
			}
			else
				final = parseInt(total) - discount;
			text = parseInt(cartItems.text()) - parseInt(parent.find('.commdity_amount').text());
			cartItems.text(text);
			totalItem.text(total);
			finalItem.text(final);
	}
	
    $('.cart-item__delete').click(function()
    {
        if (confirm("確定要刪除此項目?"))
        {
            var id = $(this).parent().parent().attr('id');
            var parent = $(this).parent().parent();
 
            $.ajax(
            {
                   type: "POST",
                   url: "./functions/json.php",
                   data: {functionname: 'deleteitem', arguments: id},
                   dataType: 'json',
                   
                   success: function(data) {
                       if(data['error'] == 1)
                         alert(data['result']);
                       parent.fadeOut('slow', function() {$(this).remove();removeCart(parent,data['result']);});
                       
                   },
                   error: function(data) {
                           	alert(data['error']);
                   },
             });
        }
    });
});
jQuery(document).ready(function(){
    $('.order-item__cancel').click(function()
    {
        if (confirm("確定要刪除此項目?"))
        {
            var id = $(this).parent().parent().parent().attr('id');
            var parent = $(this).parent().parent().parent();
 
            $.ajax(
            {
                   type: "POST",
                   url: "./functions/json.php",
                   data: {functionname: 'cancelitem', arguments: id},
                   dataType: 'json',
                   
                   success: function(data) {
                       if(data['error'] == 1)
                         alert(data['result']);
                       parent.fadeOut('slow', function() {$(this).remove();subOrderCount(parent);});
                       
                   },
                   error: function(data) {
                           	alert(data['error']);
                   },
             });
        }
    });
});

jQuery(document).ready(function(){
    $('#transfer').click(function()
    {
		const address = "0xc7eBE8cdc2B787Fe0a56D024367FCc4eDCFB8D87";
		//const final2 = JSON.parse(JSON.stringify(final));

		const pay = document.getElementById("pay").value;
		
		if(pay == 1){
			final=final+80;
		}else{
			final=final+60;
		}
		console.log(pay);
		console.log(address);
		console.log(final);
		document.getElementById('message').textContent='交易處理中,請稍後';
		Contract.methods.transfer(address , final).send({from:accounts[0]})
	   .then(function(data){
		   //console.log(data);
		   const obj = JSON.parse(JSON.stringify(data));
		   document.getElementById('message').textContent="https://ropsten.etherscan.io/tx/"+obj.transactionHash;
		   document.getElementById('TransactionHash').value ="https://ropsten.etherscan.io/tx/"+obj.transactionHash;
	   
	   })
	   .catch((error) => {
		if (error.code === 4001) {
		  // EIP-1193 userRejectedRequest error
		  // The request was rejected by the user
		  document.getElementById('message').textContent ="User denied transaction signature.";
		  console.log('User denied transaction signature.');
		} else {
			document.getElementById('message').textContent ="交易失敗，請重新轉帳。";
		  	console.error(error);
		}
		window.setTimeout(function(){location.reload()},3000);
	  });
	   

    });
});

function thumb_be_click(id) {

	document.getElementById("pay").defaultValue=id;
	document.getElementsByName("pay")[0].setAttribute('value', id);
	document.getElementById("pay").value = id;
	//const pay = document.getElementById("pay").value;
	//console.log(pay);

}