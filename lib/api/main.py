from typing import List, Optional
from fastapi import FastAPI
from pydantic import BaseModel
from fastapi.encoders import jsonable_encoder

app = FastAPI()

class Item(BaseModel):
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

@app.get("/barang/{listbarang_id}", response_model=Item)
async def read_item(listbarang_id: int):
    return listbarang[listbarang_id]

@app.put("/barang/{inibarang_id}", response_model=Item)
async def update_item(inibarang_id: int, inibarang:Item):
    update_item_encoded = jsonable_encoder(inibarang)
    listbarang[inibarang_id] = update_item_encoded
    return update_item_encoded