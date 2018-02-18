function getProductsToBuy(){

   /* var buy_URL = "buy.php?";
    var counter = 0;*/

    $('.product-amount').each(function () {

        // ADDED
        var buy_URL = "buy.php?";
        var counter = 0;
        // ADDED

        var product_id = $(this).attr('id');
        var product_amount = $(this).val();

        if(product_amount.length > 0 && !isNaN(product_amount) && Number(product_amount) > 0){

            // productsToBuy.push({id : product_id, amount : product_amount});

            if(counter > 0)
                buy_URL += "&";

            buy_URL += product_id + "=" + product_amount;
            counter += 1;
        }

       /* if(counter > 0)
            window.location.href = buy_URL;*/
    });

    $('.product-amount-purchase').each(function () {

        // ADDED
        var buy_URL = "purchaseOrder.php?";
        var counter = 0;
        // ADDED

        var product_id = $(this).attr('id');
        var product_amount = $(this).val();

        if(product_amount.length > 0 && !isNaN(product_amount) && Number(product_amount) > 0){

            // productsToBuy.push({id : product_id, amount : product_amount});

            if(counter > 0)
                buy_URL += "&";

            buy_URL += product_id + "=" + product_amount;
            counter += 1;
        }

        if(counter > 0)
            window.location.href = buy_URL;
    });

    if(counter > 0)
        window.location.href = buy_URL;
}
    