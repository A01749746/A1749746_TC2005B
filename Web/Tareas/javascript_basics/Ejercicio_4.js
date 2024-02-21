//Ejercicio 4

function stringMayu(frase) {

    let nueva = "";

    nueva = nueva + (frase[0].toUpperCase());

    for(let i = 1; i < frase.length; i++){

        if(frase[i] == " "){
            nueva = nueva + frase[i] + frase[i+1].toUpperCase();
            i++;
        }else{
            nueva = nueva + frase[i];
        }

    }

    return nueva;

}

console.log(stringMayu("hola mundo soy beto"))
  
  