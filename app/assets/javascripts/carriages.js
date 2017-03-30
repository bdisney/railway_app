$(function() {
    var $carriage_type = $('#carriage_type'),
        $carriage_seat = $('.carriage-seat');

    function switchCarriageFields(carriage_type) {
        $carriage_seat.hide();
        $carriage_seat.each(function() {
            if ($(this).attr('rel').split('|').includes(carriage_type)) $(this).show();
        });
    }

    switchCarriageFields($carriage_type.val());

    $carriage_type.on('change', function() {
        switchCarriageFields($(this).val());
    });
});