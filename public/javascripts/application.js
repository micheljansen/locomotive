// Common JavaScript code across your application goes here.

$(document).ready(function() {
    $(".delete-link").click(function(e) {
        if (confirm("Are you sure?")) {
            var href = $(this).attr('href');
            var href = href.substring(0, href.length - "/delete".length);
            
            form = $("<form action='" + href + "' method='POST'>"
              + "<input type='hidden' name='_method' value='DELETE'/>"
              + "</form>"
              ).appendTo("body");

            form.submit();
        }
        return false;
    });
});
