// document.addEventListener('DOMContentLoaded', () => {
//     const searchInput = document.getElementById('location-search-input');
//     const resultsDropdown = document.getElementById('location-search-results');
  
//     searchInput.addEventListener('input', function() {
//       const query = searchInput.value;

//       if (query.length > 2) {
//         fetch(`/locations/search?q=${encodeURIComponent(query)}`)
//           .then(response => response.json())
//           .then(data => {
//             // Clear previous results
//             resultsDropdown.innerHTML = '';
  
//             if (data.length > 0) {
//               data.forEach(location => {
//                 const option = document.createElement('option');
//                 option.value = location.name; // You can also set this to a unique identifier if needed
//                 option.textContent = location.name;
//                 resultsDropdown.appendChild(option);
//               });
//             } else {
//               const option = document.createElement('option');
//               option.value = '';
//               option.textContent = 'No results found';
//               resultsDropdown.appendChild(option);
//             }
//           })
//           .catch(error => console.error('Error fetching location data:', error));
//       } else {
//         // Clear dropdown if input is too short
//         resultsDropdown.innerHTML = '';
//       }
//     });
//   });
  