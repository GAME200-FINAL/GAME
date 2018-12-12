using UnityEngine;
using System.Collections;
using UnityEngine.UI;
public class iktest2 : MonoBehaviour
{
	
	AnimatorStateInfo info;
	public Transform leftfoot;
	public Transform rightfoot;
	Vector3 lpos;
	Vector3 rpos;
	Vector3 lfpos,rfpos;
    float leftweight, rightweight;
	RaycastHit hitleft,hitright;
	private Animator animator;
	void Start()
	{
		animator = this.GetComponent<Animator>();
		//leftfoot = animator.GetBoneTransform (HumanBodyBones.LeftFoot);
		//rightfoot = animator.GetBoneTransform (HumanBodyBones.RightFoot);
	}

	void Update()
	{
        info = animator.GetCurrentAnimatorStateInfo(0);
        
    }
	void OnAnimatorIK()
	{
        if (info.IsTag("normalattack")|| info.IsTag("heavyattack")||info.IsTag("dash"))
        {
            leftweight = animator.GetFloat("leftweight");
            rightweight = animator.GetFloat("rightweight");
            lpos = leftfoot.position;
            rpos = rightfoot.position;
            if (Physics.Raycast(lpos, -Vector3.up, out hitleft, 3f, 1 << 8))
            {
                lfpos = hitleft.point;
            }
            if (Physics.Raycast(rpos, -Vector3.up, out hitright, 3f, 1 << 8))
            {
                rfpos = hitright.point;
            }
            if (info.IsName("Base.groundattack.normalattack.attack4"))
            {
                animator.SetIKPosition(AvatarIKGoal.RightFoot, rfpos);
                animator.SetIKPositionWeight(AvatarIKGoal.RightFoot, 1);
            }
            else
            {
                animator.SetIKPosition(AvatarIKGoal.LeftFoot, lfpos);
                animator.SetIKPositionWeight(AvatarIKGoal.LeftFoot, 1);
                animator.SetIKPosition(AvatarIKGoal.RightFoot, rfpos);
                animator.SetIKPositionWeight(AvatarIKGoal.RightFoot, 1);
            }
        }
    }

}
