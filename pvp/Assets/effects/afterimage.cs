﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class afterimage: MonoBehaviour {
	public SkinnedMeshRenderer[] wangge;
	public Material[] chaizhi;
	public Vector3 buzheng = Vector3.zero;
	public Vector3 cposition;

	public float xiaosanshij = 0.3f;
	public float shichang = 1f;
	public float jiange = 0.02f;
	public void jihuo ()
	{
			for (int i = 0; i < wangge.Length; i++) {
				StartCoroutine (shengcheng (wangge [i]));
		}
	}
	IEnumerator shengcheng(SkinnedMeshRenderer zujian){
		int l = (int)(shichang/jiange);
		for (int i = 0; i < l; i++) {
			GameObject c = chuxian (zujian);
			StartCoroutine (xiaosan(c.GetComponent<MeshFilter>()));
			yield return new WaitForSeconds (jiange);
		}
	}
	IEnumerator xiaosan (MeshFilter shuru){
		Mesh s = shuru.sharedMesh;
		Color[] c = new Color[s.vertices.Length];
		float t = xiaosanshij;
		while (t > 0) {
			t -= Time.deltaTime;
			float u = t / xiaosanshij;
			for (int i = 0; i < c.Length; i++) {
				
				c [i] = new Color (u,u,u,1);
			}
			s.colors = c;
			shuru.sharedMesh = s;

			yield return new WaitForEndOfFrame ();
		}
		Destroy (shuru.gameObject);
	}
	public GameObject chuxian(SkinnedMeshRenderer zhujian)
	{
		Mesh s = new Mesh ();
		GameObject ying = new GameObject ("ying");
		MeshFilter lujing = ying.AddComponent<MeshFilter>();
		zhujian.BakeMesh (s);
		lujing .sharedMesh = s;
		MeshRenderer xuanran = ying.AddComponent<MeshRenderer> ();
		xuanran.sharedMaterials= chaizhi;
		ying.transform.position = transform.position + cposition;
		ying.transform.localEulerAngles = transform.localEulerAngles + buzheng;
		//ying.transform.localScale = new Vector3(0.6f,0.6f,0.6f);
		return ying;
	}
}
