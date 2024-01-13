
Class ShortSword : SinWeapon replaces Fist{
	Default{
		Inventory.Icon "KNFEA0";
		Scale 0.75;
		Tag "Shortsword";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		Inventory.PickupMessage "Acquired a trusty shortsword";
		SinItem.Description "Your trustworthy shortsword. It proves reliable in desperate moments.";
		SinWeapon.FireType FIRE_AUTO;
		SinWeapon.AttackType ATTACK_PROJECTILE;
		SinWeapon.Projectile "SwordProjectile";
		SinWeapon.Noise 1;
		SinWeapon.Recoil -1;
		SinWeapon.FireMode1 999,12;
		SinWeapon.AmmoCost 0;
		//SinWeapon.Cooldown 10;
		SinItem.RemoveWhenEmpty 1;
	}
	States{Spawn: KNFE A -1; Stop;}
}

class SwordProjectile : Actor
{
	Default
	{
		Radius 13;
		Height 8;
		Speed 50;
 		Damage 15;
		Projectile;
		+RANDOMIZE
		SeeSound "KnifeSwing";
		DeathSound "KnifeHitSkin";
		Obituary "%o got skewered by %k";
	}
	States
	{
 	Spawn:
		TNT1 A 1;
		Goto Death;
	Death:
		TNT1 A 0;
		Stop;
	}
}

Class SwordPuff : TFMeleePuff
{
	Default
	{
		DamageType "Slice";
		Species "fren";

		SeeSound "KnifeHitSkin";
		AttackSound "KnifeHitWall";

		RenderStyle "Add";
		Alpha 0.2;

		+PUFFONACTORS
		+NOEXTREMEDEATH
		+BLOODSPLATTER
	}

	States
	{
		Spawn:
			PUFF ABCD 4;
			Stop;
  	}
} 