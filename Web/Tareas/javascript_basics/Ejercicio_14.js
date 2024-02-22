//Ejercicio 14

function potenciaDos(num){

    let x = Math.log2(num);

     if(Number.isInteger(x)){
        return true
     }else{
        return false
     }

}

console.log(potenciaDos(128))