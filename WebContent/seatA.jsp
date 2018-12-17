<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
<title>SEAT</title>
<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR|Noto+Serif+JP|Roboto" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<link rel="stylesheet" href="css/bootstrap-grid.css">
<link rel="stylesheet" href="css/common.css">
<link rel="stylesheet" href="css/seat.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript">
$(function(){
	
});
</script>
</head>
<body>
	<header>
		<h1>HEADER</h1>
	</header>

	<section>
		<div class="seat-wrap">
			<div class="seat-position">
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 0px;">1</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 0px;">2</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 0px;">3</button>
				<button type="button" class="seat-done" title="예약 불가" id="" style="left: 150px; top: 0px;">4</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 0px;">5</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 0px;">6</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 0px;">7</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 0px;">8</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 400px; top: 0px;">9</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 450px; top: 0px;">10</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 0px;">11</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 0px;">12</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 0px;">13</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 0px;">14</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 0px;">15</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 0px;">16</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 0px;">17</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 0px;">18</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 100px;">19</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 100px;">20</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 100px;">21</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 100px;">22</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 100px;">23</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 100px;">24</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 100px;">25</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 100px;">26</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 100px;">27</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 100px;">28</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 100px;">29</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 100px;">30</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 100px;">31</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 100px;">32</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 100px;">33</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 100px;">34</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 150px;">35</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 150px;">36</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 150px;">37</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 150px;">38</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 150px;">39</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 150px;">40</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 150px;">41</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 150px;">42</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 150px;">43</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 150px;">44</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 150px;">45</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 150px;">46</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 150px;">47</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 150px;">48</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 150px;">49</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 150px;">50</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 300px;">51</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 300px;">52</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 300px;">53</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 300px;">54</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 300px;">55</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 300px;">56</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 300px;">57</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 300px;">58</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 300px;">59</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 300px;">60</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 300px;">61</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 300px;">62</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 300px;">63</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 300px;">64</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 300px;">65</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 300px;">66</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 350px;">67</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 350px;">68</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 350px;">69</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 350px;">70</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 350px;">71</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 350px;">72</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 350px;">73</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 350px;">74</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 350px;">75</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 350px;">76</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 350px;">77</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 350px;">78</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 350px;">79</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 350px;">80</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 350px;">81</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 350px;">82</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 850px; top: 450px;">83</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 800px; top: 450px;">84</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 750px; top: 450px;">85</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 700px; top: 450px;">86</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 650px; top: 450px;">87</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 600px; top: 450px;">88</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 550px; top: 450px;">89</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 500px; top: 450px;">90</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 450px; top: 450px;">91</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 400px; top: 450px;">92</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 350px; top: 450px;">93</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 300px; top: 450px;">94</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 250px; top: 450px;">95</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 200px; top: 450px;">96</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 150px; top: 450px;">97</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 100px; top: 450px;">98</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 50px; top: 450px;">99</button>
				<button type="button" class="seat-normal" title="예약 가능" id="" style="left: 0px; top: 450px;">100</button>
			</div>
		</div>
	</section>

	<footer>
		<h1>FOOTER</h1>
	</footer>
</body>
</html>