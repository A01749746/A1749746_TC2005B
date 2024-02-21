//Ejercicio 9

function longMasCorta(lista){

    let masCorta = lista[0];

    for(let i = 1; i < lista.length;i++){

        let long = lista[i].length;

        if (long < masCorta){
            masCorta = long;
        }

    }

    return masCorta + ` , soy la cadena mas corta con ${masCorta.length} caracteres`

}

console.log(longMasCorta(["Hola mundo", "Adios mundo", "Me llamo beto"]))