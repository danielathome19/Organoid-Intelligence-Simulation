import numpy as np
import tensorflow as tf


def run_inference(input_data):
    model = tf.keras.models.load_model('mlp_model.h5')
    input_data = np.array(input_data).reshape(1, -1)
    output = model.predict(input_data)
    return float(output[0][0])


if __name__ == "__main__":
    input_data = [0.5] * 10  # Example input data
    print(run_inference(input_data))
