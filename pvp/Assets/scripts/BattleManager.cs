using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class BattleManager : MonoBehaviour
{
    public GameObject enemy;
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


    /*public void HPDamage(float damage){
        if (hp > 0) {
		    hp -= damage * Time.deltaTime * timeScale;
			hpStrip.value = hp;
		}
    } */


	bool HealthDmg (float damage, float baseAtk)
	{
		if (hp > 0) {
			damage += damage * combo / 100;
			hp -= damage * baseAtk;
			hpStrip.value = hp;
			damage /= baseAtk;
			damage -= damage * combo / 100;
            return true;
		}
        return false;
	}


    public void BRVDecrease(float damage){
          if (brv > 0) {
		    brv -= damage * Time.deltaTime * timeScale;
			hpStrip.value = brv;
		}
    }


    public void BRVIncrease(float damage){
          if (brv < brvStrip.maxValue) {
		    brv += damage * Time.deltaTime * timeScale;
			hpStrip.value = brv;
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