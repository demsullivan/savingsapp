$(function() {
    if ((controller) && (action)) {
        if (window[controller]) {
            var controlObj = new window[controller]();
	    if (id !== null) {
		controlObj[action](id);
	    } else {
		controlObj[action]();
	    }
        }
    }
});