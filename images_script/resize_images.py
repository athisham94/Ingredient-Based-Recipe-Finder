from PIL import Image
import os

# === SETTINGS ===
input_folder = "images"       # folder containing 1.jpg to 100.jpg
output_folder = "resized"     # output folder
target_size = (400, 300)      # width, height

# Create output folder if not exists
os.makedirs(output_folder, exist_ok=True)

for i in range(1, 101):  # 1 to 100
    filename = f"{i}.jpg"
    input_path = os.path.join(input_folder, filename)
    output_path = os.path.join(output_folder, filename)
    
    try:
        with Image.open(input_path) as img:
            resized = img.resize(target_size, Image.LANCZOS)
            resized.save(output_path)
            print(f"✅ {filename} resized to 400×300")
    except FileNotFoundError:
        print(f"⚠️ {filename} not found, skipping...")
    except Exception as e:
        print(f"❌ Error processing {filename}: {e}")

print("\n🎉 Done! All available images resized.")
