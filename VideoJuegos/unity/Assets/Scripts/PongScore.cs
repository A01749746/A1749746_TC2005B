/*
Script to manage the pong score

Alberto Limón
2024-02-21
*/
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PongScore : MonoBehaviour
{

    GameController controller;
    public int side;


    // Start is called before the first frame update
    void Start()
    {
        controller = GameObject.FindWithTag("GameController").GetComponent<GameController>();   
    }

    void OnTriggerExit2D(Collider2D other)
    {
        controller.AddPoints(side);
    }


}
