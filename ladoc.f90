!Programe réaliser par Lucas Dubuc
!Ce programe crée une requette internet pour Edge 

program ladoc
	!Déclaration des variables
	character (len=100) :: req
	character (len=50) :: arg
	integer :: i
	
	
	req = "start msedge www.bing.com/search?q="
	i = 1
	call get_command_argument(i, arg)
	do while(arg /= "") ! /= est le remplacent de !=
		req = trim(req) // arg
		req = trim(req) // "+"
		
		i = i + 1
		call get_command_argument(i, arg)
	end do
	!L'avantage sur le batch est que nous ne somme pas limiter à 9 mots
	call system(req)
end program