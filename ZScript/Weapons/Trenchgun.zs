
Class Trenchgun : SinWeapon replaces Shotgun{
	Default{
		Inventory.Icon "WSRNA0";
		Tag "Trenchgun";
		AttackSound "weapons/shotgf";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		Inventory.PickupSound "GRLLOG";
		Inventory.PickupMessage "Picked up a Trenchgun.";
		Scale 0.7;
		SinItem.Description "A single-shot trenchgun commonly used by the forces of the Exousian Caliphate.";
		SinWeapon.AmmoType "Shotgun";
		SinWeapon.AmmoLoaded "SinShellBuckshot";
		SinWeapon.FireType FIRE_AUTO;
		SinWeapon.ReloadType RELOAD_BOTTOM;
		SinWeapon.HitscanDamage -1;
		SinWeapon.Spread 1,1;
		SinWeapon.Climb 2,2;
		SinWeapon.SlamFire 0;
		SinWeapon.FireMode1 1,4;
		SinItem.BigItem 1;
		SinWeapon.CasingVelocity 0,-4,2;
		SinWeapon.LoadSound "GRLLOG";
		//SinWeapon.FireSound "ATKTRCH";
		SinWeapon.ReloadTime 20;
	}
	States{Spawn: WSRN A -1; Stop;}
}
