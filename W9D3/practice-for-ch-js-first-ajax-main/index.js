console.log("Hello from the console!")

// Your code here

let request = new Request("https://api.openweathermap.org/data/2.5/weather?q=London,UK&appid=bcb83c4b54aee8418983c2aff3073b3b")

// fetch(request)

// fetch(request)
//     .then((response) => {
//         if (!response.ok) throw new Error(response)
//         return response.json()
//     })

fetch(request)
    .then(response => {
        if (!response.ok) throw new Error(response)
        return response.json()
    })
    .then(data => {
        console.log("Success!")
        console.log(data)
    }).catch(errorResponse => {
        console.log("Failure!")
        console.error(errorResponse)
    })

console.log('The AJAX request has been dispatched.')