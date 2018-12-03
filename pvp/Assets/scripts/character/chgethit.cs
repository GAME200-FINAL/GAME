using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class chgethit : MonoBehaviour {
    Animator animecontrol;
    GameObject enemy;
    AnimatorStateInfo chstate;
    public int p;
    float hp;
    float brave;
    bool die;
    // Use this for initialization
    private void Awake()
    {
        if (p == 1)
            this.tag = "p1";
        else
            this.tag = "p2";
    }
    void Start () {
        hp = 100;
        animecontrol = GetComponent<Animator>();
        
	}
	
	// Update is called once per frame
	void Update () {
        chstate = animecontrol.GetCurrentAnimatorStateInfo(0);
	}
    public void getattacknormal()
    {
        if (!(chstate.IsTag("dodge")&&chstate.normalizedTime<0.5f)&&!chstate.IsTag("blockback"))
        {
            //GetComponent<chattack>().resetmove();
            if (hp > 0)
            {
               if(!chstate.IsTag("mgethit"))
                animecontrol.Play("mgethit");
                else
                 animecontrol.Play("mgethit1");

            }
            else
            {
                if (!die)
                {
                    die = true;
                    godie();
                }
            }
        }
    }
    public void getattactheavy()
    {
           animecontrol.speed = 1;
            if (GetComponent<chmove>().isGrounded())
                    transform.LookAt(new Vector3(enemy.transform.position.x, transform.position.y, enemy.transform.position.z));
            chstate = this.GetComponent<Animator>().GetCurrentAnimatorStateInfo(0);
            if (!chstate.IsTag("dodge") && !chstate.IsTag("blockback"))
            {
              GetComponent<chattack>().resetmove();
            if (hp > 0)
                {
                  hp -= 10;
                  animecontrol.Play("gethitback");
                }
                else
                {
                    if(!die)
                     {
                         die = true;
                         godie();
                     }
               
                }
            }
    }
    void godie()
    {

    }
}
