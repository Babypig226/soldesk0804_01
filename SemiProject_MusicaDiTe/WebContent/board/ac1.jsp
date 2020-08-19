<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/*
*
*    Author:    Michael Raffaele <michael@mraffaele.com>
*    Date:    25th October 2011
*    Info:     http://www.mraffaele.com/blog/2011/10/25/css-accordion-no-javascript/
*
*/

/* Shared for all accordion types */
.accordion {
    font-family:Arial, Helvetica, sans-serif; 
    margin:0 auto;
    font-size:14px;
    border:1px solid #542437;
    border-radius:10px;
    width:600px;
    padding:10px;
    background:#fff;
}
.accordion ul {
    list-style:none;
    margin:0;
    padding:0;    
}
.accordion li {
    margin:0;
    padding:0;
}
.accordion [type=radio], .accordion [type=checkbox] {
    display:none;
}
.accordion label {
    display:block;
    font-size:16px;
    line-height:16px;
    background:#D95B43;
    border:1px solid #542437;
    color:#542437;
    text-shadow:1px 1px 1px rgba(255,255,255,0.3);
    font-weight:700;
    cursor:pointer;
    text-transform:uppercase;
    -webkit-transition: all .2s ease-out;
    -moz-transition: all .2s ease-out;
}
.accordion ul li label:hover, .accordion [type=radio]:checked ~ label, .accordion [type=checkbox]:checked ~ label {
    background:#C02942;
    color:#FFF;
    text-shadow:1px 1px 1px rgba(0,0,0,0.5)
}
.accordion .content {
    padding:0 10px;
    overflow:hidden;
    border:1px solid #fff; /* Make the border match the background so it fades in nicely */
    -webkit-transition: all .5s ease-out;
    -moz-transition: all .5s ease-out;
}
.accordion p {
    color:#333;
    margin:0 0 10px;
}
.accordion h3 {
    color:#542437;
    padding:0;
    margin:10px 0;
}


/* Vertical */
.vertical ul li {
    overflow:hidden;
    margin:0 0 1px;
}
.vertical ul li label {
    padding:10px;
}
.vertical [type=radio]:checked ~ label, .vertical [type=checkbox]:checked ~ label {
    border-bottom:0;
}
.vertical ul li label:hover {
    border:1px solid #542437; /* We don't want the border to disappear on hover */
}
.vertical ul li .content {
    height:0px;
    border-top:0;
}
.vertical [type=radio]:checked ~ label ~ .content, .vertical [type=checkbox]:checked ~ label ~ .content {
    height:300px;
    border:1px solid #542437;
}
</style>
</head>
<body>
<div class="accordion vertical">
    <ul>
        <li>
            <input type="radio" id="radio-1" name="radio-accordion" checked="checked" />
            <label for="radio-1">회원가입은 어케 하나여</label>
            <div class="content">
                
                <p>잘 병시나 </p>
        </li>
        <li>
            <input type="radio" id="radio-2" name="radio-accordion" />
            <label for="radio-2">Title&nbsp;Two</label>
            <div class="content">
                <h3>Totally another one right here</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec posuere lorem. Pellentesque hendrerit, lorem luctus porttitor vestibulum, eros sapien mattis libero, euismod congue neque nisi at ipsum. Mauris semper ipsum sit amet metus semper malesuada. Donec vel est justo, ac porta diam.</p>
                <p>In ut est in orci commodo blandit. Cras rhoncus ultricies augue. Proin quam odio, venenatis ut tempus tristique, aliquet in velit. Pellentesque volutpat facilisis orci, ut congue mi rhoncus at. Nullam vehicula dignissim neque, sed rhoncus magna ultricies et.</p>
            </div>
        </li>
        <li>
            <input type="radio" id="radio-3" name="radio-accordion" />
            <label for="radio-3">Title&nbsp;Three</label>
            <div class="content">
                <h3>I think I can go on forever</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec posuere lorem. Pellentesque hendrerit, lorem luctus porttitor vestibulum, eros sapien mattis libero, euismod congue neque nisi at ipsum. Mauris semper ipsum sit amet metus semper malesuada. Donec vel est justo, ac porta diam.</p>
                <p>In ut est in orci commodo blandit. Cras rhoncus ultricies augue. Proin quam odio, venenatis ut tempus tristique, aliquet in velit. Pellentesque volutpat facilisis orci, ut congue mi rhoncus at. Nullam vehicula dignissim neque, sed rhoncus magna ultricies et.</p>
            </div>
        </li>
        <li>
            <input type="radio" id="radio-4" name="radio-accordion" />
            <label for="radio-4">Title&nbsp;Four</label>
            <div class="content">
                <h3>I was wrong, I'm done</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse nec posuere lorem. Pellentesque hendrerit, lorem luctus porttitor vestibulum, eros sapien mattis libero, euismod congue neque nisi at ipsum. Mauris semper ipsum sit amet metus semper malesuada. Donec vel est justo, ac porta diam.</p>
                <p>In ut est in orci commodo blandit. Cras rhoncus ultricies augue. Proin quam odio, venenatis ut tempus tristique, aliquet in velit. Pellentesque volutpat facilisis orci, ut congue mi rhoncus at. Nullam vehicula dignissim neque, sed rhoncus magna ultricies et.</p>
            </div>
        </li>
    </ul>
</div>
</body>
</html>