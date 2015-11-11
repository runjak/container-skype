update:
	docker pull tomparys/skype

sound:
	docker run -d -p 55555:22 tomparys/skype

webcam:
	sudo docker run --privileged -d -p 55555:22 -v /dev/video0:/dev/video0:rw tomparys/skype

testPulse:
	pax11publish

fixPulse:
	pax11publish -e

skype:
	ssh docker-skype skype-pulseaudio
