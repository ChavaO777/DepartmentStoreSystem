function getProductsToBuy(HTML_element_class, url_to_redirect){

    var url = url_to_redirect + "?";
    var counter = 0;

    $("." + HTML_element_class).each(function () {

        var product_id = $(this).attr('id');
        var product_amount = $(this).val();

        if(product_amount.length > 0 && !isNaN(product_amount) && Number(product_amount) > 0){

            if(counter > 0)
                url += "&";

            url += product_id + "=" + product_amount;
            counter += 1;
        }

    });

    if(counter > 0)
        window.location.href = url;

}
    