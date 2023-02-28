// function mysteryScoping1() {
//   var x = 'out of block';
//   if (true) {
//     var x = 'in block';  
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping2() {
//   const x = 'out of block';
//   if (true) {
//     const x = 'in block';  
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping3() {
//   const x = 'out of block';
//   if (true) {
//     var x = 'in block';  
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping4() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';  
//     console.log(x);
//   }
//   console.log(x);
// }

// function mysteryScoping5() {
//   let x = 'out of block';
//   if (true) {
//     let x = 'in block';  
//     console.log(x);
//   }
//   let x = 'out of block again';
//   console.log(x);
// }

function madLib(verb, adjective, noun) {
    let words = "We shall VERB the ADJECTIVE NOUN".split(" ")
    words[words.indexOf("VERB")] = verb.toUpperCase()
    words[words.indexOf("ADJECTIVE")] = adjective.toUpperCase()
    words[words.indexOf("NOUN")] = noun.toUpperCase()
    return words.join(" ")
}

function isSubString(searchString, subString) {
    return searchString.split(" ").indexOf(subString) !== -1
}

function fizzBuzz(array) {
    const a = []
    for (let ele of array) {
        if ((ele % 3 === 0 && ele % 5 !== 0) || (ele % 3 !== 0 && ele % 5 === 0)) {
            a.push(ele)
        }
    }
    return a
}

function isPrime(number) {
    if (!Number.isInteger(number) || number < 2) return false
    for (let i = 2; i <= Math.sqrt(number); i++) {
        if (number % i === 0) return false
    }
    return true
}

function firstNPrimes(n) {
    const primes = []
    let i = 2
    while (n > 0) {
        if (isPrime(i)) {
            primes.push(i)
            n--
        }
        i++
    }
    return primes
}
function sumOfNPrimes(n) {
    const primes = firstNPrimes(n)
    let sum = 0
    for (let prime of primes) {
        sum += prime
    }
    return sum
}