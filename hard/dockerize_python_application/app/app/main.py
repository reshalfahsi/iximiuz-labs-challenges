import io
import cairo
from fastapi import FastAPI, Request, Response
from fastapi.staticfiles import StaticFiles
from fastapi.templating import Jinja2Templates

app = FastAPI()
from .api.routes_de4532d5c3bcc4d442f6 import routerde4532d5c3bcc4d442f6
app.include_router(routerde4532d5c3bcc4d442f6)
from .api.routes_d780d78ff6a314c1334a import routerd780d78ff6a314c1334a
app.include_router(routerd780d78ff6a314c1334a)
from .api.routes_fbd0fdabcab48c5ff4c9 import routerfbd0fdabcab48c5ff4c9
app.include_router(routerfbd0fdabcab48c5ff4c9)
from .api.routes_a97fd16ea482ae58d903 import routera97fd16ea482ae58d903
app.include_router(routera97fd16ea482ae58d903)
from .api.routes_d1092bbc704b648804c3 import routerd1092bbc704b648804c3
app.include_router(routerd1092bbc704b648804c3)
from .api.routes_0e79cd5e43b0f0b562a1 import router0e79cd5e43b0f0b562a1
app.include_router(router0e79cd5e43b0f0b562a1)
from .api.routes_ff277e4970edece81017 import routerff277e4970edece81017
app.include_router(routerff277e4970edece81017)
from .api.routes_af5040dceb4d78093074 import routeraf5040dceb4d78093074
app.include_router(routeraf5040dceb4d78093074)
from .api.routes_f86e32aeed920af2f94b import routerf86e32aeed920af2f94b
app.include_router(routerf86e32aeed920af2f94b)
from .api.routes_3cba9b75aa916b27862c import router3cba9b75aa916b27862c
app.include_router(router3cba9b75aa916b27862c)
from .api.routes_07547a881b464fccea3e import router07547a881b464fccea3e
app.include_router(router07547a881b464fccea3e)
from .api.routes_72bcd39c4e55a389b8c3 import router72bcd39c4e55a389b8c3
app.include_router(router72bcd39c4e55a389b8c3)
from .api.routes_780c7dab0c9eb8bb3db8 import router780c7dab0c9eb8bb3db8
app.include_router(router780c7dab0c9eb8bb3db8)
from .api.routes_1666d93da5e901df1131 import router1666d93da5e901df1131
app.include_router(router1666d93da5e901df1131)
from .api.routes_f923c3351d36a479b5db import routerf923c3351d36a479b5db
app.include_router(routerf923c3351d36a479b5db)
from .api.routes_ae5d80dd3f409850afc6 import routerae5d80dd3f409850afc6
app.include_router(routerae5d80dd3f409850afc6)
from .api.routes_04d4b3890d05569ebba7 import router04d4b3890d05569ebba7
app.include_router(router04d4b3890d05569ebba7)
from .api.routes_3c0dc5d92511d8537876 import router3c0dc5d92511d8537876
app.include_router(router3c0dc5d92511d8537876)
from .api.routes_c30691d5d637bbcd723c import routerc30691d5d637bbcd723c
app.include_router(routerc30691d5d637bbcd723c)
from .api.routes_11b484d03207849c6884 import router11b484d03207849c6884
app.include_router(router11b484d03207849c6884)


app.mount("/static", StaticFiles(directory="app/static"), name="static")


templates = Jinja2Templates(directory="app/templates")

@app.get("/")
def index(request: Request):
    return templates.TemplateResponse(request, "index.html")

@app.get("/image", response_class=Response)
def image():
    width, height = 400, 100
    surface = cairo.ImageSurface(cairo.FORMAT_ARGB32, width, height)
    ctx = cairo.Context(surface)

    ctx.set_source_rgb(1, 1, 1)
    ctx.paint()

    ctx.set_source_rgb(0.2, 0.6, 0.8)
    ctx.rectangle(20, 20, 360, 60)
    ctx.fill()

    ctx.set_source_rgb(0, 0, 0)
    ctx.select_font_face("Sans", cairo.FONT_SLANT_NORMAL, cairo.FONT_WEIGHT_BOLD)
    ctx.set_font_size(20)
    ctx.move_to(50, 55)
    ctx.show_text("Welcome to iximiuz Labs!")

    img_io = io.BytesIO()
    surface.write_to_png(img_io)
    img_io.seek(0)

    return Response(img_io.read(), media_type="image/png")