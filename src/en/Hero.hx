package en; // en for 'entities'

import hxd.Key;

class Hero extends Entity {
    var ca : dn.heaps.Controller.ControllerAccess;

    public function new(x, y) {
        super(x, y);

        // Basic graphics. Normally, an actual sprite would be loaded.
        var g = new h2d.Graphics(spr);
        g.beginFill(0xff0000);
        g.drawRect(0, 0, 16, 16);

        ca = Main.ME.controller.createAccess("hero"); // Input access
    }

    override function dispose() {
        super.dispose();
        ca.dispose(); // Release memory
    }

    override function update() {
        super.update();

        // Handle input
        if (ca.leftDown() || ca.isKeyboardDown(Key.LEFT)) {
            dx -= 0.1 * tmod; // tmod roughly equivalent to delta time
        }
        if (ca.rightDown() || ca.isKeyboardDown(Key.RIGHT)) {
            dx += 0.1 * tmod;
        }
        if (ca.upDown() || ca.isKeyboardDown(Key.UP) || ca.isKeyboardDown(Key.W)) {
            dy -= 0.1 * tmod;
        }
        if (ca.downDown() || ca.isKeyboardDown(Key.DOWN) || ca.isKeyboardDown(Key.S)) {
            dy += 0.1 * tmod;
        }
    }
}