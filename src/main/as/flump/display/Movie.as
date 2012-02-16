//
// Flump - Copyright 2012 Three Rings Design

package flump.display {

import flump.xfl.XflLayer;
import flump.xfl.XflMovie;

import starling.display.Sprite;

import com.threerings.util.Map;

public class Movie extends Sprite
{
    public function Movie (movie :XflMovie, xflTextures :Map, textures :Map)
    {
        for each (var layer :XflLayer in movie.layers) {
            _layers.push(new Layer(layer, xflTextures.get(layer.keyframes[0].libraryName),
                textures.get(layer.keyframes[0].libraryName)));
            addChild(_layers[_layers.length - 1]);
        }
    }

    public function play () :void {
        for each (var layer :Layer in _layers) {
            layer.play();
        }

    }

    public function stop () :void {

    }

    protected const _layers :Vector.<Layer> = new Vector.<Layer>();
}
}