/*
Menu script for scene management

Alberto Limón
2024-02-21
*/
using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour
{
    public void StartPong()
    {
        SceneManager.LoadScene("PongGame");
    }

    public void StartSimonSays()
    {
        SceneManager.LoadScene("SimonGame");
    }
}
