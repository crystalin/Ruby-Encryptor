require 'openssl'

# Module to encrypt a file (Binary/Text) with public/private key and aes cipher
#
# Sample :
#
#      public_key  = File.read('test.pub')
#      private_key = File.read('test.pem')
#      password    = 'test'
#
#      original_file  = 'original.txt'
#      encrypted_file = 'encrypted'
#      decrypted_file = 'decrypted'
#
#    # Encrypt the file with :
#      File.open(encrypted,'wb') {|f| f.write(Encryptor.encrypt_data(File.read(original), public_key))}
#
#    # Decrypt with :
#      File.open(decrypted,'wb') {|f| f.write(Encryptor.decrypt_file(File.read(encrypted), private_key, password))}

module Encryptor

  def Encryptor.encrypt_data(data, public_key)
    begin
      public_key = OpenSSL::PKey::RSA.new(public_key)
    rescue
      $stderr << "Provided key is incorrect\n"
      return
    end

    cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
    cipher.encrypt
    cipher.key = random_key = cipher.random_key
    cipher.iv = random_iv = cipher.random_iv

    encrypted_data = cipher.update(data)
    encrypted_data << cipher.final

    encrypted_key =  public_key.public_encrypt(random_key)
    encrypted_iv = public_key.public_encrypt(random_iv)

    encrypted_key << encrypted_iv << encrypted_data
  end

  def Encryptor.decrypt_data(data, private_key, password)
    begin
      private_key = OpenSSL::PKey::RSA.new(private_key,password)
    rescue
      $stderr << "Private key or Password incorrect\n"
      return
    end

    cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
    cipher.decrypt

    encrypted_key = data[0..255]
    encrypted_iv = data[256..511]

    encrypted_data = data[512..-1]

    cipher.key = private_key.private_decrypt(encrypted_key)
    cipher.iv = private_key.private_decrypt(encrypted_iv)

    decrypted_data = cipher.update(encrypted_data)
    decrypted_data << cipher.final
  end
end