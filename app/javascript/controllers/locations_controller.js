import { Controller } from "@hotwired/stimulus"
// import { get } from '@rails/request.js'

export default class extends Controller {
    static targets = ["locationInput", "locationDropdown"]

    locationInputChanged() {
        // if (!this.locationInputTarget.value || this.locationInputTarget.value.length < 3) {
        //     const dropdown = this.locationDropdownTarget;
        //     dropdown.innerHTML = '';
        //     dropdown.style.display = 'none';
        //     return;
        //     }

        const query = this.locationInputTarget.value;
        if (query.length > 2) {
            this.fetchLocations(query)
            
        }
            // console.log(query) 
            
            // dropdown.innerHTML = 'hi';
            // this.updateDropdown(query)
    }

    fetchLocations(query) {
        const dropdown = this.locationDropdownTarget
        fetch(`/locations/search?q=${encodeURIComponent(query)}`)
          .then(response => response.json())
          .then(data => {
            dropdown.innerHTML = ''; // Clear previous results
            if (data.length > 0) {
                console.log(data)
                // this.updateDropdown(data)
                data.forEach(location => {
                        const option = document.createElement('option');
                        option.value = location.name; // You can also set this to a unique identifier if needed
                        option.textContent = location.name;
                        dropdown.appendChild(option);
                });
            }
          })
        

        // if (response.ok) {
        //     const results = response.json()
        //     console.log(results)
        //     // this.updateDropdown(results)
        // }
    }
    updateDropdown(locations) {
        const dropdown = this.locationDropdownTarget.innerHTML = ''
        
        locations.forEach((location) => {

            const li = document.createElement("li")
            li.textcontent = `${location.name} (${location.street}, ${location.city})`
            this.locationDropdownTarget.appendChild(li)
        })
    }
}