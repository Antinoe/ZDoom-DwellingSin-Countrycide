

class TemplarChestplate : SinArmor Replaces GreenArmor
{
 	Default
	{
		Inventory.Icon "TAMRA0";
		Tag "Templar Chestplate";
		Inventory.PickupMessage "Picked up a Templar's chestplate.";
		Inventory.PickupSound "ARMORTK";
		SCALE 1.1;
		SinItem.Description "Plated Armor worn by the Templars of Ceru.";
		SinArmor.Protection 33.335;
		
	}
	States
	{
		Spawn:
			TAMR A -1;
			stop;
	}
}

class FoodSpawner : RandomSpawner Replaces Stimpack
{
    Default
    {
        DropItem "Bread", 255, 3;
        DropItem "Meaty", 255, 3;
		DropItem "Fruit", 255, 3;
    }
}

//	Decided to make a more interactive approach.
//	EDIT: I changed my mind. Weapons can't be used in recipes.
Class TFFood : SinHealing{
	Default{
		Health 10;
		Inventory.PickupSound "misc/i_pkup";
		Inventory.Amount 1;
		Inventory.MaxAmount 4;
		Scale 0.8;
		SinItem.Description ".";
		SinItem.Stackable 1;
	}
	Override bool Use(bool pickup){
		let playe = SinPlayer(owner);
		If(playe&&playe.health<playe.maxhealth){
			owner.A_StartSound("Eatstim",CHAN_AUTO,CHANF_OVERLAP);
		}
		Return Super.Use(pickup);
		Return 0;
	}
	States{Spawn: FOOD A 20; FOOD A 4 bright; loop;}
}

Class Bread : TFFood{
	Default{
		Inventory.Icon "FOODA0";
		Tag "Bread";
		Inventory.PickupMessage "Picked up some Bread.";
		SinItem.Description "A roll of grainy wheat bread.";
	}
	States{Spawn: FOOD A 20; FOOD A 4 bright; loop;}
}

Class Meaty : TFFood{
	Default{
		Inventory.Icon "FOODB0";
		Tag "Meat";
		Inventory.PickupMessage "Picked up some Meat.";
		SinItem.Description "A slice of meat of unknown origin.";
	}
	States{Spawn: FOOD B 20; FOOD B 4 bright; loop;}
}

Class Fruit : TFFood{
	Default{
		Inventory.Icon "FOODC0";
		Tag "Fruit";
		Inventory.PickupMessage "Picked up some Fruit.";
		SinItem.Description "An ordinary red apple.";
	}
	States{Spawn: FOOD C 20; FOOD C 4 bright; loop;}
}

Class FoodPack : TFFood{
	Default{
		Health 20;
		Inventory.Icon "FOODD0";
		Tag "Food Package";
		Inventory.PickupMessage "Picked up a food package.";
		SinItem.Description "A small package containing a light meal.";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		SinItem.Stackable 0;
	}
	States{Spawn: FOOD D 20; FOOD D 4 bright; loop;}
}

Class FoodBag : TFFood{
	Default{
		Health 30;
		Inventory.Icon "FOODE0";
		Tag "Food Bag";
		Inventory.PickupMessage "Picked up a food bag.";
		SinItem.Description "A large bag containing a plentiful meal.";
		Inventory.Amount 1;
		Inventory.MaxAmount 1;
		SinItem.Stackable 0;
	}
	States{Spawn: FOOD E 20; FOOD E 4 bright; loop;}
}

Class TFRecipeFoodPack1 : SinRecipe{
	Default{
		SinRecipe.Ingredients "Bread", "Meaty";
		SinRecipe.Result "FoodPack", 1;
	}
}

Class TFRecipeFoodPack2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "Bread", "Fruit";
		SinRecipe.Result "FoodPack", 1;
	}
}

Class TFRecipeFoodPack3 : SinRecipe{
	Default{
		SinRecipe.Ingredients "Fruit", "Meaty";
		SinRecipe.Result "FoodPack", 1;
	}
}

Class TFRecipeFoodBag1 : SinRecipe{
	Default{
		SinRecipe.Ingredients "FoodPack", "Bread";
		SinRecipe.Result "FoodBag", 1;
	}
}

Class TFRecipeFoodBag2 : SinRecipe{
	Default{
		SinRecipe.Ingredients "FoodPack", "Meaty";
		SinRecipe.Result "FoodBag", 1;
	}
}

Class TFRecipeFoodBag3 : SinRecipe{
	Default{
		SinRecipe.Ingredients "FoodPack", "Fruit";
		SinRecipe.Result "FoodBag", 1;
	}
}


/*
Class TFFood : SinWeapon{
	Default{
		Inventory.Icon "MEDIA0";
		Tag "Food Weapon";
		Inventory.PickupSound "misc/i_pkup";
		AttackSound "Eatstim";
		Inventory.Amount 2;
		Inventory.MaxAmount 10;
		Inventory.PickupMessage "You shouldn't see this.";
		SinItem.Description "You shouldn't see this.";
		SinItem.RemoveWhenEmpty 1;
		SinWeapon.FireType FIRE_AUTO;
		SinWeapon.AttackType ATTACK_PROJECTILE;
		SinWeapon.FireMode1 1,60;
		//SinItem.BigItem 0;
	}
	States{Spawn: MEDI A -1; Stop;}
	Override void WeaponFire(SinPlayer shooter, SinHands gun){
		shooter.GiveInventory("Health",5);
		Super.WeaponFire(shooter,gun);
	}
}

Class Bread : TFFood{
	Default{
		Inventory.Icon "FOODA0";
		Tag "Bread";
		Inventory.PickupMessage "Picked up some Bread.";
		SinItem.Description "A roll of grainy Wheat Bread.";
	}
	States{Spawn: FOOD A 20; FOOD A 4 bright; loop;}
}

Class Meaty : TFFood{
	Default{
		Inventory.Icon "FOODB0";
		Tag "Meat";
		Inventory.PickupMessage "Picked up some Meat.";
		SinItem.Description "A crudely cut slice of meat.";
	}
	States{Spawn: FOOD B 20; FOOD A 4 bright; loop;}
}

Class Fruit : TFFood{
	Default{
		Inventory.Icon "FOODC0";
		Tag "Fruit";
		Inventory.PickupMessage "Picked up some Fruit.";
		SinItem.Description "An ordinary Red Apple.";
	}
	States{Spawn: FOOD B 20; FOOD A 4 bright; loop;}
}
*/

Class DoctorBag : SinHealing replaces Medikit{
	Default{
		Inventory.Icon "MEDIA0";
		Tag "Doctor's Bag";
		Health 25;
		Inventory.PickupMessage "Picked up a doctor's bag.";
		//	Can't get this working right now. It's an inheritance of Health, not Inventory.
		//	I'll figure something out.
		//Health.LowMessage 25, "Picked up a life-saving doctor's bag.";
		Inventory.PickupSound "MKIT";
		SinItem.Description "A doctor's bag.";
	}
	States{Spawn: MEDI A -1; Stop;}
}

class ExousianBible : Soulsphere Replaces Soulsphere
{
	Default
	{
		Inventory.PickupSound "holvoc";
		Inventory.PickupMessage "The Exousian Bible heals your soul.";
		Scale 0.8;
	}
  
	States
	{
		Spawn:
			BIBL A -1;
			stop;
	}
}