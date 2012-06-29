frontPageInteractive
====================

前端Flash、JS之间的交互

一、AS调用JS  getURL　　getURL("javascript:history.go(-1)");  
通过URL协议来访问页面中的javascript，上面控制浏览器历史的代码很眼熟吧，诸如此类我们平时在定制页面收藏，发送邮件时都会经常使用这种方式。虽然你也可以调用页面中自己定义的JS函数，但局限性还是比较大，函数的参数传递并不是很灵活，且无返回值。

二、AS调用JS fscommand命令
是一个很常用的方式，但需要在HTML页面中定义一个具有规定格式的myFlash_DoFSCommand函数，且同样无函数返回值。

fscommand and getURL("javascript:...") no longer functions in Flash Player versions greater than 9.0.115.0.  http://helpx.adobe.com/flash-player/kb/changes-allowscriptaccess-default-flash-player.html

三、JS调用AS SetVariable (基于swfobject.js来实现)
思路如下：AS中设置一个状态变量，并使用Object的watch方法对其监视，JS通过SetVariable来修改这个状态变量，一旦侦测到了变量的改变，那就可以根据不同的状态值来选择执行AS中的相应函数了。如果需要考虑用户的低版本播放器，那么可以考虑下该方法，还是比较灵活的。 
具体可参见：..\flash_js\swfobject下源码示例


四、通过ExternalInterface方式轻松实现AS与JS的方法双向互相调用及变量传递、返回等问题，详细介绍可参见FLASH帮助文档和Adobe的官方教程。
通过ExternalInterface方式轻松实现AS与JS的方法双向互相调用及变量传递、返回等问题，详细介绍可参见FLASH帮助文档和Adobe的官方教程。
但as2和as3中对于这个方法参数的个数有区别，as3中：ExternalInterface.addCallback("funJs",funAs)就可以了；但在as2中，需要ExternalInterface.addCallback("funJs",null,funAs)中间要加一个对象才行，这个对象可以为null。
具体参见：..\flash_js\as_js_external下源码示例
