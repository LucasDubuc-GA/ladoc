!Programme réaliser par Lucas Dubuc
!Ce programme crée une requette internet pour Edge 

program ladoc
	!Déclaration des variables
	character (len=100) :: req
	character (len=50) :: arg
	integer :: i
	
	! On déclare la string de requête
	req = "start msedge "  
	i = 1
	
	call get_command_argument(i, arg)
	if(arg == "url") then ! sinon on cherche l'URL
		req = trim(req) // " " // arg
	else if(arg == "localhost") then
		req = "start msedge http://localhost/"
	else ! si on veut faire une recherche par mot clés 
		req = trim(req) // " www.bing.com/search?q="
		do while(arg /= "") ! /= est le remplacent de !=
			req = trim(req) // arg
			req = trim(req) // "+"
		
			i = i + 1
			call get_command_argument(i, arg)
		end do
	!L'avantage sur le batch est que nous ne somme pas limiter à 9 mots
	end if
	
	
	write(*, '(a)') req
	call system(req)
end program