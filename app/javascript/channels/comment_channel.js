import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    const html = `
      <div class="upper-comment">
        <div class="comment-user">
          ${data.content.user_id}
        </div>
        <div class="comment-date">
          ${data.content.created_at}
        </div>
      </div>
      <div class="lower-comment">
        ${data.content.text}
      </div>`;
    const comments = document.getElementById('comments');
    const newComment = document.getElementById('comment_text');
    comments.insertAdjacentHTML('afterbegin', html);
    newComment.value = '';
  }
});
