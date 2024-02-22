//Ejercicio 8

function quitarDuplicados(lista){

    let sinDuplicados = []

    if (lista.length > 0) {
        sinDuplicados.push(lista[0]);
    }
    for(let i=1; i< lista.length;i++){

        let x = false;

        for(let j=0; j< sinDuplicados.length; j++){

            if(lista[i] == sinDuplicados[j]){
                x = true; break;
            }

        }

        if (x == false){sinDuplicados.push(lista[i])}
    }
    
    return sinDuplicados

}

console.log(quitarDuplicados([1,0,1,1,0,0]))