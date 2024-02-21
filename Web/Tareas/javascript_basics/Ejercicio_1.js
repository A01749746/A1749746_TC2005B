//Ejercicio 1

function primerCaracterSinRepeticion (name){

    let long = name.length;
    let unico = "ninguno";

    for(let i = 0; i < long ; i++ ){

        let contador = 0;

        for (let j=0; j < long;j++){

            if(name[i] == name[j]){
                contador = contador + 1;
            }

        }

        if (contador == 1){
            unico = name[i]
        }

    }

    return unico;

}

console.log(primerCaracterSinRepeticion("abacddbec"))