if !ent
it=endtime
endtime--
if fade
{
	if !ent
	ent=1
	sh-=sh/it
}
if endtime=0
instance_destroy()
