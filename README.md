# Space Explorer

The Space Explorer application I developed with Flutter gives information about the 9 planets closest to the Sun.

### Installation and operation

1. `git clone https://github.com/speeedev/Space_Explorer_App_Flutter.git`
2. flutter pub get
3. flutter run

## Project Details

### Pages

- Splash: The first page that opens when the application is started. This page is shown before the home page loads. Data is loaded before redirecting to the home page. Thus, when the user enters the home page, he does not wait for the data to load.

- Home: Page listing the planets. Demonstrated using Carousel Slider.

- Planet Detail: A description of the planet and video, if available, are shown.

### Working Logic

When the application is opened, it connects to the [API system]([https://planet-app-api.onrender.com/](https://github.com/speeedev/planet-app-api)) I wrote through the network process and information about the planets is retrieved from there. I launched the API system with [render.com](https://render.com/), a free hosting service.

Information is retrieved from the Splash page via API. It is then forwarded to the home page. When the user clicks on the planet whose details he wants to see, the planet information is sent while being directed to the page. In other words, no more network operations are performed on the Planet Detail page.

### Packages

- [provider](https://pub.dev/packages/provider)
- [dio](https://pub.dev/packages/dio)
- [carousel_slider](https://pub.dev/packages/carousel_slider)
- [figma_squircle](https://pub.dev/packages/figma_squircle)
- [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)


### Screenshoots

    
<table>
    <tr>
        <th>View Name</th>
        <th>Screenshot</th>
    </tr>
    <tr>
        <td>Splash</td>
        <td><img src="https://github.com/speeedev/flutter_space_explorer/blob/master/screenshots/splash.png" style="height: 800px;"></td>
    </tr>
    <tr>
        <td>Home</td>
        <td><img src="https://github.com/speeedev/flutter_space_explorer/blob/master/screenshots/home.png" style="height: 800px;"></td>
    </tr>
    <tr>
        <td>Planet Detail</td>
        <td><img src="https://github.com/speeedev/flutter_space_explorer/blob/master/screenshots/planet%20detail.png" style="height: 800px;"></td>
    </tr>
</table>
