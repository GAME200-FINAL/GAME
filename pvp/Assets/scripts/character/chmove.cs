using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using Rewired;


public class chmove : MonoBehaviour 

{
     Animator maincontrol;
     AnimatorStateInfo state;
     Vector3 move=Vector3.zero;
	 public AudioClip runsound;
    //  float turnspeed = 120f;
    //  float jumpspeed = 0f;
      float runspeed = 5f;
     // float gravity = 10f;
      int jumpcount ;
      float margin = 0.1f;
      //float jumptime;
	  int movestate;
	  float lastmovetime;
	  float lastkeycode=0;
	public  AudioSource footaudio;
	 CharacterController controller;
	 float baseheight;
	 int clothnum;
	float fallspeed;
	Scene currentscene;
	float currentspeed;
	float refcurrentspeed;
	float targetspeed;
	float falltime;
	RaycastHit hitguai;
	Vector3 updirection;
	public GameObject jumpeffect;
    float tofall;
    GameObject direction;
    public int playerID;
    public Player player;
    bool initialized = false;

    //public GameObject ground;
    private void Initialize()
    {
        // Get the Rewired Player object for this player.
        player = ReInput.players.GetPlayer(playerID);

        initialized = true;
    }

    public bool isGrounded()
	{
		return(Physics.Raycast (transform.position+new Vector3(0,1,0), -Vector3.up,1.3f,1<<8));
	}

    // Use this for initialization
    private void Awake()
    {
        player = ReInput.players.GetPlayer(playerID);
    }
    void Start () 
    {
        
        direction = GameObject.Find("direction");
		Vector3 updirection = GameObject.Find("direction").transform.up;
		updirection.z = 0;
		updirection.x = 0;
		jumpcount = 0;
		footaudio = this.gameObject.AddComponent<AudioSource> ();

       // gameObject.transform.position = new Vector3(0, 0, 100);
        controller = GetComponent<CharacterController>();
        maincontrol = GetComponent<Animator>();
       // state = maincontrol.GetCurrentAnimatorStateInfo(0);
		lastkeycode = 0;
		controller = this.GetComponent<CharacterController> ();
		if(controller!=null)baseheight = controller.height;
		currentscene = SceneManager.GetActiveScene ();
		currentspeed = 0;
		targetspeed = 1;
	}

    // Update is called once per frame
    void Update()
    {
        if (!ReInput.isReady)
            return; // Exit if Rewired isn't ready. This would only happen during a script recompile in the editor.
        if (!initialized)
            Initialize(); // Reinitialize after a recompile in the editor
        //Debug.Log (isGrounded ());
        if (state.IsTag("idle"))
            transform.rotation = Quaternion.FromToRotation(Vector3.up, updirection) * transform.rotation;
        if (isGrounded())
            jumpcount = 0;
        //Debug.Log (movestate);
        state = maincontrol.GetCurrentAnimatorStateInfo(0);
        if (Input.GetKeyDown("left shift") && !state.IsTag("dodge"))
        {
            if (isGrounded())
            {
                maincontrol.Play("dodge");
                maincontrol.speed = 1;
            }
            // transform.Translate(transform.forward*2f,Space.World);
        }
        if (state.IsTag("run"))
        {
            //transform.Translate (Vector3.forward * 10 * Time.deltaTime);
            controller.Move(transform.forward * currentspeed*4 * Time.deltaTime);
        }
        if (player.GetAxis("Move Horizontal")!=0||player.GetAxis("Move Vertical")!=0)
        {
            targetspeed = 2;
            if (!state.IsTag("attack") && !state.IsTag("normalattack") && !state.IsTag("airattack"))
            {
                if (!state.IsTag("dodge"))
                {
                        maincontrol.SetBool("running", true);
                
                }
                currentspeed = Mathf.SmoothDamp(currentspeed, targetspeed, ref refcurrentspeed, 0.15f);
                maincontrol.SetFloat("runspeed", currentspeed);
            }
            Vector3 forward,right,targetDirection;
            Quaternion targetRotation;
            forward = Camera.main.transform.forward;
            forward.y = 0;
            forward = forward.normalized;
            right = Camera.main.transform.right;
            right.y = 0;
            targetDirection = forward * player.GetAxis("Move Vertical") + right * player.GetAxis("Move Horizontal");
            targetRotation = Quaternion.LookRotation(targetDirection, Vector3.up);
            transform.rotation = Quaternion.Slerp(transform.rotation, targetRotation, 0.5f);
            if (state.IsTag("idle") || state.IsTag("fall"))
                transform.rotation = Quaternion.FromToRotation(Vector3.up, updirection) * transform.rotation;
            if (state.IsTag("jump"))
            {
                controller.Move(targetDirection * runspeed * Time.deltaTime);
            }
        }
        else
        {
            currentspeed = Mathf.SmoothDamp(currentspeed, 0, ref refcurrentspeed, 0.15f);
            maincontrol.SetFloat("runspeed", currentspeed);
        }
        if (currentspeed <= 0.01f)
        {
            maincontrol.SetBool("running", false);
        }
    }
	void playrunsound()
	{
		footaudio.volume = 0.05f;
		footaudio.clip = runsound;
		footaudio.Play ();
	}


}

