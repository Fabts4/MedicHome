import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  };

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v12",
    });

    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#currentPosition();
  }

  drawItinary(event) {
    this.#getItinerary(
      event.currentTarget.dataset.lng,
      event.currentTarget.dataset.lat
    );
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html);
      const customMarker = document.createElement("div");
      customMarker.innerHTML = marker.marker_html;
      customMarker.dataset.action = "click->map#drawItinary";
      customMarker.dataset.lat = marker.lat;
      customMarker.dataset.lng = marker.lng;

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
        .addTo(this.map);

      // popup.on("open", () => {
      // const coordinates = this.#getItinerary();
      // this.#drawRouteOnMap(coordinates);
      // });
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds();
    this.markersValue.forEach((marker) =>
      bounds.extend([marker.lng, marker.lat])
    );
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
  }

  #currentPosition() {
    navigator.geolocation.getCurrentPosition((success) => {
      this.lng = success.coords.longitude;
      this.lat = success.coords.latitude;

      new mapboxgl.Marker({
        color: "#E60F05",
      })
        .setLngLat([this.lng, this.lat])
        .addTo(this.map);
    });
  }

  #getItinerary(lng, lat) {
    const url = `https://api.mapbox.com/directions/v5/mapbox/walking/${this.lng},${this.lat};${lng},${lat}?steps=true&geometries=geojson&access_token=${this.apiKeyValue}`;
    // console.log(start);
    fetch(url)
      .then((response) => response.json())
      .then((data) => {
        // (this.coordinates = data["routes"][0]["geometry"]["coordinates"])
        this.#drawRouteOnMap(data["routes"][0]["geometry"]["coordinates"]);
      });
    // 1.Je dois récupérer les coords (lon, lat) de mon point de départ
    // 2. Je récupère les coords de mon point d'arrivee
    // 3. je fabrique l'url pour interroger l'API Mapbox Directions
    // https://api.mapbox.com/directions/v5/mapbox/driving/2.3799993,48.8651313;2.33155,48.866718?geometries=geojson&access_token=pk.eyJ1IjoiZmFidHM0IiwiYSI6ImNsZHlrNjMwYzA4NXEzbnM1MDFrcHk0dXAifQ.Zlwca078xZsBRf1TdFGAJA
    // 4. Je dois fetcher cette URL
    // 5. Je récupère dans le JSON les coordinates
  }
  //mapbox/walking
  #drawRouteOnMap(coordinates) {
    const geojson = {
      type: "Feature",
      properties: {},
      geometry: {
        type: "LineString",
        coordinates: coordinates,
      },
    };
    console.log(geojson);

    // this.map.on("load", () => {
    // if the route already exists on the map, we'll reset it using setData
    if (this.map.getSource("route")) {
      this.map.getSource("route").setData(geojson);
    }
    // otherwise, we'll make a new request
    else {
      this.map.addLayer({
        id: "route",
        type: "line",
        source: {
          type: "geojson",
          data: geojson,
        },
        layout: {
          "line-join": "round",
          "line-cap": "round",
        },
        paint: {
          "line-color": "#A5200B",
          "line-width": 6,
          "line-opacity": 0.85,
        },
      });
    }
    // });
    // 6. Je créé un layer sur la carte Mapbox avec une LineString construite à partir des coordonnées
    //https://docs.mapbox.com/mapbox-gl-js/example/geojson-line/
  }
}
