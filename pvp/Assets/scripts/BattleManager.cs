using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BattleManager : MonoBehaviour
{
    GameObject enemycharacter;
    BattleManager enemy;
    public float hp;
    public Slider hpStrip;
    public float brv;
    public Slider brvStrip;
    public float attackvalue;
    
	public float mp;
	public Slider mpStrip;
    public Image fill;
	public float mpExpense;
    public GameObject breakEffect;

    
    public int combo;
    float damage = 10;
    float slidebp;
    float slidehp;
    float slidemp;
    public bool brvbreak=false;
    Color clr;
    bool breakpause = false;
    SoundManager soundManager;

	void Start(){
            combo=1;
            if (this.tag == "p1")
                enemycharacter= GameObject.FindWithTag("p2");
            else
                enemycharacter = GameObject.FindWithTag("p1");

        enemy =enemycharacter.GetComponent<BattleManager>();
        soundManager=GameObject.Find("SoundManager").GetComponent<SoundManager>();
	}
    private void Update()
    {
        if(brv<=0)
        {
            if(!brvbreak)
            brvbreak=true;
            if (!breakpause)
            {
                StartCoroutine(soundManager.LoadAudio("break.wav",1,0.5f,1,0,false));
                GetComponent<collisiondetect>().pausetime(0.3f);
                breakpause = true;
            }
            breakEffect.GetComponent<Animator>().Play("break");
        }
        if(brvbreak)
          {
              if(brv<100)
              {
                 brv += 10*Time.deltaTime;
                 breakEffect.SetActive(true);
                 //clr.a=100;
                 //fill.color=clr;
              }
              else {
                  breakpause = false;
                  brvbreak=false;
                  breakEffect.SetActive(false);
                 // clr.a=255;
                 // fill.color=clr;
              }
			brvStrip.value = brv;
          }
        slidebp = Mathf.Lerp(slidebp, brv, 0.1f);
        brvStrip.value = slidebp;
        slidemp = Mathf.Lerp(slidemp, mp, 0.1f);
        mpStrip.value = slidemp;
        slidehp = Mathf.Lerp(slidehp, hp, 0.1f);
        hpStrip.value = slidehp;
        MPDropTime();

    }


    /*public void HPDamage(float damage){
        if (hp > 0) {
		    hp -= damage * Time.deltaTime * timeScale;
			hpStrip.value = hp;
		}
    } */


    public void HealthDmg ()
	{
		if (hp > 0 ) {
            if (enemy.GetComponent<BattleManager>().mp > 10)
            {
            enemy.GetComponent<BattleManager>().mp -= 10;
            if(enemy.brv > brv)
            {
                if (brvbreak) hp -= enemy.brv*1.4f+20;
                else hp -= (enemy.brv - brv)*1.2f+20;
            }
            else
                hp -=20;
            hpStrip.value = hp;
            }
          
		}
	}


    public void BRVDecrease(float baseAtk){
       // Debug.Log("gethit");
          if (brv > 0) {
		    damage += damage * combo / 10;
           if(!brvbreak) brv -= damage * baseAtk*enemy.GetComponent<BattleManager>().attackvalue;
			//damage /= baseAtk;
			damage -= damage * combo / 10;
		}
    }


    public void BRVIncrease(float baseAtk)
    {
          if (brv < brvStrip.maxValue) {
              if(!brvbreak)
              {
		      damage += damage * combo / 10;
              brv += damage * baseAtk*attackvalue;
			  brvStrip.value = brv;
			//damage /= baseAtk;
			  damage -= damage * combo / 10;
              }
		}
    }


	public void MPConsume ()
	{
		if (mp > 0) {
            mp -= mpExpense*1.5f;
			mpStrip.value = mp;
		}
	}


	public void MPDropTime ()
	{
		if (mp>0) {
            mp -= mpExpense*Time.deltaTime*0.2f;
			mpStrip.value = mp;
		}

	}


	public void MPRecover (float rscale)
	{
		if (mp <= mpStrip.maxValue) {
            mp += mpExpense*rscale;
			mpStrip.value = mp;
		}
	}

}