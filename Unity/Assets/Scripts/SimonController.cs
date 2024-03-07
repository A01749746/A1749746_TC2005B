using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SimonController : MonoBehaviour
{
    public Button botonRojo;
    public Button botonVerde;
    public Button botonAzul;
    public Button botonNaranja;
    public Button botonNegro;
    public Button botonMorado;

    private Image boton1Imagen;
    private Image boton2Imagen;
    private Image boton3Imagen;
    private Image boton4Imagen;
    private Image boton5Imagen;
    private Image boton6Imagen;

    private List<int> sequence = new List<int>();
    private int posicion = 0;
    private bool juego = false;
    private float timeSinceLastButton = 0f;
    private int botonEnSecuencia = 0;



    void Start()
    {
        StartGame();
    }

    void StartGame()
    {
        boton1Imagen = botonRojo.GetComponent<Image>();
        boton2Imagen = botonVerde.GetComponent<Image>();
        boton3Imagen = botonAzul.GetComponent<Image>();
        boton4Imagen = botonNaranja.GetComponent<Image>();
        boton5Imagen = botonNegro.GetComponent<Image>();
        boton6Imagen = botonMorado.GetComponent<Image>();

        botonRojo.onClick.AddListener(() => botonPresionado(1));
        botonVerde.onClick.AddListener(() => botonPresionado(2));
        botonAzul.onClick.AddListener(() => botonPresionado(3));
        botonNaranja.onClick.AddListener(() => botonPresionado(4));
        botonNegro.onClick.AddListener(() => botonPresionado(5));
        botonMorado.onClick.AddListener(() => botonPresionado(6));

        anadirPaso();
    }


    void Update()
    {
        if (juego){
            
            timeSinceLastButton += Time.deltaTime;

            if (timeSinceLastButton >= 0.5f){

                timeSinceLastButton = 0f;
                PlaySequence();
            }
        }
    }

    void PlaySequence()
    {
        if (botonEnSecuencia < sequence.Count){

            int info = sequence[botonEnSecuencia];
            GlowButton(GetButtonImage(info), Color.white); 
            botonEnSecuencia++;
        }
        else{

            juego = false;
            botonEnSecuencia = 0;
            posicion = 0;
        }
    }

    void anadirPaso()
    {
        sequence.Add(Random.Range(1, 7));
        juego = true;
    }

    Image GetButtonImage(int boton)
    {
        switch (boton){

            case 1: return boton1Imagen;
            case 2: return boton2Imagen;
            case 3: return boton3Imagen;
            case 4: return boton4Imagen;
            case 5: return boton5Imagen;
            case 6: return boton6Imagen;
            default: return null;
        }
    }

    void botonPresionado(int boton)
    {
        if (!juego && sequence[posicion] == boton){

            posicion++;
            if (posicion >= sequence.Count)
            {
                anadirPaso();
            }
        }
        else if (!juego){
            
        }
    }

    void GlowButton(Image imagen, Color glowColor)
    {
        StartCoroutine(colorOriginal(imagen, imagen.color, glowColor, 0.5f));
    }

    IEnumerator colorOriginal(Image imagen, Color originalColor, Color glowColor, float delay)
    {
        imagen.color = glowColor;
        yield return new WaitForSeconds(delay);
        imagen.color = originalColor;
    }

    public void Reset(){

        sequence.Clear();
        posicion = 0;
        juego = false;
        timeSinceLastButton = 0f;
        botonEnSecuencia = 0;
        StartGame();

    }


}

