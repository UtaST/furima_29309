if (document.URL.match( /new/ ) || document.URL.match( /edit/ )) {
  document.addEventListener('DOMContentLoaded', () => {
    const imagePreview = document.getElementById('image-preview');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
  
      imageElement.appendChild(blobImage);
      imagePreview.appendChild(imageElement);
    }

    document.getElementById('item-image').addEventListener('change', (e) => {
      const imageContent = document.querySelector('img');
      if (imageContent){
        imageContent.remove();
      }
      let file = e.target.files[0];
      let blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}