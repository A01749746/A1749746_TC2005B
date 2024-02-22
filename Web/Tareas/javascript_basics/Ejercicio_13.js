//Ejercicio 13

function cadenaMasFrecuente(lista){

    let moda = [ 0 , 0];

    let ordenada = lista;

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

    return moda

}

console.log(cadenaMasFrecuente(["beto", "fran", "beto","paul", "beto", "eduardo"]))