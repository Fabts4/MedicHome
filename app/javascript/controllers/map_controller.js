import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
   mapboxgl.accessToken = this.apiKeyValue
   this.map = new mapboxgl.Map({
     container: this.element,
     style: "mapbox://styles/mapbox/streets-v10"
   })

   this.#addMarkersToMap();
   this.#fitMapToMarkers();
   this.#currentPosition();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)

      popup.on('open', () => {
        const coordinates = this.#getItinerary();
        this.#drawRouteOnMap(coordinates)
      });
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #currentPosition() {
    navigator.geolocation.getCurrentPosition(((success) => {
      const lng = success.coords.longitude
      const lat = success.coords.latitude

      new mapboxgl.Marker({
        color: "#E60F05"
      })
      .setLngLat([ lng, lat ]).addTo(this.map)
    }));
  }

    #getItinerary() {
      console.log(this.data);

      // 1.Je dois récupérer les coords (lon, lat) de mon point de départ
      // 2. Je récupère les coords de mon point d'arrivee
      // 3. je fabrique l'url pour interroger l'API Mapbox Directions
      // https://api.mapbox.com/directions/v5/mapbox/driving/2.3799993,48.8651313;2.33155,48.866718?geometries=geojson&access_token=pk.eyJ1IjoiZmFidHM0IiwiYSI6ImNsZHlrNjMwYzA4NXEzbnM1MDFrcHk0dXAifQ.Zlwca078xZsBRf1TdFGAJA
      // 4. Je dois fetcher cette URL
      // 5. Je récupère dans le JSON les coordinates
    }
      //mapbox/walking
    #drawRouteOnMap(coordinates) {
      // 6. Je créé un layer sur la carte Mapbox avec une LineString construite à partir des coordonnées
      //https://docs.mapbox.com/mapbox-gl-js/example/geojson-line/
    }

}
