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
    bool brvbreak=false;
    Color clr;
    

	void Start(){
    
            if (this.tag == "p1")
                enemycharacter= GameObject.FindWithTag("p2");
            else
                enemycharacter = GameObject.FindWithTag("p1");

        enemy =enemycharacter.GetComponent<BattleManager>();
	}
    private void Update()
    {
        if(brv<=0)
        {
            if(!brvbreak)
            brvbreak=true;
        }
        if(brvbreak)
          {
              if(brv<100)
              {
                 brv += 10*Time.deltaTime;
                 breakEffect.SetActive(true);
                 clr.a=100;
                 fill.color=clr;
              }
              else {
                  brvbreak=false;
                  breakEffect.SetActive(false);
                  clr.a=255;
                  fill.color=clr;
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
		if (hp > 0 && enemy.brv > brv) {
            if (enemy.GetComponent<BattleManager>().mp > 10)
            {
                enemy.GetComponent<BattleManager>().mp -= 10;
                if (brvbreak) hp -= enemy.brv;
                else hp -= (enemy.brv - brv);
                hpStrip.value = hp;
            }
          
		}
	}


    public void BRVDecrease(float baseAtk){
        Debug.Log("gethit");
          if (brv > 0) {
		    damage += damage * combo / 10;
           if(!brvbreak) brv -= damage * baseAtk*attackvalue;
			//damage /= baseAtk;
			damage -= damage * combo / 10;
		}
    }


    public void BRVIncrease(float baseAtk)
    {
          if (brv < brvStrip.maxValue) {
		    damage += damage * combo / 10;
            brv += damage * baseAtk*attackvalue;
			brvStrip.value = brv;
			//damage /= baseAtk;
			damage -= damage * combo / 10;
		}
    }

    void BRVRecover()
    {
          if(brvbreak)
          {
              if(brv<100)
              {
                 brv += 20*Time.deltaTime;
              }
              else 
              brvbreak=false;
			brvStrip.value = brv;
          }
			//damage /= baseAtk;
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
            mp -= mpExpense*Time.deltaTime*0.1f;
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