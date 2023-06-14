function likePost(postId) {
    var username = "${sessionScope.username}";

    $.ajax({
        type: "POST",
        url: "post",
        data: {postId: postId, action: "like", postUser: username},
        dataType: "json",
        success: function (data) {
            // Update the like count dynamically
            $("#likeCount_" + postId).text(data.likes);
        },
        error: function () {
            console.log("Error occurred while liking the tweet.");
        }
    });
}
