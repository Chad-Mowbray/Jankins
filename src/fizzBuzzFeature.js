
const fizzBuzzFeature = function(num) {
    let answer = ''
    for(let i = 1; i <= num; i++) {
        if(i % 3 == 0 && i % 5 == 0) {
            answer +='fizzBuzz '
        } else if(i % 3 == 0) {
            answer += 'fizz '
        // } else if(i % 5 == 0) {
        //     answer += 'buzz '
        } else {
            answer += i + ' '
        }
    }
    return answer
}

const num = process.env.NUM
console.log(fizzBuzzFeature(num))