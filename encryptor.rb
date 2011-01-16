require 'openssl'

# Module to encrypt a file (Binary/Text) with public/private key and aes cipher 
#
# Sample :
#
#      public_key  = 'test.pub'
#      private_key = 'test.pem'
#      password    = 'test'
#
#      original  = 'original.txt'
#      encrypted = 'encrypted'
#      decrypted = 'decrypted'
#
#    # Encrypt the file with :
#      File.open(encrypted,'wb') {|f| f.write(Encryptor.encrypt_data(File.read(original), public_key))}
#
#    # Decrypt with :
#      File.open(decrypted,'wb') {|f| f.write(Encryptor.decrypt_file(encrypted, private_key, password))}

module Encryptor

  def Encryptor.encrypt_data(data, public_key_file)
    begin
      public_key = OpenSSL::PKey::RSA.new(File.read(public_key_file))
    rescue Errno::ENOENT
      $stderr << "Public key not found\n"
      return
    rescue OpenSSL::PKey::RSAError
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

  def Encryptor.decrypt_file(file, private_key_file, password)
    begin
      private_key = OpenSSL::PKey::RSA.new(File.read(private_key_file),password)
    rescue Errno::ENOENT
      $stderr << "Private key not found\n"
    rescue
      $stderr << "Private key or Password incorrect\n"
      return
    end

    cipher = OpenSSL::Cipher::Cipher.new('aes-256-cbc')
    cipher.decrypt

    File.open(file, 'rb') do |f|
      encrypted_key = f.read(256)
      encrypted_iv = f.read(256)

      encrypted_data = f.read

      cipher.key = private_key.private_decrypt(encrypted_key)
      cipher.iv = private_key.private_decrypt(encrypted_iv)

      decrypted_data = cipher.update(encrypted_data)
      decrypted_data << cipher.final
    end
  end
end