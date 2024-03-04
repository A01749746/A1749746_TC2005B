using UnityEngine;
using UnityEngine.SceneManagement;

public class MenuController : MonoBehaviour
{
    public void StartPong()
    {
        // Assuming "PongGame" is the name of your Pong game scene
        SceneManager.LoadScene("PongGame");
    }

    public void StartSimonSays()
    {
        // Assuming "SimonSaysGame" is the name of your Simon Says game scene
        SceneManager.LoadScene("SimonGame");
    }
}
