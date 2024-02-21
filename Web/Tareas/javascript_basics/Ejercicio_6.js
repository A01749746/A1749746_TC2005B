//Ejercicio 6

function hackerSpeak(frase){

    let nueva = "";

    for(let i = 0; i < frase.length ; i++){
        switch(frase[i]) {
            case "i": nueva = nueva + "1"; break;
            case "z": nueva = nueva + "2"; break;
            case "e": nueva = nueva + "3"; break;
            case "a": nueva = nueva + "4"; break;
            case "s": nueva = nueva + "5"; break;
            case "b": nueva = nueva + "8"; break;
            case "t": nueva = nueva + "7"; break;
            case "g": nueva = nueva + "9"; break;
            case "o": nueva = nueva + "0"; break;
            default: nueva = nueva + frase[i];
        }
    }

    return nueva;
}

console.log(hackerSpeak("Javascript es divertido"));