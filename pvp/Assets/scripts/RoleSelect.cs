using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.UI;
using Rewired;

public class RoleSelect : MonoBehaviour {
public static int himeko=1;
public static int sakura=0;
public GameObject raw0;
public GameObject raw1;
public Player player;
bool initialized;
SoundManager soundManager;



public void loadToGame(){
	SceneManager.LoadScene("pvp");
}

void Start(){
	soundManager=GameObject.Find("SoundManager").GetComponent<SoundManager>();
}
void Initialize()
{
	player = ReInput.players.GetPlayer(0);
	initialized=true;
}
void Update(){
	if(Input.GetKeyDown(KeyCode.Escape))
	{
		Application.Quit();
	}
	  if (!ReInput.isReady)
            return; // Exit if Rewired isn't ready. This would only happen during a script recompile in the editor.
        if (!initialized)
            Initialize();
    if(player.GetButtonDown("Right")||player.GetButtonDown("Left"))
	{
		StartCoroutine(soundManager.LoadAudio("SFX1.wav",1,1,1,0,false));
        if(himeko==1)
		{
		   raw0.SetActive(false);
		   raw1.SetActive(true);
           himeko=0;
		   sakura=1;
		}
        else
		{
		   raw0.SetActive(true);
		   raw1.SetActive(false);
           himeko=1;
		   sakura=0;
		}
	}
	if(player.GetButtonDown("Start"))
	{
		StartCoroutine(soundManager.LoadAudio("SFX9.wav",1,1,1,0,false));
		Invoke("loadToGame",1);
	}
}



}
