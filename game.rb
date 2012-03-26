include Java 

Dir["libs/\*.jar"].each { |jar| require jar }

java_import com.badlogic.gdx.ApplicationListener

java_import com.badlogic.gdx.Gdx
java_import com.badlogic.gdx.graphics.GL10
java_import com.badlogic.gdx.graphics.Mesh
java_import com.badlogic.gdx.graphics.VertexAttribute
java_import com.badlogic.gdx.graphics.VertexAttributes

class Game
  include ApplicationListener

  def create
    unless @mesh
      @mesh = Mesh.new(true, 3, 3, VertexAttribute.new(VertexAttributes::Usage::Position, 3, "a_position"))
      @mesh.set_vertices([-0.5, -0.5, 0, 0.5, -0.5, 0, 0, 0.5, 0].to_java(:float))
      @mesh.set_indices([0, 1, 2].to_java(:short))
    end
  end

  def render
    Gdx.gl.glClear(GL10.GL_COLOR_BUFFER_BIT)
    @mesh.render(GL10.GL_TRIANGLES, 0, 3)
  end

  def resize width, height
  end

  def pause

  end

  def resume

  end

  def dispose

  end
end

java_import com.badlogic.gdx.backends.lwjgl.LwjglApplication

LwjglApplication.new(Game.new, "Game", 480, 320, false)