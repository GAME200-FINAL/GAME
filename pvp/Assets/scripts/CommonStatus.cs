using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class CommonStatus : MonoBehaviour
{
	public Slider HPStrip;
	public float Atk;
	public int Combo;
	public float hp;

	private BattleManager battleManager;
	private SoundManager soundManager;

	void Awake ()
	{
		//battleManager = GameObject.Find ("BattleManager").GetComponent<BattleManager> ();
		//soundManager = GetComponent<SoundManager> ();
	}

	public void HealthDmg (float damage, float multiplier)
	{
		if (hp > 0) {
			damage += damage * Combo / 100;
			hp -= damage * multiplier;
			HPStrip.value = hp;
			damage /= multiplier;
			damage -= damage * Combo / 100;
		}
	}

	public void HPRecover ()
	{
		if (hp <= HPStrip.maxValue) {
			hp += 20 * Time.deltaTime;
			HPStrip.value = hp;
		}

	}
}
