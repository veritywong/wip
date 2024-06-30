import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["fileInput", "previewContainer"]

  connect() {
    this.fileInputTarget.addEventListener("change", this.previewImages.bind(this));
  }

  previewImages() {
    this.previewContainerTarget.innerHTML = ''; // Clear any existing previews
    const files = this.fileInputTarget.files;

    Array.from(files).forEach(file => {
      if (file && file.type.match('image.*')) {
        const reader = new FileReader();

        reader.onload = (e) => {
          const img = document.createElement('img');
          img.src = e.target.result;
          img.style.maxHeight = '200px';
          img.style.margin = '10px';
          this.previewContainerTarget.appendChild(img);
        }

        reader.readAsDataURL(file);
      }
    });
  }

}
