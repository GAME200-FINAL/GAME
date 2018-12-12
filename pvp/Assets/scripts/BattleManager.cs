using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BattleManager : MonoBehaviour
{
    public BattleManager enemy;
    public float hp;
    public Slider hpStrip;
    public float brv;
    public Slider brvStrip;
    public float timeScale;
    
	public float mp;
	public Slider mpStrip;
	public float mpExpense;
	public float attackScale;
	public float mpTimeScale;
	public float recoverScale;

    public int combo;


	void Start(){
		enemy=GetComponent<BattleManager>();
	}


    /*public void HPDamage(float damage){
        if (hp > 0) {
		    hp -= damage * Time.deltaTime * timeScale;
			hpStrip.value = hp;
		}
    } */


	bool HealthDmg ()
	{
		if (hp > 0 && enemy.brv > brv) {
			hp-=enemy.brv-brv;
			hpStrip.value = hp;
            return true;
		}
        return false;
	}


    public void BRVDecrease(float damage, float baseAtk){
          if (brv > 0) {
		    damage += damage * combo / 10;
			brv -= damage * baseAtk;
			hpStrip.value = brv;
			//damage /= baseAtk;
			damage -= damage * combo / 10;
		}
    }


    public void BRVIncrease(float damage, float baseAtk){
          if (brv < brvStrip.maxValue) {
		    damage += damage * combo / 10;
			brv += damage * baseAtk;
			hpStrip.value = brv;
			//damage /= baseAtk;
			damage -= damage * combo / 10;
		}
    }


	public void MPConseme ()
	{
		if (mp > 0) {
		    mp -= mpExpense * Time.deltaTime * attackScale;
			mpStrip.value = mp;
		}
	}


	public void MPDropTime ()
	{
		if (mp>0) {
			mp -= mpExpense * Time.deltaTime * timeScale;
			mpStrip.value = mp;
		}

	}


	public void MPRecover ()
	{
		if (mp <= mpStrip.maxValue) {
			mp += mpExpense * Time.deltaTime * recoverScale;
			mpStrip.value = mp;
		}
	}

}