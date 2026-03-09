local version = {	
        appStore="iTunes",--"Google Play","iTunes", "Samsung", "Amazon"
	
	rateURL = "https://itunes.apple.com/us/app/animal-math-games-for-kids/id799973028?ls=1&mt=8&uo=4&at=11l4UF",
        
	flurryID = "HTWCH3ZVMP5C4QBWKR9B",
		
	promoKitID = "animal-math-kinder-free",
		
      --math games paid
		-- bundleID = "com.eggrollgames.mathgamespaid", 
       -- defaultVersion = 5,
       -- unlockItems = {top="",mid="",bottom=""},
     
     --math games free
       bundleID = "com.eggrollgames.animalmathkindergartenfree", 
       defaultVersion = 4,
		unlockItems = {All="unlockeverything",
								Percival="percival",
								Chauncey="chauncey",
								Webster="webster",
								Chip="chip",
								Pete="pete"
								},


       
}
return version