using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;


public class CameraFollow : MonoBehaviour
{
   Transform Target;

	public float DistanceH = 3F;  
	public float DistanceV=1.5f;
	public float DistanceHH;
	private float SpeedX=100;  
	private float SpeedY=10;  
	private float  MinLimitY = 5;  
	private float  MaxLimitY = 90;  

	private float mX = 0.0F;  
	private float mY = 0.0F;  

	private float MaxDistance=100;  
	private float MinDistance=0.2F;  

	public bool isNeedDamping=true;  
	public float Damping=0.7F;  
	public bool attackfeel;
	public Transform targetposition;
	public Vector3 mcurpos;
	public Vector3 shakepos;
	public bool percussion;
	//public GameObject backsword;
	GameObject main;
	Scene currentscene;
	GameObject canvas;
	Vector3 mPosition;
	Quaternion mRotation;
	public float cameraro;

	void Awake()
	{
	}
	void Start()
	{
       
	}

    void Update()
    {
        if (main == null)
        {
            main = GameObject.FindWithTag("p1");
            Target = main.transform.Find("realpos").transform;
        }
       else
        {
            DistanceH = Mathf.Clamp(DistanceH, MinDistance, MaxDistance);
            mRotation = Quaternion.Euler(cameraro + mY, mX, 0);
            if (main.GetComponent<chmove>().isGrounded())
                mPosition = mRotation * new Vector3(DistanceHH, DistanceV, -DistanceH) + Target.position;
            else
            {
                mPosition = mRotation * new Vector3(DistanceHH, 3f, -DistanceH + 1f) + Target.position;
            }
            //Vector3 mPosition =  new Vector3(0.0F, DistanceV, -DistanceH) + Target.position;

            if (!attackfeel && !percussion)
            {
                if (isNeedDamping) {
                    //transform.rotation = Quaternion.Lerp(transform.rotation, mRotation, Time.deltaTime * Damping);
                    transform.position = Vector3.Slerp(transform.position, mPosition, 0.2f);
                    transform.rotation = Quaternion.Slerp(transform.rotation, mRotation, 0.1f);
                } else {
                    transform.rotation = mRotation;
                    transform.position = mPosition;
                }
            }

            if (percussion) {
                float upextent = Random.Range(-0.2f, 0.2f);
                transform.position = transform.position += new Vector3(0, upextent, 0);

            }
            if (attackfeel) {
                //Debug.Log ("shake");
                Camera.main.transform.position = shakepos;

            }
        }
    }

}



  