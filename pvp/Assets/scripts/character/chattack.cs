using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;

public class chattack : MonoBehaviour {
    Animator animecontrol;
    AnimatorStateInfo state;
    AnimatorStateInfo prestate;
    int slashnum;
    GameObject enemy;
    public GameObject katana;
    public int playerID;
    public Player player;
    bool initialized = false;
    private void Awake()
    {
        animecontrol = GetComponent<Animator>();
        player = ReInput.players.GetPlayer(playerID);

    }
    // Use this for initialization
    void Start () {
      
    }
    private void Initialize()
    {
        // Get the Rewired Player object for this player.
        player = ReInput.players.GetPlayer(playerID);

        initialized = true;
    }

    // Update is called once per frame
    void Update ()
    {
        if (!ReInput.isReady)
            return; // Exit if Rewired isn't ready. This would only happen during a script recompile in the editor.
        if (!initialized)
            Initialize(); // Reinitialize after a recompile in the editor
        if(enemy==null)
         {
            if (this.tag == "p1")
                enemy = GameObject.FindWithTag("p2");
            else
                enemy = GameObject.FindWithTag("p1");
         }
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if(state.IsTag("normalattack")&&state.normalizedTime>=1)
        {
            if(state.normalizedTime>=1)
            {
                animecontrol.SetInteger("attacktime", 0);
            }
        }
        if(state.IsTag("heavyattack"))
        {
            animecontrol.SetBool("heavyattack", false);
        }
        
        if (player.GetButtonDown("Fire")&&!state.IsTag("mgethit"))
        {
                if (enemy != null)
                {
        
                    transform.LookAt(enemy.transform);
                }

                Attack();
        }

        if (player.GetButtonDown("Block") )
        {
            if (!state.IsTag("mgethit") && !(state.IsTag("normalattack")&&state.normalizedTime<0.8f) && !(state.IsTag("heavyattack")&&state.normalizedTime<0.8f))
            {
                if (enemy != null)
                {

                    transform.LookAt(enemy.transform);
                }
                weapondisplay();
                animecontrol.Play("guard");
                animecontrol.SetBool("guard", true);
            }
        }
        if(player.GetButtonDown("Fire2"))
        {
            if (!state.IsTag("mgethit")&& !state.IsTag("heavyattack"))
            {
                if (enemy != null)
                {

                    transform.LookAt(enemy.transform);
                }

                HeavyAttack();
            }
        }
        if(!player.GetButton("Block")&&state.IsTag("guard"))
        {
            resetmove();
            animecontrol.SetBool("guard", false);
        }
    }
    public void resetmove()
    {
       // backweapon();
        animecontrol.SetBool("heavyattack", false);
        animecontrol.SetInteger("attacktime", 0);
    }
    void Attack()
    {
        weapondisplay();
        //speedback ();
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (!state.IsTag("attack") && !state.IsTag("normalattack"))
        {
            animecontrol.SetInteger("attacktime", 1);
            slashnum = 0;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack1"))
        {
            animecontrol.SetInteger("attacktime", 2);
            slashnum = 1;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack2"))
        {
            animecontrol.SetInteger("attacktime", 3);
            slashnum = 2;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack3"))
        {
            animecontrol.SetInteger("attacktime", 4);
            slashnum = 3;
        }
    }
    void HeavyAttack()
    {
        weapondisplay();
        animecontrol.SetBool("heavyattack",true);
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
