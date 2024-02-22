// Ejercicio 11

function listaOrdenada(lista){

    let temp;

    for (let i=0; i < lista.length ; i++){

        for(let j=0; j < lista.length ; j++){

            if(lista[i] < lista[j]){

                temp = lista[i];
                lista[i]= lista[j];
                lista[j]= temp;
            }
        }

    }

    return lista;


}

console.log(listaOrdenada(["francisco", "alberto", "paul", "steve", "bruno","eduardo"]))