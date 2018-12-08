using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class chattack : MonoBehaviour {
    Animator animecontrol;
    AnimatorStateInfo state;
    AnimatorStateInfo prestate;
    int slashnum;
    GameObject enemy;
    public GameObject katana;
    private void Awake()
    {
        animecontrol = GetComponent<Animator>();
    
    }
    // Use this for initialization
    void Start () {
      
    }
	
	// Update is called once per frame
	void Update ()
    {
        if(state.IsTag("holster")&&state.normalizedTime>0.8f)
        {
          
            backweapon();
        }
        if(enemy==null)
         {
            if (this.tag == "p1")
                enemy = GameObject.FindWithTag("p2");
            else
                enemy = GameObject.FindWithTag("p1");
         }
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (Input.GetButtonDown("Fire1")&&!Input.GetKey("q")&&!state.IsTag("mgethit"))
        {
                if (enemy != null)
                {
        
                    transform.LookAt(enemy.transform);
                }

                Attack();
        }

        if (Input.GetButtonDown("Fire2") && !state.IsTag("mgethit"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }
            weapondisplay();
            animecontrol.Play("guard");
            animecontrol.SetBool("guard", true);
        }
        if(Input.GetKey("q")&&Input.GetButtonDown("Fire1"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }

            HeavyAttack();
        }
        if(Input.GetButtonUp("Fire2")&&state.IsTag("guard"))
        {
            resetmove();
            animecontrol.SetBool("guard", false);
        }
        if (state.IsTag("normalattack") || state.IsTag("attack"))
        {
          //  Debug.Log("attack");
            if (state.normalizedTime >= 1)
            {
                //Debug.Log("reset");
                resetmove();

            }
        }
    }
    public void resetmove()
    {
        animecontrol.SetBool("attack", false);
        animecontrol.SetInteger("attacktime", 0);
    }
    void Attack()
    {
        weapondisplay();
        //speedback ();
        animecontrol.SetBool("attack", true);
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (!state.IsTag("attack") && !state.IsTag("normalattack") || (state.IsTag("blockback") && !prestate.IsTag("attack") && !prestate.IsTag("normalattack")))
        {
            animecontrol.SetInteger("attacktime", 1);
            slashnum = 0;
        }
        else if ((state.IsName("Base.groundattack.combo1.attack1") && state.normalizedTime < 0.7f) || (state.IsTag("blockback") && prestate.IsName("Base.groundattack.combo1.attack1")))
        {
            animecontrol.SetInteger("attacktime", 2);
            slashnum = 1;
        }
        else if ((state.IsName("Base.groundattack.combo1.attack2") && state.normalizedTime < 0.7f) || (state.IsTag("blockback") && prestate.IsName("Base.groundattack.combo1.attack2")))
        {
            animecontrol.SetInteger("attacktime", 3);
            slashnum = 2;
        }
        else if ((state.IsName("Base.groundattack.combo1.attack3") && state.normalizedTime < 0.7f) || (state.IsTag("blockback") && prestate.IsName("Base.groundattack.combo1.attack3")))
        {
            animecontrol.SetInteger("attacktime", 4);
            slashnum = 3;
        }
    }
    void HeavyAttack()
    {
        weapondisplay();
        resetmove();
        animecontrol.SetBool("attack", true);
        animecontrol.Play("heavyattack");
    }
    public void backweapon()
    {
        if(katana.activeSelf)
        {
            katana.SetActive(false);
            //backkatana.SetActive(true);
        }
    }
    void weapondisplay()
    {
        if (!katana.activeSelf)
        {
            katana.SetActive(true);
           // backkatana.SetActive(false);
        }
    }
}
