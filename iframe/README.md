frontPageInteractive
====================

iframe、JS之间的交互

Iframe常见问题，总结几点如下：

1、  iframe的透明背景: 使用 allowtransparency=true 需要IE5.5以上版本才支持
    &lt;iframe allowtransparency=true src="page.htm" frameborder="0" &gt;&lt;/iframe&gt; 
    在iframe的页面page.htm中加 &lt;body style="background-color:transparent"&gt;

2、  去掉滚动条：加scrolling=no 即可

3、  Iframe之间相互调用以及与页面之间的交互（基于jQuery实现）

A、    主页面中监听left iframe事件，更改main iframe的内容:

        jQuery(function($){
            var lpanel = $("#leftframe").contents().find('#leftmain');
            //主页面中监听left iframe事件，更改main iframe的内容
            lpanel.click(function(){
                var str = $("#mainframe").contents().find("#main").html('主页面中监听left iframe事件，更改main iframe的内容!');
            });
        });


        B、leftiframe中的jQuery操作mainiframe的内容someID的内容

        jQuery(function($){
            $('#left').click(function(){
                var str = $("#mainframe",parent.document.body).contents().find("#main").html('left iframe中的jQuery操作main iframe中的内容!');
            });
        });


4、  iframe 自适应高度
    
    function dyniframesize(down) { 
        var pTar = null; 
        if (document.getElementById){ 
            pTar = document.getElementById(down); 
        }else{ 
            eval('pTar = ' + down + ';'); 
        } 
        if (pTar && !window.opera){ 
            //begin resizing iframe 
            pTar.style.display="block" 
            if (pTar.contentDocument && pTar.contentDocument.body.offsetHeight){ 
                //ns6 syntax 
                pTar.height = pTar.contentDocument.body.offsetHeight +20; 
                pTar.width = pTar.contentDocument.body.scrollWidth+20; 
            } else if (pTar.Document && pTar.Document.body.scrollHeight){ 
                //ie5+ syntax 
                pTar.height = pTar.Document.body.scrollHeight; 
                pTar.width = pTar.Document.body.scrollWidth; 
            } 
        } 
    }

其中 3、4可参见附件 可以直接运行案例(其中包含了jQuery1.7.2.js文件)
