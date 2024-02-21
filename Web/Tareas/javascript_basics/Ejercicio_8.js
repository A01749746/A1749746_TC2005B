//Ejercicio 8

function quitarDuplicados(lista){

    let sinDuplicados = [lista[0]];

    for(let i=1; i< lista.length;i++){

        for(let j=0; j< sinDuplicados.length; j++){

            if(lista[i] != sinDuplicados[j]){
                sinDuplicados.push(lista[i])
            }

        }


    }
    
    return sinDuplicados

}

console.log(quitarDuplicados([1,0,1,1,0,0]))