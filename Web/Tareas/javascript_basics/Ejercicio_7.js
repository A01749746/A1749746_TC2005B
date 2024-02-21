//Ejercicio 7

function factoriza(num){

    let factores = [];

    for(let i = 0 ; i <= num ; i++){

        let factor = num/i;

        if (factor % 1 !== 0) {
            continue;
        } else {
            factores.push(i)
        }
    }

    return factores;

}

console.log(factoriza(12))
