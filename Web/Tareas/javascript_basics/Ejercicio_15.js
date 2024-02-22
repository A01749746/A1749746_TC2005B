//Ejercicio 15

function descendente(lista){

    let temp;

    for (let i=0; i < lista.length ; i++){

        for(let j=0; j < lista.length ; j++){

            if(lista[i] > lista[j]){

                temp = lista[j];
                lista[j]= lista[i];
                lista[i]= temp;
            }
        }

    }

    return lista;
}

console.log(descendente([5,7,1,4,3]))