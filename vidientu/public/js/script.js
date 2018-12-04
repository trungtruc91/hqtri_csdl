$(function () {
    $('.save-user').click(function () {
        var data=[];
        $('.panel-body .user').each(function () {
            var type=$(this).find('.type').text();
            var postId=$(this).find('.PostID').text();
            var MemberID=$(this).find('.link-admin').attr('href').split('/').pop();
            var username=$(this).find('.full-name').text();
            var comment=$(this).find('.question .text').text();

            var document={
                'TypeInteract':type,
                'PostID':postId,
                'MemberID':MemberID,
                'Username':username,
                'Comment':comment
            };
            data.push(document);

        });
        getScriptAjax('/interact/submitmember','post',{arrData:data},function (response) {
            if(response.code===1){
                loadToastr(1,'Success!');
            }
        });
    });

});
function loadToastr(status, msg) {

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "rtl": false,
        "positionClass": "toast-top-right",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": 300,
        "hideDuration": 1000,
        "timeOut": 5000,
        "extendedTimeOut": 1000,
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    };

    if (status == 'success') {
        toastr.success(msg, 'Success');
    } else {
        toastr.error(msg, 'Error');
    }
}
