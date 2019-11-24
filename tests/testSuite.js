
let answer = process.env.ANSWER
answer = answer.split(' ')

let testResults = {
    test1: '',
    test2: '',
    test3: ''
}

const test1 = function(firstFizz) {
    if(firstFizz !== 'fizz') {
        testResults.test1 = 'failed'
    } else {
        testResults.test1 = 'passed'
    }
}

const test2 = function(firstBuzz) {
    if(firstBuzz !== 'buzz') {
        testResults.test2 = 'failed'
    } else {
        testResults.test2 = 'passed'
    }
}

const test3 = function(firstFizzBuzz) {
    if(firstFizzBuzz !== 'fizzBuzz') {
        testResults.test3 = 'failed'
    } else {
        testResults.test3 = 'passed'
    }
}

test1(answer[2])
test2(answer[4])
test3(answer[14])

console.log(testResults)