from typing import List, Optional
from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder

app = FastAPI()

class Item(BaseModel):
    namatoko: str
    namabarang: str
    gambarbarang: str
    deskripsibarang: str
    hargabarang: float

listbarang = {
    100:{
        "namabarang": "Kursi #1",
        "gambarbarang":"https://cf.shopee.co.id/file/4fce1e7f79e79c92221435d208431ce1",
        "deskripsibarang":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Si verbum sequimur, primum longius verbum praepositum quam bonum. At certe gravius. Quis enim est, qui non videat haec esse in natura rerum tria? Duo Reges: constructio interrete.",
        "hargabarang": 80.00,
    },
    101:{
        "namabarang": "Kursi #2",
        "gambarbarang":"https://cf.shopee.co.id/file/74afddf34918b26d2ccbc5ef9ca1bd93",
        "deskripsibarang":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Si verbum sequimur, primum longius verbum praepositum quam bonum. At certe gravius. Quis enim est, qui non videat haec esse in natura rerum tria? Duo Reges: constructio interrete.",
        "hargabarang":580.00,
    },
    102:{
        "namabarang": "Kursi #3",
        "gambarbarang":"https://cf.shopee.co.id/file/1d91573d4136560bb8a37e94fee45f6b",
        "deskripsibarang":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Si verbum sequimur, primum longius verbum praepositum quam bonum. At certe gravius. Quis enim est, qui non videat haec esse in natura rerum tria? Duo Reges: constructio interrete.",
        "hargabarang": 100.00,
    }
}

myshop = [
#    {
# 		"toko": {
# 			"namatoko": "sakura_life",
# 			"lokasitoko": "jakarta"
# 		},
# 		"barang": {
# 			"namabarang": "Weyon Sakura chair Kursi restoran kursi kopi modern sederhana bergaya Eropa",
# 			"deskripsibarang": "Alas kaki non-slip, senyap, dan stabil: mencegah goresan di lantai saat bergerak, senyap, dan tahan aus Struktur segitiga + dukungan empat titik: struktur stabil, lebih stabil Permukaan duduk yang ditingkatkan: perasaan duduk yang nyaman melebar dan membesar. Ini mengurangi tekanan pada tulang belakang lumbar dan kuat dan tahan lama. Tahan air dan mudah dibersihkan",
# 			"hargabarang": 10.00,
# 			"gambarbarang": "https://cf.shopee.co.id/file/29babb53fa693cc4cd46c94d6b803d16"
# 		},
# 		"komentar": {
# 			"namakomentar": "dhinical",
# 			"isikomentar": "Produk bagus. Pengiriman aman. Agak bingung ngerakitnya tapi ada youtube hehe. Puas bgt dapet harga promo tapi kualitas tetep ok. Thanks seller.",
# 			"tanggalkomentar": "2021-09-29 21:51",
# 			"nilaikomentar": 3
# 		}
# 	},
		{
			"namatoko":"sakura_life",
			"namabarang":"https://cf.shopee.co.id/file/29babb53fa693cc4cd46c94d6b803d16"
		},
		{
			"namatoko":"sakura_life222",
			"namabarang":"https://cf.shopee.co.id/file/c9482509ea063066dd4619c609db8e21"
		}
]

@app.get("/myshop")
def get_barang():
    return myshop

# @app.get("/barang/{listbarang_id}", response_model=Item)
# async def read_item(listbarang_id: int):
#     return listbarang[listbarang_id]

# @app.put("/barang/{inibarang_id}", response_model=Item)
# async def update_item(inibarang_id: int, inibarang:Item):
#     update_item_encoded = jsonable_encoder(inibarang)
#     listbarang[inibarang_id] = update_item_encoded
#     return update_item_encoded