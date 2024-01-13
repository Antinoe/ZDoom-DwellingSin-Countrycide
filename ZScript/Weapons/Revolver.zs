
Class Revolver : SinWeapon replaces Pistol{
	Default{
		Inventory.Icon "HGUNC0";
		Scale 0.75;
		Tag "Revolver";
		AttackSound "weapons/pistol";
		Inventory.Amount 6;
		Inventory.MaxAmount 6;
		Inventory.PickupMessage "You got the revolver!";
		SinItem.Description "Standard-issue revolver.";
		SinWeapon.AmmoType "Pistol";
		SinWeapon.AmmoLoaded "BulletClip";
		SinWeapon.FireType FIRE_AUTO;
		SinWeapon.ReloadType RELOAD_BOTTOM;
		SinWeapon.FireMode1 1,4;
		//	Setting the casing to null doesn't prevent them from flying out of the gun when firing.
		SinWeapon.Casing "";
		SinWeapon.LoadSound "REVINSR";
		SinWeapon.ReloadTime 10;
	}
	States{Spawn: HGUN C -1; Stop;}
	Override void WeaponFire(SinPlayer shooter, SinHands gun){
		//	Gun effects won't spawn. I'll need to look into this more.
		A_SpawnItemEx("YellowFlareSmallB", 40, 0, 35);
		A_SpawnItemEx("GunSmoke", 24, zofs: height - 16);
		A_SpawnItemEx("MuzzleFlash1", 40, 0, 35);
	}
}
