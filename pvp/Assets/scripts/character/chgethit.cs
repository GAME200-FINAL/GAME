using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
public class chgethit : MonoBehaviour {
    Animator animecontrol;
    GameObject enemy;
    AnimatorStateInfo chstate;
    public int p;
    float hp;
    float brave;
    bool die;
    public GameObject bloodprefab;
    public Transform bloodpos;
    BattleManager self;
    public Text result;
    // Use this for initialization
    private void Awake()
    {
        self = GetComponent<BattleManager>();
        if (p == 1)
            this.tag = "p1";
        else
            this.tag = "p2";
    }
    void Start () {
        if (enemy == null)
        {
            if (this.tag == "p1")
                enemy = GameObject.FindWithTag("p2");
            else
                enemy = GameObject.FindWithTag("p1");
        }
        hp = 100;
        animecontrol = GetComponent<Animator>();
    }
	
	// Update is called once per frame
	void Update () {
      
        chstate = animecontrol.GetCurrentAnimatorStateInfo(0);
        
    }
    public void getattacknormal()
    {
       // transform.LookAt(enemy.transform);
        if (!(chstate.IsTag("dodge")&&chstate.normalizedTime<0.5f)&&!chstate.IsTag("guard")&&!chstate.IsTag("blocksuccuss"))
        {
            if (chstate.IsTag("block")&&chstate.normalizedTime<0.5f)
            {
                animecontrol.SetBool("block", true);
                GetComponent<collisiondetect>().pausetime(0.2f);
            }
            else
            {
               GetComponent<chattack>().resetmove();
               GetComponent<chattack>().backweapon();
                if (self.hp > 0)
                {
                    Instantiate(bloodprefab, bloodpos.position, bloodprefab.transform.rotation);
                    if (!chstate.IsName("Base.gethit.mgethit"))
                       animecontrol.Play("mgethit");
                   else
                       animecontrol.Play("mgethit1");
                       self.BRVDecrease(1);
                    if (enemy.GetComponent<chattack>().hpattack)
                    {
                        self.HealthDmg();
                    }
                    {
                        enemy.GetComponent<BattleManager>().BRVIncrease(1);
                        enemy.GetComponent<BattleManager>().MPRecover(1);
                    }
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
    }
    public void getattackheavynormal()
    {
        // transform.LookAt(enemy.transform);
        if (!(chstate.IsTag("dodge") && chstate.normalizedTime < 0.5f) && !chstate.IsTag("guard") && !chstate.IsTag("blocksuccuss"))
        {
            if (chstate.IsTag("block") && chstate.normalizedTime < 0.5f)
            {
                animecontrol.SetBool("block", true);
                GetComponent<collisiondetect>().pausetime(0.2f);
            }
            else
            {
                GetComponent<chattack>().resetmove();
                GetComponent<chattack>().backweapon();
                if (self.hp > 0)
                {
                    Instantiate(bloodprefab, bloodpos.position, bloodprefab.transform.rotation);
                    animecontrol.Play("gethitback");
                    self.BRVDecrease(1);
                    if (enemy.GetComponent<chattack>().hpattack)
                    {
                        self.HealthDmg();
                    }
                    {
                        enemy.GetComponent<BattleManager>().BRVIncrease(1);
                        enemy.GetComponent<BattleManager>().MPRecover(1);
                    }
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
    }
    public void getattackheavy()
    {
        if (chstate.IsTag("block") && chstate.normalizedTime < 0.5f)
        {
            animecontrol.SetBool("block", true);
            enemy.GetComponent<Animator>().speed = 0;
            GetComponent<collisiondetect>().pausetime(0.2f);
        }
        else if(!chstate.IsTag("blocksuccess"))
        {
            chstate = this.GetComponent<Animator>().GetCurrentAnimatorStateInfo(0);
            GetComponent<chattack>().resetmove();
            GetComponent<chattack>().backweapon();
                if (self.hp > 0)
                {
                if (enemy.GetComponent<chattack>().hpattack)
                {
                    self.HealthDmg();
                }
                else
                {
                    if (chstate.IsTag("guard"))
                    {
                        animecontrol.Play("gethitback");
                        self.BRVDecrease(1.5f);
                        enemy.GetComponent<BattleManager>().BRVIncrease(1.5f);
                        enemy.GetComponent<BattleManager>().MPRecover(1.4f);
                    }
                    else
                    {
                        animecontrol.Play("gethitback");
                        self.BRVDecrease(1.2f);
                        enemy.GetComponent<BattleManager>().BRVIncrease(1.2f);
                        enemy.GetComponent<BattleManager>().MPRecover(1.2f);
                    }
                }

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
    public void getblock()
    {
         if (self.hp > 0)
            {

                animecontrol.Play("gethitback");
                self.BRVDecrease(1.5f);
                enemy.GetComponent<BattleManager>().BRVIncrease(1.5f);
                enemy.GetComponent<BattleManager>().MPRecover(1.4f);
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
    void godie()
    {
        GetComponent<chmove>().enabled = false;
        GetComponent<chattack>().enabled = false;
        Time.timeScale = 0.2f;
        animecontrol.Play("die");
        if(this.name=="himeko")
        {
            result.text = " Sakura Win ";
        }
        else
        {
            result.text = " Himeko Win";
        }
    }
    
}
