﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using Rewired;

public class chattack : MonoBehaviour
{
    Animator animecontrol;
    AnimatorStateInfo state;
    AnimatorStateInfo prestate;
    BattleManager self;
    int slashnum;
    GameObject enemy;
    public GameObject katana;
    public int playerID;
    public Player player;
    bool initialized = false;
    bool stingeffect;
    public GameObject backkatana;
    public bool collide = false;
    public GameObject pulseeffect;
    public bool hpattack;
    Vector3 targetposition;
   
    private void Awake()
    {
        animecontrol = GetComponent<Animator>();
        player = ReInput.players.GetPlayer(playerID);

    }
    // Use this for initialization
    void Start()
    {
        self = GetComponent<BattleManager>();
        stingeffect = false;
        katana.SetActive(false);
    }
    private void Initialize()
    {
        // Get the Rewired Player object for this player.
        player = ReInput.players.GetPlayer(playerID);

        initialized = true;
    }

    // Update is called once per frame
    void Update()
    {

        if(this.name=="sakura")
        {
            if (state.IsTag("normalattack"))
            {
                transform.position = Vector3.Lerp(transform.position, targetposition,0.5f);
            }
        }

        if (state.IsTag("guard"))
        {
            weapondisplay();
        }
        if(collide)
        {
            enemy.transform.LookAt(new Vector3(this.gameObject.transform.position.x,enemy.transform.position.y, this.gameObject.transform.position.z));
            collide = false;
        }
        if (!ReInput.isReady)
            return; // Exit if Rewired isn't ready. This would only happen during a script recompile in the editor.
        if (!initialized)
            Initialize(); // Reinitialize after a recompile in the editor
        if (enemy == null)
        {
            if (this.tag == "p1")
                enemy = GameObject.FindWithTag("p2");
            else
                enemy = GameObject.FindWithTag("p1");
        }
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (state.IsTag("normalattack"))
        {
            if (state.normalizedTime >= 1)
            { 
                animecontrol.SetBool("normalattack", false);
                animecontrol.SetInteger("attacktime", 0);
            }
        }
        if (state.IsTag("heavyattack"))
        {
            if (animecontrol.GetBool("heavyattack"))
                animecontrol.SetBool("heavyattack", false);
        }
        if (state.IsTag("heavyskill"))
        {
            if (animecontrol.GetBool("heavyskill"))
                animecontrol.SetBool("heavyskill", false);
        }

        if (state.IsTag("blocksuccess"))
        {
            if (animecontrol.GetBool("block"))
                animecontrol.SetBool("block", false);
        }

        if (state.IsTag("normalskill"))
        {
            if (this.name == "himeko")
            {
                transform.LookAt(enemy.transform);
                if (enemy != null)
                {
                    float distance = Vector3.Distance(transform.position, enemy.transform.position);
                    Vector3 diff = enemy.transform.position - transform.position;
                    float angle = Vector3.Angle(transform.forward, diff);
                    if (distance < 2 && angle <= 90)
                    {
                        if (!stingeffect)
                        {
                            stingeffect = true;
                            StartCoroutine(stinghit());

                        }
                    }
                }
                if (state.normalizedTime > 0.8f)
                    animecontrol.SetBool("normalskill", false);
            }
        }


        if (player.GetButtonDown("Fire") && !state.IsTag("mgethit") && !player.GetButton("Skill"))
        {
            // createtrail();
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }

            if (this.name == "himeko") HAttack();
            else SAttack();
        }
        if (player.GetButton("Burning"))
        {
            hpattack = true;
        }
        else
            hpattack = false;

        if (player.GetButtonDown("Fire") && !state.IsTag("mgethit") && player.GetButton("Skill"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }
            if (self.mp > self.mpExpense)
            {
                self.MPConsume();
                NormalSkill();
            }
        }
        if (player.GetButtonDown("Fire2") && !player.GetButton("Skill"))
        {
            if (!state.IsTag("mgethit") && !state.IsTag("heavyattack"))
            {
                if (enemy != null)
                {

                    transform.LookAt(enemy.transform);
                }

                HeavyAttack();
            }
        }
        if (player.GetButtonDown("Fire2") && !state.IsTag("mgethit") && player.GetButton("Skill"))
        {
            if (enemy != null)
            {

                transform.LookAt(enemy.transform);
            }
            if (self.mp > self.mpExpense)
            {
                self.MPConsume();
                HeavySkill();
            }
          
        }

        if (player.GetButtonDown("Block"))
        {
            if (!player.GetButton("Skill"))
            {
                if (!state.IsTag("mgethit") && !state.IsTag("holster") && !(state.IsTag("normalattack") && state.normalizedTime < 0.8f) && !(state.IsTag("heavyattack") && state.normalizedTime < 0.8f))
                {
                    if (enemy != null)
                    {

                        transform.LookAt(enemy.transform);
                    }
                    weapondisplay();
                    //animecontrol.Play("guard");
                    animecontrol.SetBool("guard", true);
                }
            }
            else
            {
                if (!state.IsTag("mgethit")&&!state.IsTag("block") && !state.IsTag("blocksuccess") && !state.IsTag("holster") && !(state.IsTag("normalattack") && state.normalizedTime < 0.8f) && !(state.IsTag("heavyattack") && state.normalizedTime < 0.8f))
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

        if (player.GetButtonDown("Dash"))
        {
            if (!state.IsTag("mgethit")&&!state.IsTag("holster")&&!(state.IsTag("normalattack")&&state.normalizedTime>0.3f))
            {

                if (state.IsTag("normalattack"))
                {
                    if (self.mp >= 15)
                    {
                        self.mp -= 15;
                        backweapon();
                        resetmove();
                        animecontrol.Play("dash");
                    }
                }
                else
                {
                    backweapon();
                    resetmove();
                    animecontrol.Play("dash");
                }
            }
        }
        if (!player.GetButton("Block") && state.IsTag("guard"))
        {
            resetmove();
            animecontrol.SetBool("guard", false);
        }

    }
    public void resetmove()
    {
        //backweapon();
        animecontrol.SetBool("normalattack", false);
        animecontrol.SetBool("heavyskill", false);
        animecontrol.SetBool("normalskill", false);
        animecontrol.SetBool("heavyattack", false);
        animecontrol.SetInteger("attacktime", 0);
    }
    void insstingeffect()
    {
        Vector3 waveposition = transform.position + new Vector3(0, 1, 0) - transform.forward * 0.5f;
        Instantiate(pulseeffect, waveposition, transform.rotation);
    }

    void HAttack()
    {
        //weapondisplay();
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
            GetComponent<CharacterController>().Move(transform.forward*0.5f);
            animecontrol.SetInteger("attacktime", 3);
            slashnum = 2;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack3"))
        {
            GetComponent<CharacterController>().Move(transform.forward*0.5f);
            animecontrol.SetInteger("attacktime", 4);
            slashnum = 3;
        }
    }
    void SAttack()
    {
        //weapondisplay();
        //speedback ();
        state = animecontrol.GetCurrentAnimatorStateInfo(0);
        if (!state.IsTag("normalattack"))
        {
            animecontrol.SetBool("normalattack", true);
            animecontrol.SetInteger("attacktime", 1);
            slashnum = 0;
            targetposition = transform.position;
            GetComponent<BattleManager>().combo = 1;
        }
        else if (state.IsName("Base.groundattack.normalattack.attack1"))
        {
            if (animecontrol.GetBool("normalattack"))
            {
                if (state.normalizedTime > 0.5f)
                {
                    animecontrol.SetInteger("attacktime", 2);
                    slashnum = 1;
                    GetComponent<BattleManager>().combo = 2;
                }
                else
                {
                    resetmove();
                }
            }
        }
        else if (state.IsName("Base.groundattack.normalattack.attack2"))
        {
           if (animecontrol.GetBool("normalattack"))
            {
                if (state.normalizedTime >=0.5f)
                {
                    animecontrol.SetInteger("attacktime", 3);
                    slashnum = 2;
                    GetComponent<BattleManager>().combo = 3;
                }
                else
                {
                    resetmove();
                }
            }
        }
        else if (state.IsName("Base.groundattack.normalattack.attack3"))
        {
            if (animecontrol.GetBool("normalattack"))
            {
                if (state.normalizedTime > 0.6f)
                {

                    animecontrol.SetInteger("attacktime", 4);
                    slashnum = 3;
                    GetComponent<BattleManager>().combo = 4;
                }
                else
                {
                    resetmove();
                }
           }
        }
    }
    void attackdash()
    {
        float dis = Vector3.Distance(transform.position,enemy.transform.position);
        if(dis<GetComponent<collisiondetect>().attackdistance+4)
        {
            if(dis< GetComponent<collisiondetect>().attackdistance-1)
            {
                targetposition = transform.position;
            }
             else
            targetposition = transform.position + transform.forward * (dis-GetComponent<collisiondetect>().attackdistance+2f);
        }
        else
        targetposition = transform.position + transform.forward * 4;
    }
    void HeavySkill()
    {
        animecontrol.SetBool("heavyskill", true);
    }
    void NormalSkill()
    {
        if (!state.IsTag("normalskill") && !state.IsTag("normalskillstart")&&!state.IsTag("holster")&&!state.IsTag("heavyskill")&&!state.IsTag("heavyattack"))
        {
            stingeffect = false;
            animecontrol.Play("normalskillstart");
            animecontrol.SetBool("normalskill", true);
        }
    }
    void DashSkill()
    {
        animecontrol.SetBool("dashskill", true);
    }
    void HeavyAttack()
    {
        animecontrol.SetBool("heavyattack", true);
    }
    public void backweapon()
    {
            if (katana.activeSelf)
            {
                katana.SetActive(false);
                //backkatana.SetActive(true);
            }
            if (backkatana != null)
            {
                backkatana.SetActive(true);
            }
            //Instantiate(backeffect, katana.transform.position, Quaternion.identity);

    }
   public void weapondisplay()
    {
        if (!katana.activeSelf)
        {
            katana.SetActive(true);
            // backkatana.SetActive(false);
        }
        if (backkatana != null)
        {
            backkatana.SetActive(false);
        }
       // createtrail();
    }
    void createtrail()
    {
        GetComponent<MeleeWeaponTrail>().restarttrail();
    }
    IEnumerator stinghit()
    {
        animecontrol.speed = 0;
        for(int i=0;i<3;i++)
        {
            yield return new WaitForSeconds(0.15f);
            enemy.GetComponent<chgethit>().getattacknormal();
        }
        animecontrol.speed = 1;
        animecontrol.SetBool("normalskill", false);
        yield return null;
    }
}
