import numpy as np
import tensorflow as tf
from tensorflow.keras.layers import Dense
from tensorflow.keras.models import Sequential


def create_mlp_model():
    model = Sequential([
        Dense(32, activation='relu', input_shape=(10,)),
        Dense(16, activation='relu'),
        Dense(1, activation='sigmoid')
    ])
    model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
    return model


def train_mlp_model(model, X, y):
    model.fit(X, y, epochs=10, batch_size=32)
    return model


def save_mlp_model(model, filename):
    model.save(filename)


if __name__ == "__main__":
    # Generate synthetic data
    X = np.random.rand(1000, 10)
    y = (np.sum(X, axis=1) > 5).astype(int)
    
    model = create_mlp_model()
    model = train_mlp_model(model, X, y)
    save_mlp_model(model, "mlp_model.h5")
