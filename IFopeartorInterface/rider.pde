class Rider {
    PVector pos;
    private int r;
    private float weight;
    private int indx;
    private color[] c;
    Rider(PVector pos, float weight, int indx) {
        this.pos = pos;
        r = 80;
        this.weight = weight;
        this.indx = indx;
        c = new color[5];
        c[0] = color(200, 0, 10);
        c[1] = color(10, 200, 10);
        c[2] = color(10, 10, 100);
        c[3] = color(207, 255, 51);
        c[4] = color(255, 113, 113);
    }

    void update(PVector pos, float weight) {
        this.pos = pos;
        this.weight = weight;
    }

    void draw() {
        pushStyle();
        pushMatrix();
        translate(fieldController.fieldBtsPos[0].x, fieldController.fieldBtsPos[0].y);
        float w = fieldController.fieldBtsPos[5].x - fieldController.fieldBtsPos[0].x + fieldController.btSize;
        float h = fieldController.fieldBtsPos[30].y - fieldController.fieldBtsPos[0].y + fieldController.btSize;
        float x = map(pos.x, 0, 6, 0, w);
        float y = map(pos.y, 0, 6, 0, h);
        float scale = norm(weight, 0, 400);
        fill(c[indx]);
        noStroke();
        ellipse(x, y, r * scale, r * scale);
        popMatrix();
        popStyle();
    }

    boolean checkStateRiderIsOn() {
        boolean result;
        if (weight == 0) result = false;
        else result = true;
        return result;
    }
}