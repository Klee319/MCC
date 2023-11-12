document.addEventListener('DOMContentLoaded', function() {
    const imageInput = document.getElementById('imageInput');
    const imagePreviewContainer = document.getElementById('imagePreview');

    imageInput.addEventListener('change', function(event) {
        // Clear the existing previews
        imagePreviewContainer.innerHTML = '';

        // Loop through each selected file and create a preview
        for (let i = 0; i < event.target.files.length; i++) {
            const file = event.target.files[i];
            const reader = new FileReader();
            reader.addEventListener('load', function() {
                // Create a new image element for each file and set its source
                const imagePreview = document.createElement('img');
                imagePreview.classList.add('img-fluid'); // Optional: Add class for styling
                imagePreview.src = reader.result;
                imagePreview.style.marginBottom = '20px';

                // Append the preview image to the container
                imagePreviewContainer.appendChild(imagePreview);
            });

            reader.readAsDataURL(file);
        }
    });
});
