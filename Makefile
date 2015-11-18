update:
	docker pull tomparys/skype

sound:
	docker run -d -p 127.0.0.1:55555:22 -v `pwd`:/home/docker tomparys/skype

webcam:
	sudo docker run --privileged -d -p 127.0.0.1:55555:22 -v `pwd`:/home/docker -v /dev/video0:/dev/video0:rw tomparys/skype

testPulse:
	pax11publish

fixPulse:
	pax11publish -e

cleanPulse:
	pax11publish -r

skype:
	ssh docker-skype skype-pulseaudio
