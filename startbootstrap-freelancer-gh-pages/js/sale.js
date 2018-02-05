
function getProductsToBuy(){

    var productsToBuy = [];

    $('.product-amount').each(function () {

        var product_id = $(this).attr('id');
        var product_amount = $(this).val();

        if(product_amount.length > 0 && !isNaN(product_amount))
            productsToBuy.push({id : product_id, amount : product_amount});
    });

    console.log(JSON.stringify(productsToBuy));
}
    