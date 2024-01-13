const video = document.getElementById("video");
const strUserVO = document.querySelector('#jsonUserVO').value;
const jsonUserVO = JSON.parse(strUserVO);
console.log(jsonUserVO);

Promise.all([
  faceapi.nets.ssdMobilenetv1.loadFromUri("/resources/models"),
  faceapi.nets.faceRecognitionNet.loadFromUri("/resources/models"),
  faceapi.nets.faceLandmark68Net.loadFromUri("/resources/models"),
]).then(startWebcam);

function startWebcam() {
  navigator.mediaDevices
    .getUserMedia({
      video: true,
      audio: false,
    })
    .then((stream) => {
      video.srcObject = stream;
    })
    .catch((error) => {
      console.error(error);
    });
}

function getLabeledFaceDescriptions() {
  
  
  const labels = [jsonUserVO.userNm];
  return Promise.all(
    labels.map(async (label) => {
      const descriptions = [];
      for (let i = 1; i <= 1; i++) {
        const img = await faceapi.fetchImage(`/resources/upload/${jsonUserVO.filesDetailVO.fileSvnm}`);
        const detections = await faceapi
          .detectSingleFace(img)
          .withFaceLandmarks()
          .withFaceDescriptor();
        descriptions.push(detections.descriptor);
      }
      return new faceapi.LabeledFaceDescriptors(label, descriptions);
    })
  );
}

video.addEventListener("play", async () => {
  const labeledFaceDescriptors = await getLabeledFaceDescriptions();
  const faceMatcher = new faceapi.FaceMatcher(labeledFaceDescriptors);

  const canvas = faceapi.createCanvasFromMedia(video);
  document.body.append(canvas);

  const displaySize = { width: video.width, height: video.height };
  faceapi.matchDimensions(canvas, displaySize);

  const faceCheck = setInterval(async () => {
    const detections = await faceapi
      .detectAllFaces(video)
      .withFaceLandmarks()
      .withFaceDescriptors();

    const resizedDetections = faceapi.resizeResults(detections, displaySize);

    canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);

    const results = resizedDetections.map((d) => {
      return faceMatcher.findBestMatch(d.descriptor);
    });
    results.forEach((result, i) => {
      const box = resizedDetections[i].detection.box;
      const drawBox = new faceapi.draw.DrawBox(box, {
        label: result,
      });
      drawBox.draw(canvas);
    });
    if (results[0].label == jsonUserVO.userNm) {
      clearInterval(faceCheck);
      video.remove();
      document.querySelector('canvas').remove(); 
      
      const newImage = document.createElement("img");
      newImage.src = "/resources/images/checkFace.gif";
      document.body.append(newImage);
      setTimeout(async () => {
        window.close();
      }, 3000);
    }
  }, 100);
});
