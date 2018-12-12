using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class collisiondetect : MonoBehaviour {
    GameObject enemy;
    public float attackdistance;
    bool stoptime;
    float reststoptime;
    public Transform effectposhorizontal;
    public Transform effectposvertical;
    public GameObject baseeffect;
    public GameObject heavyeffect;
    public GameObject bloodprefab;
    Vector3 insbloodpos;
    public Transform bloodpos;
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
            //Debug.Log(distance);
           // Debug.Log(angle);
            if (distance < attackdistance && angle <= 120)
            {
                pausetime(0.13f);
                enemy.GetComponent<chgethit>().getattacknormal();
            }

        }

    }
    void heavydetect()
    {
       //Debug.Log("heavy1");
        if (enemy != null)
        {
           // Debug.Log("heavy2");
            float distance = Vector3.Distance(transform.position, enemy.transform.position);
            Vector3 diff = enemy.transform.position - transform.position;
            float angle = Vector3.Angle(transform.forward, diff);
            //Debug.Log(distance);
            // Debug.Log(angle);
            if (distance < attackdistance && angle <= 120)
            {
              // Debug.Log("heavy3");
                pausetime(0.15f);
                enemy.GetComponent<chgethit>().getattackheavy();
                Instantiate(heavyeffect, effectposvertical.position, effectposvertical.rotation);
            }

        }
    }
    void rounddetect()
    {
        if (enemy != null)
        {
            // Debug.Log("heavy2");
            float distance = Vector3.Distance(transform.position, enemy.transform.position);
            Vector3 diff = enemy.transform.position - transform.position;
            float angle = Vector3.Angle(transform.forward, diff);
            //Debug.Log(distance);
            // Debug.Log(angle);
            if (distance < attackdistance && angle <= 180)
            {
                // Debug.Log("heavy3");
                pausetime(0.15f);
                enemy.GetComponent<chgethit>().getattackheavy();
                Instantiate(heavyeffect, effectposhorizontal.position, effectposhorizontal.rotation);
            }

        }
    }
    void roundnormaldetect()
    {
        if (enemy != null)
        {
            // Debug.Log("heavy2");
            float distance = Vector3.Distance(transform.position, enemy.transform.position);
            Vector3 diff = enemy.transform.position - transform.position;
            float angle = Vector3.Angle(transform.forward, diff);
            //Debug.Log(distance);
            // Debug.Log(angle);
            if (distance < attackdistance && angle <= 180)
            {
                // Debug.Log("heavy3");
                pausetime(0.15f);
                enemy.GetComponent<chgethit>().getattacknormal();
                Instantiate(heavyeffect, effectposhorizontal.position, effectposhorizontal.rotation);
            }

        }
    }
    void blockdetect()
    {
        enemy.GetComponent<Animator>().speed = 1;
        float distance = Vector3.Distance(transform.position, enemy.transform.position);
        Vector3 diff = enemy.transform.position - transform.position;
        float angle = Vector3.Angle(transform.forward, diff);
        if (distance < attackdistance)
        {
            // Debug.Log("heavy3");
            pausetime(0.15f);
            enemy.GetComponent<chgethit>().getblock();
            Instantiate(heavyeffect, effectposhorizontal.position, effectposhorizontal.rotation);
        }
    }
    public void pausetime(float t)
    {
        if (!stoptime)
        {
            stoptime = true;
            Time.timeScale = 0;
            reststoptime = t;
        }
    }
    void chargepause()
    {
        if (!stoptime)
        {
            stoptime = true;
            Time.timeScale = 0;
            //reststoptime = 0.2f;
        }
    }
    void bloodeffect()
    {
        RaycastHit bloodhit;
        if (Physics.Raycast(bloodpos.position, bloodpos.forward, out bloodhit, 3f))
        {
            insbloodpos = bloodhit.point;
            Instantiate(bloodprefab, insbloodpos, bloodprefab.transform.rotation);
        }
    }
}
