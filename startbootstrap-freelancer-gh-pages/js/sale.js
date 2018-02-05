
function getProductsToBuy(){

    var productsToBuy = [];

    $('.product-amount').each(function () {
        // termTableInputIDs.push($(this).attr('id'));
        productsToBuy.push({id : $(this).attr('id'), amount : $(this).val()})
    });

    console.log(JSON.stringify(productsToBuy));
}
    