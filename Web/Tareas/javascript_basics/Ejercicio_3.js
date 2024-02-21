//Ejercicio 3

function invertirArreglo(lista){

    let newList = []

    for(let i = 0; i < lista.length ; i++){

        newList.push(lista[lista.length - 1 - i])

    }

    return newList

}

console.log(invertirArreglo([5,7,1,2,3]))

function invertirArregloSinLista(lista){

    let temp;

    for(let i = 0; i < lista.length/2 ; i++){

        temp= lista[i];
        lista[i] = lista[lista.length-i-1];
        lista[lista.length-i-1] =temp;

    }

    return lista

}

console.log(invertirArregloSinLista([5,7,1,2,3]))