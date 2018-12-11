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
        if(state.IsTag("normalattack"))
        {
            if(state.normalizedTime>=1)
            {
                animecontrol.SetBool("normalattack", false);
                animecontrol.SetInteger("attacktime", 0);
            }
        }
        if(state.IsTag("heavyattack"))
        {
            if (animecontrol.GetBool("heavyattack"))
                animecontrol.SetBool("heavyattack", false);
        }
        if (state.IsTag("heavyskill"))
        {
            if (animecontrol.GetBool("heavyskill"))
                animecontrol.SetBool("heavyskill", false);
        }
        if (state.IsTag("normalskill"))
        {
            if (animecontrol.GetBool("heavyskill"))
                animecontrol.SetBool("normalskill", false);
        }
        if (state.IsTag("blocksuccess"))
        {
            if(animecontrol.GetBool("block"))
            animecontrol.SetBool("block", false);
        }

        if (player.GetButtonDown("Fire")&&!state.IsTag("mgethit")&&!player.GetButton("Skill"))
        {
                if (enemy != null)
                {
        
                    transform.LookAt(enemy.transform);
                }

            if (this.name == "himeko") SAttack();
            else SAttack();
        }

        if (player.GetButtonDown("Fire2") && !state.IsTag("mgethit") &&player.GetButton("Skill"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }

            HeavySkill();
        }
        if (player.GetButtonDown("Fire") && !state.IsTag("mgethit") && player.GetButton("Skill"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }

            NormalSkill();
        }


        if (player.GetButtonDown("Block") )
        {
            if (!player.GetButton("Skill"))
            {
                if (!state.IsTag("mgethit") && !(state.IsTag("normalattack") && state.normalizedTime < 0.8f) && !(state.IsTag("heavyattack") && state.normalizedTime < 0.8f))
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
            else
            {
                if (!state.IsTag("mgethit") && !(state.IsTag("normalattack") && state.normalizedTime < 0.8f) && !(state.IsTag("heavyattack") && state.normalizedTime < 0.8f))
                {
                    if (enemy != null)
                    {

                        transform.LookAt(enemy.transform);
                    }
                    weapondisplay();
                    animecontrol.Play("block");
                }
            }
        }
        if(player.GetButtonDown("Fire2")&&!player.GetButton("Skill"))
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
        if(player.GetButtonDown("Dash"))
        {
            resetmove();
            animecontrol.Play("dash");
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
        animecontrol.SetBool("normalattack", false);
        animecontrol.SetBool("heavyskill", false);
        animecontrol.SetBool("normalskill", false);
        animecontrol.SetBool("heavyattack", false);
        animecontrol.SetInteger("attacktime", 0);
    }
    void HAttack()
    {
        weapondisplay();
        //speedback ();
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (!state.IsTag("normalattack"))
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
    void SAttack()
    {
        weapondisplay();
        //speedback ();
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (!state.IsTag("normalattack"))
        {
            animecontrol.SetBool("normalattack", true);
            animecontrol.SetInteger("attacktime", 1);
            slashnum = 0;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack1"))
        {
            if (state.normalizedTime > 0.6f)
            {
                animecontrol.SetInteger("attacktime", 2);
                slashnum = 1;
            }
            else
            {
                resetmove();
            }
        }
        else if (state.IsName("Base.groundattack.normalattack.attack2"))
        {
            if (state.normalizedTime > 0.6f)
            {
                animecontrol.SetInteger("attacktime", 3);
                slashnum = 2;
            }
            else
            {
                resetmove();
            }
        }
        else if (state.IsName("Base.groundattack.normalattack.attack3"))
        {
            if (state.normalizedTime > 0.6f)
            {
                animecontrol.SetInteger("attacktime", 4);
                slashnum = 3;
            }
            else
            {
                resetmove();
            }
        }
    }
    void HeavySkill()
    {
        animecontrol.SetBool("heavyskill", true);
    }
    void NormalSkill()
    {
        animecontrol.SetBool("normalskill", true);
    }
    void DashSkill()
    {
        animecontrol.SetBool("dashskill", true);
    }
    void HeavyAttack()
    {
        animecontrol.SetBool("heavyattack",true);
    }
    public void backweapon()
    {
        if (state.IsTag("idle"))
        {
            if (katana.activeSelf)
            {
                katana.SetActive(false);
                //backkatana.SetActive(true);
            }
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
