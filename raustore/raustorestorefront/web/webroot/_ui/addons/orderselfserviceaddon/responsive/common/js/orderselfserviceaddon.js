ACC.orderselfserviceaddon = {

    _autoload: [
        ["bindToCompleteOrderButton", $(".js-cancel-complete-order-link").length != 0],
        "bindToCancelEntryQuantityInput",
        "bindToCancelEntryQuantityFocusOut"
    ],

    bindToCompleteOrderButton : function() {
        $(document).on('click', '.js-cancel-complete-order-link', function(event) {
        	event.preventDefault();
        	$.each( $('[id^="item_quantity_"]'), function(i) {
        		$('[name^="cancelEntryQuantity[' + i + ']"]').val($('#item_quantity_' + i).val())
			});
        	ACC.orderselfserviceaddon.disableEnableSubmit();
        });
    },

	bindToCancelEntryQuantityInput : function() {
        $('input[id^="cancelEntryQuantity"]').keypress(function(e) {
			if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
				return false;
		     }
        });		
	},
	
    bindToCancelEntryQuantityFocusOut : function() {
    	$('[name^="cancelEntryQuantity"]').focusout(function(field) {
    		var index = this.id.replace("cancelEntryQuantity", "");
            if ($('#item_quantity_' + index).val() < this.value) {
                this.value = $('#item_quantity_' + index).val();
            }
            $('[name^="cancelEntryQuantity[' + index + ']"]').val(this.value)
            
            ACC.orderselfserviceaddon.disableEnableSubmit();
    	});
    },
    
    //Enable submit button in case some value is more than zero.
    disableEnableSubmit: function() {
        var submitDisabled = true;
    	$.each( $('[id^="item_quantity_"]'), function(i) {
    		if ($('[name^="cancelEntryQuantity[' + i + ']"]').val() > 0 ) {
    			submitDisabled = false;
    		}
    	});
        $("#cancelOrderButtonConfirmation").prop("disabled", submitDisabled);
    }
	
};