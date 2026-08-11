from datetime import datetime, timedelta
from jose import JWTError, jwt
from passlib.context import CryptContext
from cryptography.fernet import Fernet
import base64, os
from dotenv import load_dotenv

load_dotenv()

SECRET_KEY = os.getenv("SECRET_KEY", "default-secret-key-32-chars-minimum!!")
ALGORITHM = os.getenv("ALGORITHM", "HS256")
ACCESS_EXPIRE = int(os.getenv("ACCESS_TOKEN_EXPIRE_MINUTES", 60))
ANON_KEY = os.getenv("ANON_ENCRYPT_KEY", "default-anon-key-32-chars-minimum!!").encode()

pwd_context = CryptContext(schemes=["pbkdf2_sha256"], deprecated="auto")

fernet_key = base64.urlsafe_b64encode(ANON_KEY.ljust(32)[:32])
fernet = Fernet(fernet_key)

def hash_password(password: str) -> str:
    return pwd_context.hash(password)

def verify_password(plain: str, hashed: str) -> bool:
    return pwd_context.verify(plain, hashed)

def create_access_token(data: dict) -> str:
    to_encode = data.copy()
    if "sub" in to_encode:
        to_encode["sub"] = str(to_encode["sub"])
    expire = datetime.utcnow() + timedelta(minutes=ACCESS_EXPIRE)
    to_encode.update({"exp": expire})
    return jwt.encode(to_encode, SECRET_KEY, algorithm=ALGORITHM)

def decode_token(token: str) -> dict:
    return jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])

def encrypt_identity(user_id: int) -> str:
    return fernet.encrypt(str(user_id).encode()).decode()

def decrypt_identity(enc: str) -> int:
    return int(fernet.decrypt(enc.encode()).decode())
