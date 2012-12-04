<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
$(document).ready(function(){
  var currentPosition = 0;
  var slideWidth = 960;
  var slides = $('.slide');
  var numberOfSlides = slides.length;
  $('#slidesContainer').css('overflow', 'hidden');
  slides
    .wrapAll('<div id="slideInner"></div>')
	.css({
      'float' : 'left',
      'width' : slideWidth
    });

  $('#slideInner').css('width', slideWidth * numberOfSlides);

  $('#slideshow')
    .prepend('<span class="control" id="leftControl">Clicking moves left</span>')
    .append('<span class="control" id="rightControl">Clicking moves right</span>');

  $('.control')
    .bind('click', function(){
    currentPosition = ($(this).attr('id')=='rightControl') ? currentPosition+1 : currentPosition-1;
    if(currentPosition==-1)
    	currentPosition=0;
    if(currentPosition==numberOfSlides)
    	currentPosition=numberOfSlides-1;
    $('#slideInner').animate({
      'marginLeft' : slideWidth*(-currentPosition)
    
    });
  });
  function manageControls(position){
	if(position==0){ $('#leftControl').hide() } else{ $('#leftControl').show() }
    if(position==numberOfSlides-1){ $('#rightControl').hide() } else{ $('#rightControl').show() }
  }	
});

</script>

  <div id="slideshow" style="z-index:1">
    <div id="slidesContainer">
      <div class="slide">     
        <p><img src="images/img_slide_01.jpg" alt="1" /></p>
      </div>
      <div class="slide">      
        <p><img src="images/img_slide_02.png"  /></p>
      </div>
      <div class="slide">      
        <p><img src="images/img_slide_03.jpg"  /></p>
      </div>
    </div>
  </div>
  <div id="search" style="z-index:2">
  <form action="searchshow.jsp" id="searchfrm" method="post">
				 <input type="text" class="span2" name="keyword" id="keyword"/>
				<button type="submit" class="btn" >Search</button></form>
  </div>