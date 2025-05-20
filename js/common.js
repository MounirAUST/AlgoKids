//surprise colour!
//Referenced to in  home.js and viz.js also
var colourArray = ["#52bc69", "#ed5a7d", "#2ebbd1", "#d9513c", "#fec515", "#4b65ba", "#ff8a27", "#a7d41e"];
					//green, pink, blue, red, yellow, indigo, orange, lime
function getColours() {
	var generatedColours = new Array();
	while(generatedColours.length < 4) {
		var n = (Math.floor(Math.random()*colourArray.length));
		if(generatedColours.indexOf(n) == -1) {
			generatedColours.push(n);
		}
	}
	return generatedColours;
}
var generatedColours = getColours();
var surpriseColour = colourArray[generatedColours[0]];
var colourTheSecond = colourArray[generatedColours[1]];
var colourTheThird = colourArray[generatedColours[2]];
var colourTheFourth = colourArray[generatedColours[3]];

$( document ).ready(function() {
	
	$('#about').html(`
		<h4>About the Project</h4>
		<img class="close-overlay" src="img/cross_white.png" />
		<div class="content">
			<p><strong>What is AlgoKids?</strong><br/>
			AlgoKids is a fun and interactive learning tool designed to teach children the basics of Data Structures and Algorithms (DSA). It was created as a senior project by computer science students at the American University of Science and Technology (AUST).</p>
		
			<p>The idea behind AlgoKids is simple: learning computer science concepts doesn’t have to be boring or hard — especially for kids. We wanted to build something that makes it easier and more exciting for young learners to explore DSA through visuals and step-by-step animations.</p>
		
			<p><strong>Why We Built It</strong><br/>
			While most DSA tools are made for college students or developers, very few are made for kids. We saw a gap and decided to create something that explains big concepts in small, friendly ways. Whether it’s a linked list or a queue, AlgoKids shows how it works in a way that’s easy to understand and fun to play with.</p>
		
			<p><strong>What’s Next?</strong><br/>
			We’re still working on adding more features — like new visualizations, quizzes, and activities. Our goal is to make AlgoKids even more helpful for young minds who are just getting started in tech.</p>
		
			<p>This project wouldn’t have been possible without the support of our mentors and the inspiration we got from other educational tools. But AlgoKids is built from the ground up to be its own thing — made for kids, by students who care.</p>
		</div>
		`);
		$('#team').html(`
			<h4>The Team</h4>
			<img class="close-overlay" src="img/cross_white.png" />
			<div class="content">
				<p><strong>Advisor</strong><br/>
				Mr. David Seeman</p>
			
				<p><strong>Team Members</strong><br/>
				Mounir Matar<br/>
				Nader Alameddine<br/>
				Rafi Alaeddine<br/>
				Elie Gerges</p>
			</div>
			`);
	$('#termsofuse').html('<h4>Terms of use</h4><img class="close-overlay" src="img/cross_white.png" /><div class="content"><p>If you are a data structure and algorithm teacher, you are allowed to use this website for your classes. You can take screen shots from this website and use the screen shots elsewhere as long as you cite this website as a reference.</p><!--I think we need a better copyright/terms of use statement--></div>');
	
	$('.colour').css("color", surpriseColour); //name
	$('h4').css("background-color", surpriseColour); //about, contact us etc. button background
	
	//overlays stuff
	$('#trigger-about').click(function(){
		$('#dark-overlay').fadeIn(function(){
			$('#about').fadeIn();
		});
	});
	$('#trigger-team').click(function(){
		$('#dark-overlay').fadeIn(function(){
			$('#team').fadeIn();
		});
	});
	$('#trigger-terms').click(function(){
		$('#dark-overlay').fadeIn(function(){
			$('#termsofuse').fadeIn();
		});
	});
	
	$('.close-overlay').click(function() {
		$('.overlays').fadeOut(function(){
			$('#dark-overlay').fadeOut();
		});
	});
	
	//facebook login stuff
	$('#fb-login').hide();
	window.fbAsyncInit = function() {
		FB.init({
			appId      : '192228707604746', // App ID
			channelUrl : '//www.rosemarietan.com/fyp/channel.html', // Channel File
			status     : true, // check login status
			cookie     : true, // enable cookies to allow the server to access the session
			xfbml      : true  // parse XFBML
		});
	
		// Here we subscribe to the auth.authResponseChange JavaScript event. This event is fired
		// for any authentication related change, such as login, logout or session refresh. This means that
		// whenever someone who was previously logged out tries to log in again, the correct case below 
		// will be handled. 
		FB.Event.subscribe('auth.authResponseChange', function(response) {
		// Here we specify what we do with the response anytime this event occurs. 
			if (response.status === 'connected') {
				FB.api('/me', function(resp) {
					$('#fb-login').show();
					$('#fb-login').html(resp.name);
					$('#fb-login').attr('href', resp.link);
					$('#trick').hide();
				});
			} else if (response.status === 'not_authorized') {
				FB.login();
			} else {
				FB.login();
			}
		});
	};
	
});