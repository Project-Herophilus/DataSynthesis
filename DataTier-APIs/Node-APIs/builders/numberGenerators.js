

module.exports = {
    generateRandomNumbers(high, low){ 
        return Math.floor(Math.random() * (high-low+1)+low)
    }
}