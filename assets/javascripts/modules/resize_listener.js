window.addEventListener('message', function(e) {
  var data;
  try {
    data = JSON.parse(e.data);
  } catch (e) {
    return false;
  }

  if (data.context !== 'iframe.resize') {
    return false;
  }

  var iframes = document.querySelectorAll('iframe[src="' + data.src + '"]');

  if (!iframes) {
    return false;
  }

  if (data.height) {
    iframes.forEach((iframe) => {
      iframe.height = data.height;
    })
  }
});

