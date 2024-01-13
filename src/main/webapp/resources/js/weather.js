//weather
const API_KEY = "dfae6f06f26d27a5b24a81783d154911";

// position => GeolocationPosition Object
function onGeoOk(position) {
  const lat = position.coords.latitude;
  const lon = position.coords.longitude;
  const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      const weather = document.querySelector("#weather span:first-child");
      const city = document.querySelector("#weather span:last-child");
      city.innerText = data.name;
      weather.innerText = `${data.weather[0].main} / ${data.main.temp}`
      console.log(data);
    });
  // fetch() 가 브라우저로 가지 않고 url을 실행시켜줌
}

function onGeoError() {
  //alert("Can't find you. No weather for you.");
}

// 2개의 argument (true function, false function)
navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);

onGeoOk(positon);