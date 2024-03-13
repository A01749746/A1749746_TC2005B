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
