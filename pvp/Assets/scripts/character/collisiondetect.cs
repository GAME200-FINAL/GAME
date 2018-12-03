using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class collisiondetect : MonoBehaviour {
    GameObject enemy;
    public float attackdistance;
    bool stoptime;
    float reststoptime;
	// Use this for initialization
	void Start () {
        stoptime = false;
        if (this.tag == "p1")
            enemy=GameObject.FindWithTag("p2");
        else
            enemy= GameObject.FindWithTag("p1");
    }
	
	// Update is called once per frame
	void Update () {
		if(stoptime)
        {
            reststoptime -= Time.unscaledDeltaTime;
            if(reststoptime<=0)
            {
                Time.timeScale = 1;
                stoptime = false;
            }
        }

	}
    void normalattackdetect()
    {
        if (enemy != null)
        {
            float distance = Vector3.Distance(transform.position, enemy.transform.position);
            Vector3 diff = enemy.transform.position - transform.position;
            float angle = Vector3.Angle(transform.forward, diff);
            Debug.Log(distance);
            Debug.Log(angle);
            if (distance < attackdistance && angle <= 90)
            {
                pausetime(0.15f);
                enemy.GetComponent<chgethit>().getattacknormal();
            }

        }

    }
    void pausetime(float t)
    {
        if (!stoptime)
        {
            stoptime = true;
            Time.timeScale = 0;
            reststoptime = t;
        }
    }
}
