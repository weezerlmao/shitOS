ASM=nasm
SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main.img: $(BUILD_DIR)/btldr.bin
	cp $(BUILD_DIR)/btldr.bin $(BUILD_DIR)/main.img
	truncate -s 1440k $(BUILD_DIR)/main.img

$(BUILD_DIR)/btldr.bin: $(SRC_DIR)/boot/bootloader.asm
	$(ASM) $(SRC_DIR)/boot/bootloader.asm -f bin -o $(BUILD_DIR)/btldr.bin

