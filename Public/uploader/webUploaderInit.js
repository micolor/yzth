/**
 * Created by Ann on 2017/5/7.
 */
!function($){
    /**
     *
     * @param uploaderListId
     * @param option
     * @param successFun
     * @returns {Object}
     */
    $.initWebUploaderForShop = function(uploaderId,option,successFun){
        var uploader = new Object();
        //初始化 WebUploader 对象
        uploader = WebUploader.create(
            $.extend({
                swf: '/Public/uploader/Uploader.swf',
                server: '/Admin/Fileuploade/ajax_upload.html',
                auto: true,//自动上传
                duplicate: true//可以重复上传文件
            },option)
        );
        //当文件被加入队列以后触发
        uploader.on( 'fileQueued', function( file ) {
            $("#" + uploaderId + " > div.uploader-list").append(
                '<div id="' + file.id + '" class="item">' +
                '<h4 class="info">' + file.name + '</h4>' +
                '<p class="state">等待上传...</p>' +
                '</div>'
            );
        });
        //上传过程中触发，携带上传进度
        uploader.on( 'uploadProgress', function( file, percentage ) {
            var $li = $( '#'+file.id ),$percent = $li.find('.progress .progress-bar');
            //避免重复创建
            if ( !$percent.length ) {
                $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo( $li ).find('.progress-bar');
            }

            $li.find('p.state').text("上传中");

            $percent.css( 'width', percentage * 100 + '%' );
        });
        //当文件上传成功时触发
        uploader.on( 'uploadSuccess', successFun);
        //当文件上传出错时触发
        uploader.on( 'uploadError', function( file ) {
            //国际化：上传出错
            $( '#'+file.id ).find('p.state').text("上传出错");
        });
        //不管成功或者失败，文件上传完成时触发
        uploader.on( 'uploadComplete', function( file) {
            $( '#'+file.id ).find('.progress').fadeOut();
        });
        return uploader;
    }
}(jQuery);