//Ejercicio 5

function maximoComunDivisor( num, num2){

    let menor, mayor;

    if(num < num2){
        menor  = num;
        mayor = num2;
    }else{
        menor  = num2;
        mayor = num;
    }

    let x = mayor % menor;

    if(x > 0){
        return maximoComunDivisor(menor,x);
    }else{
        return menor
    }

}

console.log(maximoComunDivisor(56,18))
