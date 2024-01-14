
Class BulletClip : SinAmmo replaces SinPistolAmmoNormal{
	Default{
		Scale 1;
		Inventory.Icon "CLIPA0";
		Tag "Bullets";
		Inventory.Amount 6;
		Inventory.MaxAmount 12;
		Inventory.PickupMessage "Picked up some bullets";
		Inventory.PickupSound "REVAMMO";
		SinItem.Description "Small-Caliber rounds for the Revolver.";
		SinAmmo.AmmoType "Pistol";
		SinAmmo.TypeName "$SINAMMO_PISTOLTYPE";
		SinAmmo.HitscanPuff "SinPistolPuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 10;
		SinAmmo.Spread 1.5,1.5;
		SinAmmo.Climb 0.4,0.4;
		SinAmmo.Noise 4096;
		SinAmmo.Casing "";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: CLIP A -1; Stop;}
}

Class ShellPack : SinAmmo replaces SinShellBuckshot{
	Default{
		Inventory.Icon "SHELA0";
		Tag "Trenchgun Shells";
		Inventory.Amount 4;
		Inventory.MaxAmount 8;
		Inventory.PickupMessage "Picked up a few trenchgun shells";
		Inventory.PickupSound "SHELPIK";
		Scale 0.6;
		SinItem.Description "12 Gauge Buckshot Shells for the Trenchgun.";
		SinAmmo.AmmoType "Shotgun";
		SinAmmo.TypeName "$SINAMMO_SHELLTYPE";
		SinAmmo.HitscanPuff "SinBuckshotPuff";
		SinAmmo.AttackType ATTACK_HITSCAN;
		SinAmmo.HitscanDamage 8;
		SinAmmo.Multishot 8;
		SinAmmo.Spread 4,4;
		SinAmmo.Climb 3,3;
		SinAmmo.Noise 8192;
		SinAmmo.Casing "SinCasingShellBuckshot";
		SinItem.Stackable 1;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: SHEL A -1; Stop;}
}
