// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require_tree .
//= require rails-ujs
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker
//= require jquery.easing
//= require nested_form_fields
//= require_self
//= require moment

// studentとcustomerのindexのオートフィルター

$(function(){
	$('#button').bind("click",function(){
		var re = new RegExp($('#search').val());
		$('#result tbody tr').each(function(){
			var txt = $(this).find("td:eq(0)").html();
			if(txt.match(re) != null){
				$(this).show();
			}else{
				$(this).hide();
			}
		});
	});

	$('#button2').bind("click",function(){
		$('#search').val('');
		$('#result tr').show();
	});

	// パンくずリストのuserログイン時のhomeリンクを無効にする
	// $('.breadcrumbs a:first-child').css("pointer-events", "none");
});


// スクロールの速度
$(function(){

  $('a[href^=#]').click(function(){

    var speed = 500;
    var href= $(this).attr("href");
    var target = $(href == "#" || href == "" ? 'html' : href);
    var position = target.offset().top;
    $("html, body").animate({scrollTop:position}, speed, "swing");
    return false;
  });
});


//▼別ページからの遷移時にスムーススクロール（?id=で指定）
$(window).on('load', function() {
  // jqueryの記述でurlを取得(locationとattrで)
  // https://qiita.com/hkwid/items/70341d8989c605eb3c23
  var url = $(location).attr('href');
    //ロード後少し時間を置く
    setTimeout(function(){
      // str.indexOf(文字列)で、文字列が見つかった時は0以上、見つからなかった時は-1が返る事を利用して
      // 文字列が存在しないとき「じゃないとき」は以下を実行
      // https://qiita.com/kazu56/items/557740f398e82fc881df
      if(url.indexOf("?id=") != -1){
        // .split('?id=')は?id=で区切り配列に分割する。今回の場合?id=contactだったら ["?id=", "contact"]って感じ。
        https://www.ajaxtower.jp/js/string/index1.html
        var id = url.split("?id=");
        // lengthは配列の要素数+1を返すので、そこから-1した（つまりcontact）やつを取得
        var $target = $('#' + id[id.length - 1]);
        // 存在するかどうか
        if($target.length){
          // offsetはレシーバーの要素の座標を取得してくれる。
          // http://js.studio-kingdom.com/jquery/css/offset
          var pos = $target.offset().top;
		// animate(params, [duration], [easing], [callback])に基づいて、paramsをposに入れた座標、かかる時間を決めてる。
          $("html, body").animate({scrollTop:pos}, 1000);
        }
      }
    },80);
  });


// $(function() {
//   $('a[href^="#"]').click(function() {
//     var speed = 500;
//     var href = $(this).attr("href");
//     var target = $(href == "#" || href == "" ? 'html' : href);
//     var position = target.offset().top;
//     $('html, body').animate({scrollTop:position}, speed, 'swing');
//     return false;
//   });
// });

// $(document).ready(function(){
//     var $speed = 50; //スクロールのスピードを設定（ミリ秒）
//     var target = $('.contact-form');
//     // var offsetTop =
//     var targetOffset = target.offset().top;
//     //ページを読み込み0.8秒後にターゲットとなるdivまで自動スクロール
//     setTimeout(function(){
//         $("html,body").stop().animate({scrollTop:targetOffset},$speed, 'quart');
//         return false;
//     },800);
// });
