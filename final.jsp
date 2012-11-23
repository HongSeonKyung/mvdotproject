<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>사진 슬라이드</title>
<style type="text/css">
<!--
/** 
 * Slideshow style rules.
 */
#slideshow {
	margin:0 auto;
	width:960px;
	height:263px;
	background:transparent url(images/bg_slideshow.jpg) no-repeat 0 0;
	overflow:auto; 
	position:relative;
}
#slideshow #slidesContainer {
  overflow:auto; /* allow scrollbar */
}
#slideshow #slidesContainer .slide {
  margin:0 auto;
  width:540px; /* reduce by 20 pixels of #slidesContainer to avoid horizontal scroll */
  height:263px;
}

/** 
 * Slideshow controls style rules.
 */
.control {
  display:block;
  width:39px;
  height:263px;
  text-indent:-10000px;
  position:absolute;
  cursor: pointer;
}
#leftControl {
  top:0;
  left:0;
  background:transparent url(images/control_left.jpg) no-repeat 0 0;
}
#rightControl {
  top:0;
  right:0;
  background:transparent url(images/control_right.jpg) no-repeat 0 0;
}

/** 
 * Style rules for Demo page
 */
* {
  margin:0;
  padding:0;
  font:normal 11px Verdana, Geneva, sans-serif;
  color:#ccc;
}

/*
#pageContainer {
  margin:0 auto;
  width:960px;
}*/
#pageContainer h1 {
  display:block;
  width:960px;
  height:114px;
  background:transparent url(images/bg_pagecontainer_h1.jpg) no-repeat top left;
  text-indent: -10000px;
}
.slide h2, .slide p {
  margin:0px;
}
.slide h2 {
  font:italic 24px Georgia, "Times New Roman", Times, serif;
  color:#ccc;
  letter-spacing:-1px;
}
.slide img {
  float:right;
  margin:0 0px;
}

#slideshow {position: absolute;  z-index : 1}
#search {position: absolute; left: 250px; top: 150px ; z-index : 2 ;width:188;height:17;}
-->
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
  var currentPosition = 0;
  var slideWidth = 560;
  var slides = $('.slide');
  var numberOfSlides = slides.length;

  // Remove scrollbar in JS
  $('#slidesContainer').css('overflow', 'hidden');

  // Wrap all .slides with #slideInner div
  slides
    .wrapAll('<div id="slideInner"></div>')
    // Float left to display horizontally, readjust .slides width
	.css({
      'float' : 'left',
      'width' : slideWidth
    });

  // Set #slideInner width equal to total width of all slides
  $('#slideInner').css('width', slideWidth * numberOfSlides);

  // Insert controls in the DOM
  $('#slideshow')
    .prepend('<span class="control" id="leftControl">Clicking moves left</span>')
    .append('<span class="control" id="rightControl">Clicking moves right</span>');

  // Hide left arrow control on first load
  //manageControls(currentPosition);

  // Create event listeners for .controls clicks
  $('.control')
    .bind('click', function(){
    // Determine new position
    currentPosition = ($(this).attr('id')=='rightControl') ? currentPosition+1 : currentPosition-1;
    if(currentPosition==-1)
    	currentPosition=0;
    if(currentPosition==numberOfSlides)
    	currentPosition=numberOfSlides-1;
    // Hide / show controls
  //  manageControls(currentPosition);
    // Move slideInner using margin-left
    $('#slideInner').animate({
      'marginLeft' : slideWidth*(-currentPosition)
    
    });
  });

  // manageControls: Hides and Shows controls depending on currentPosition
  function manageControls(position){
    // Hide left arrow if position is first slide
	if(position==0){ $('#leftControl').hide() } else{ $('#leftControl').show() }
	// Hide right arrow if position is last slide
    if(position==numberOfSlides-1){ $('#rightControl').hide() } else{ $('#rightControl').show() }
  }	
});
</script>
</head>
<body>
<!--  
<div id="pageContainer">
  <h1>영화를 검색해보세요</h1>-->
  <div id="slideshow" style="z-index:1">
    <div id="slidesContainer">
      <div class="slide">     
        <p><img src="images/img_slide_01.jpg" alt="1"  width="500" height="260"/></p>
      </div>
      <div class="slide">      
        <p><img src="images/img_slide_02.png"  width="500" height="260" /></p>
      </div>
      <div class="slide">      
        <p><img src="images/img_slide_03.jpg" width="500" height="260" /></p>
      </div>
    </div>
  </div>
  <div id="search" style="z-index:2">
				 <input type="text" class="span2">
				<button type="submit" class="btn">Search</button>
  </div>
<!-- </div> -->
</body>
</html>
