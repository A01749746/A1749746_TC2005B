using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using TMPro;
using UnityEngine.SceneManagement;


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
    private float tiempo = 0f;
    private int botonEnSecuencia = 0;

    public Button powerUp1;
    public Button powerUp2;

    private bool powerUp1Usado = false;
    private bool powerUp2Usado = false;

    public TMP_Text mensaje;

    public int highScore = 0;
    public int score = 0;

    public TMP_Text highScoreText;
    public TMP_Text scoreText;




    void Start()
    {
        highScore = 0;
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

        powerUp1.onClick.AddListener(volverVerSecuencia);
        powerUp2.onClick.AddListener(saltarNivel);

        mensaje.gameObject.SetActive(false);

        textos();

        anadirPaso();


    }


    void Update()
    {
        if (juego){
            
            tiempo += Time.deltaTime;

            if (tiempo >= 0.5f){

                tiempo = 0f;
                PlaySequence();
            }
        }
    }

    void PlaySequence()
    {
        if (botonEnSecuencia < sequence.Count){
            int info = sequence[botonEnSecuencia];
            GlowButton(obtenerImagen(info), Color.white); 
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

        if(score > highScore){
            highScore = score;
        }

        textos();

        score = score +1;


    }

    Image obtenerImagen(int boton)
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
                MostrarMensaje("Secuencia Completada :)",1);
            }
        }else if (!juego){
                MostrarMensaje("Game Over :(", 2);
        }
    }

    void GlowButton(Image imagen, Color glowColor)
    {
        StartCoroutine(colorOriginal(imagen, imagen.color, glowColor, 0.3f));
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
        tiempo = 0f;
        botonEnSecuencia = 0;
        powerUp1Usado = false;
        powerUp2Usado = false;
        score = 0;
        StartGame();
        

    }

    public void volverVerSecuencia()
    {
        if (!powerUp1Usado)
        {
            powerUp1Usado = true; 
            juego = true;
            botonEnSecuencia = 0;
            posicion = 0;
        }
    }

    public void saltarNivel()
    {
        if (!powerUp2Usado)
        {
            powerUp2Usado = true;
            anadirPaso(); 
            juego = true; 
        }
    }

    void MostrarMensaje(string msg, float time)
    {
        mensaje.text = msg;
        mensaje.gameObject.SetActive(true);
        StartCoroutine(tiempoMensaje(time));
    }

    IEnumerator tiempoMensaje(float seg)
    {
        yield return new WaitForSeconds(seg);
        mensaje.text = "";
        mensaje.gameObject.SetActive(false);
    }

    public void mainMenu()
    {
        SceneManager.LoadScene("Menu");
    }

    void textos()
    {
        scoreText.text = "Score: " + score.ToString();
        highScoreText.text = "High Score: " + highScore.ToString();
    }




}

