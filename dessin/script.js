const Images = [
    {
      href: "https://assets.codepen.io/8589710/cute-girl-drawing-52.jpg",
      whiteThreshold: 200
    }
  ];
  
  const selectedImage = 0;
  
  const img = new Image();
  img.src = Images[selectedImage].href;
  img.crossOrigin = "anonymous";
  
  const whiteThreshold = Images[selectedImage].whiteThreshold;
  
  const canvas = document.createElement("canvas");
  const ctx = canvas.getContext("2d");
  
  function resizeCanvas() {
    const w = window.innerWidth;
    const h = window.innerHeight;
    const aspectRatio = img.width / img.height;
  
    if (img.width > w || img.height > h) {
      if (aspectRatio > w / h) {
        canvas.width = w;
        canvas.height = w / aspectRatio;
      } else {
        canvas.width = h * aspectRatio;
        canvas.height = h;
      }
    } else {
      canvas.width = img.width;
      canvas.height = img.height;
    }
  
    ctx.drawImage(img, 0, 0, canvas.width, canvas.height);
  
    ctx.save();
    ctx.restore();
  
    const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
    const originalPixels = imageData.data;
    const pixels = imageData.data;
  
    for (let i = 0; i < pixels.length; i += 4) {
      const brightness =
        0.2126 * pixels[i] + 0.7152 * pixels[i + 1] + 0.0722 * pixels[i + 2];
      if (brightness > whiteThreshold) {
        pixels[i + 3] = 0;
      } else {
        pixels[i + 3] *= 0.9;
      }
    }
  
    console.log(pixels);
  
    ctx.putImageData(imageData, 0, 0);
    ctx.font = `40px 'Reenie Beanie'`;
  
    ctx.fillStyle = "rgba(0,0,0,0.6)";
    ctx.fillText("Make it by hand", canvas.width - 230, canvas.height - 130);
  }
  window.addEventListener("resize", resizeCanvas);
  
  img.onload = resizeCanvas;
  
  document.body.appendChild(canvas);
  