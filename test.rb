require 'encryptor'

public_key  = <<END_STRING
-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4x2STIco3xK7ktouXlSH
XttnDk22Rjmgnjm4XkVPmSDkoh25vYswCRjtQlntGuhIzu+fT40eyMWpdoD3x0Df
jkJMMNiSZnPa7K0n0iU9sgBlbT2Rie1/JoLcP8zj03gS4hTmDWbrQTWWf3q+PWVR
QJoPDqN/I2o6K0676AZ7F/QBwRwGtsQKs26qAhOsFzcRybf6ApUldUB/l3IJsCEX
JcFGOZQCwiOKj40ob5CP1+YPfJsFiNhNRkx4JgF4BWvVBuqJMrNFRrFdWOSrcB6I
WCVAN17cqhbV5ibqeL7Z+cjh53q8xpH3qeU/ud60GH42dKKPJrqrgNmVTC5aiuFx
SQIDAQAB
-----END PUBLIC KEY-----
END_STRING

private_key = <<END_STRING
-----BEGIN RSA PRIVATE KEY-----
Proc-Type: 4,ENCRYPTED
DEK-Info: DES-EDE3-CBC,A256AEC3120EAE11

RJwhviud0XdkSAqS+D4BnHOZEyn8SipaAQ2s5CLUzDa/yLd87kIzjqF6wQ8lF3+p
EnSrpU0nd2Nid7xXEMaENbt9lwJuTQ1A9JlFULJje1BwTVilcvpPn+cT6v9L22ZP
wXgm7f+lrvMG6tG/QhgkPsAaP87RfVBBt9hIbLO6u6ttKCS4HqUj8QJTVrMae8o8
Qua+j9aWixlPRO6XlbnHcuZj6B+9ITQ2PF/6JuFe6EOzi7dQSRIkGVitUp8FqZk7
T8Y5O0AGG7LtznFA7NJ7RNeWjLDSvU09Ah/xazD2MLbqpCCg+tKLz2xC9aMqjOUe
LmI/fwVxdbZMy24F05Q1QtIBn1mX7kpqD/jhvJalPHCACPYejcRqZoPuUDnk9kxM
swjaxLCzPgVeh7onY+NPzkiTogFt0F4LBp7cyJnX7xshBYbLrxVQ6/uKSf6oPYu2
MclRudiFvIh9rvqHkOj9URX9tlmDnh+9Elxryub0KAV3t82ij+H8YYssc96H4QMi
CFHHA6jP+Pl+OqMsa2ZgarHW5jxm884HsxhDpN6RkCd3QpUhf6rFmVyaOXpmssgy
hcpDNENzkxFtfksR62uY30jZ3+bMeNy7vtWUcYneNo3jmznZO7JV3Nqto5bt3Q+x
1/91nDgzqLi1F5YsRTsbc/JoZ3uHuUpiOiF0WXykZnXJq0VBIVQEWW51EbnQ+laJ
En43D3R6EwfooywricAYoV4J7c3GyBHclmRjyRyqGqqCj8HP1iRRHWR18WH3xB9p
S5CMm7bhGH5lg8fcR+W5/Rj3AqoFfAxXq0RdzymvyOQNk+w48uV9kzp4Tb/iFzar
B0J0Qnu/sEaMhOena+b8dn5xabgjF+7O3N7yWeTgjxkgwuP9NGKPhZ6TGJNpWr6n
BIS3a810sfu5KBicDYxeBin1oB+B5MboVzFS/U2Se/wGqTbGepdAsV8k2YRg2QgN
vNqP4dFWx9UaoXwbTvcvz//gu+yCwUVG0oFB8eX+n3JEx2tHvMjwl1nr+HHqeSjC
eyE8EaBe+sxLuDBhRhagfUhsue26VEtcmds6Zu6+u+h06z9QgYF36ErEXqmObxcw
3GGUCnhE6MgzzjPliYLUN58ZWDMBCleDSyjm6Al8W+L+xVRrHHkCD3S6Rt+vqZ5Y
SDl7YYbBu/xEGwVb1gImCeckDYgL+FnJDPwf16aL8iCRY5SrEBL78iolsHleOpL+
6jaBzugHcG+doC0mGr1eM+im0CgMKpa6cV2WXk0beFEc8MtpnsDQo/JuW6WKgtX5
yHGF82BATK45sGlhaTPVVeqg7iZkzK4+2PdKWOYSt8HKBCNo8oAWM/VflxGHJuCs
FDROmJs2PAaMFvBg7oL75PCIFjrXdpUlm5jLSwi6C5dNyAwJ87e5TMLcJmb/3kLz
plVAXhZc+RbKtdK8NMZASBRXIk+ThdgjBlTXSjkxDyse4Y2kPJ8NaE/qzXBEXxyz
Gro6SX0rPOAZiqKNjXTzOmC/puEaojzUH7j1Ssw+zI/fExtqlN5UhXJ6fSvBD5jY
wLZ2Ta9h6TLMAPwJJsUH/Re/FrFG5gjt8rrFF/7V22UkgbjKfJNvjGktpR75dWRo
-----END RSA PRIVATE KEY-----
END_STRING

original  = <<END_STRING
    Le Soleil et les Grenouilles

Aux noces d'un Tyran tout le Peuple en liesse
Noyait son souci dans les pots.
Esope seul trouvait que les gens étaient sots
De témoigner tant d'allégresse.
Le Soleil, disait-il, eut dessein autrefois
De songer à l'Hyménée.
Aussitôt on ouït d'une commune voix
Se plaindre de leur destinée
Les Citoyennes des Etangs.
Que ferons-nous, s'il lui vient des enfants ?
Dirent-elles au Sort, un seul Soleil à peine
Se peut souffrir. Une demi-douzaine
Mettra la Mer à sec et tous ses habitants.
Adieu joncs et marais : notre race est détruite.
Bientôt on la verra réduite
A l'eau du Styx. Pour un pauvre Animal,
Grenouilles, à mon sens, ne raisonnaient pas mal.11
END_STRING

password    = 'test'

############################# TESTING the Encryptor methods ###########################3


encrypted = Encryptor.encrypt_data(original, public_key)

decrypted = Encryptor.decrypt_data(encrypted, private_key, password)



######################## Check #########################

good_encrypted_length  = (encrypted.length == (original.length+512+(16-original.length%16)))
good_decrypted_content = (original == decrypted)

puts "Message length : #{original.length}"
puts "Encrypted message length should be (#{original.length + (16-original.length%16)} + 512) : #{good_encrypted_length}"
puts "Decrypted message should be the same as the Original : #{good_decrypted_content}"

if good_encrypted_length and good_decrypted_content
  puts "Encryptor works as expected"
else
  $stderr << '!! Encryptor is wrong !!'
end