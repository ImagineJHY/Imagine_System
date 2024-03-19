prepare:
	python3 init.py

proto_init:
	cd worker/Imagine_Rpc && make proto_init cd ../Imagine_MapReduce && make proto_init