!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");

var elements = document.querySelectorAll('blockquote.tweet-this');

elements.forEach((el) => {
  var blockQuoteText = el.textContent
  var currentUrl = window.location;
  var tweetStr = document.createElement('div')
  tweetStr.classList.add('tweet-quote')
  tweetStr.innerHTML = '<a href="https://twitter.com/share" data-text="' +blockQuoteText+ '"  class="twitter-share-button" data-via="doodlemarks" data-url="' +currentUrl+ '" data-size="large" data-count="vertical">Tweet</a>'
  el.appendChild(tweetStr);

})

