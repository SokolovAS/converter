$('.send').on('click', function(){

    if(!validate()){
        return false;
    }

    var from = $('.cur_from').val();
    var from_count = $('.from_count').val();
    var to = $('.cur_to').val();

    $.ajax({
        url:'/index/calculate',
        method:'post',
        data:{
            from:from,
            from_count:from_count,
            to:to
        }
    }).done(function(r){

        var history = '';

        $.each(r.history, function(index, val){

            history += '<p>'+ val.currency_in +' => ' + val.currency_out + ' : ' + val.result;
        });

        $('.history_data').html(history);
        $('.res').val(r.res);
    });
});

function validate(){

    var value = $('.from_count').val();

    if($.isNumeric(value)){

        $('.error_message').html('');
        return true;
    }else{
        $('.error_message').html('Please enter only digits.');
    }
}