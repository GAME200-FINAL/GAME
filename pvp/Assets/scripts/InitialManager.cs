using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class InitialManager : MonoBehaviour {
	void Awake()
	{
        GameObject.Find("himeko").GetComponent<chattack>().playerID=RoleSelect.himeko;
		GameObject.Find("himeko").GetComponent<chmove>().playerID=RoleSelect.himeko;
		GameObject.Find("sakura").GetComponent<chattack>().playerID=RoleSelect.sakura;
		GameObject.Find("sakura").GetComponent<chmove>().playerID=RoleSelect.sakura;
	}
}
