
Class SinLoadoutTemplar : SinLoadout{
	Default{
		DropItem "Revolver",256,6;
		DropItem "Shortsword",256,1;
		DropItem "BulletClip",256,6;
		DropItem "BulletClip",256,6;
		//DropItem "ShellPack",256,4;
		DropItem "TemplarChestplate",256,100;
	}
}

class MasterTemplar : SinPlayer
{
	Default
	{
		SinPlayer.UsePlayerName 1;
		Health 100;
		Player.MaxHealth 100;
		SinPlayer.MaxStamina 350;
		SinPlayer.MeleeDamage 15; SinPlayer.MeleeRange DEFMELEERANGE;
		SinPlayer.MeleeSpeed 12; SinPlayer.MeleePuff "SwordPuff"; SinPlayer.MeleeDamageType "Melee";
		SinPlayer.RapidMelee 1;
		SinPlayer.MeleeHitSound "KnifeHitSkin"; SinPlayer.MeleeMissSound "KnifeSwing"; SinPlayer.MeleeKillSound "*fist";
		SinPlayer.MeleeMassThreshold 100;
		Player.DisplayName "Master Templar";
		Player.Face "MAS";
		Player.Portrait "M_BOX1";
		Player.StartItem "SinLoadoutTemplar";
		
		Scale 1.06;
		Species "Ally";
		
		Player.AttackZOffset 13;

		Player.ForwardMove 0.75, 0.625;
		Player.SideMove 0.75, 0.625;
		Player.ViewBob 0.4;
		
		Player.DisplayName "MasterTemplar";
		Player.CrouchSprite "PLYC";
		
		+THRUSPECIES
	}

	override void HandleMovement()
	{
		super.HandleMovement();

		if (player.onground && !(player.cmd.forwardmove || player.cmd.sidemove) && vel.length() < 4)
		{
			vel.xy *= 0.9;
		}
	}

	override void FireWeapon(State stat)
	{
		let player = self.player;
		let weapn = player.ReadyWeapon;

		if (weapn == null) return;

		if (weapn.Ammo1 && !weapn.Ammo1.Amount)
		{
			if (CountInv(TFWeaponBase(weapn).ammoReserveType) && TFWeaponBase(weapn).bReloadable)
			{
				player.SetPSprite(PSP_WEAPON, weapn.FindState("Reload"));
			}
			
			return;
		}

		player.WeaponState &= ~WF_WEAPONBOBBING;
		PlayAttacking();
		weapn.bAltFire = false;
		if (stat == null)
		{
			stat = weapn.GetAtkState(!!player.refire);
		}
		player.SetPSprite(PSP_WEAPON, stat);
		if (!weapn.bNoAlert)
		{
			SoundAlert(self, false);
		}
	}

	void SetPlayerSprite()
	{
		if (PlayerNumber() != Net_Arbitrator)
		{
			sprite = GetSpriteIndex("TOSS");
			CrouchSprite = -1;
		}
	}

	States
	{
		Cache:
			PLAY A 0;
			TOSS A 0;

		Spawn:
			PLAY A -1 NoDelay SetPlayerSprite();
			Loop;
		See:
			#### ABCD 4;
			Loop;
		Missile:
			#### E 12;
			Goto Spawn;
		Melee:
			#### F 6 Bright;
			Goto Missile;
		Pain:
			#### G 4;
			#### G 4 A_Pain();
			Goto Spawn;
		Death:
			#### H 10;
			#### I 10 A_PlayerScream();
			#### J 10 A_NoBlocking();
			#### KLM 10;
			#### N -1;
			Stop;
		XDeath:
			#### O 5;
			#### P 5 A_XScream();
			#### Q 5 A_NoBlocking();
			#### RSTUV 5;
			#### W -1;
			Stop;
	}
}