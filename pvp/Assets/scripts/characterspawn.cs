using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class characterspawn : MonoBehaviour {
    static public int characternum1, characternum2;
    public GameObject[] characters;
    public Transform[] playerpos;
	// Use this for initialization
	void Start () {
        characternum1 = 0;
        characternum2 = 1;
        Instantiate(characters[characternum1], playerpos[0].position, playerpos[0].rotation);
        Instantiate(characters[characternum2], playerpos[1].position, playerpos[1].rotation);
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
