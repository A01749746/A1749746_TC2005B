//Ejercicio 12

function medianaModa(lista){

    let ordenada = lista.sort((a, b) => a - b);
    let mitad = ordenada.length / 2;
    let mediana;

    if (ordenada.length % 2 != 0) {
        mediana =  ordenada[mitad-0,5];
    } else {
        mediana =  (ordenada[mitad-1] + ordenada[ordenada.length -mitad])/2;
    }

    let moda = [ 0 , 0];

    for (let i = 0; i < ordenada.length ; i++){

        let count = 0;

        for (let j = 0; j < ordenada.length; j++){
            if(ordenada[i] == ordenada[j]){
                count = count +1;
            }
        }

        if(count > moda[1]){
            moda = [ordenada[i], count]
        }

    }

    if (moda[1] == 1){moda[0] = "Ninguna moda"}

    return [mediana, moda[0]]
    
}

console.log(medianaModa([1,2,3,4,5,6,7,8,9,10,10]));


