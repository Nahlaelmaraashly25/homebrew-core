class ConjureUp < Formula
  include Language::Python::Virtualenv

  desc "Big software deployments so easy it's almost magical."
  homepage "https://conjure-up.io/"
  url "https://github.com/conjure-up/conjure-up/archive/2.3.1.tar.gz"
  sha256 "da429aad45ef0c6a70565a3748da2cb668def684b65f04ee3c081ebce065fac7"

  bottle do
    cellar :any
    sha256 "d557b765effbc4f473f3fadaeba0a81f0603e20e76630546d2fdadc4f88fcc5a" => :high_sierra
    sha256 "792cd3cf9a6dd725b6448bcf2498b1bd6ad29b2b45afe1444084912b4e69af4f" => :sierra
    sha256 "d0b050dfa5a30359b93b31ee79a016cab89a3f2bf244d4f2035a9680857a02e7" => :el_capitan
    sha256 "d906f685f3487ea7c6ec85363d1f02367abb3ef8c1c13a6eb63b1715e8b53c54" => :x86_64_linux
  end

  depends_on :python3
  depends_on "libyaml"
  depends_on "juju"
  depends_on "jq"
  depends_on "wget"
  depends_on "redis"

  # list generated from the 'requirements.txt' file in the repository root
  resource "aiofiles" do
    url "https://files.pythonhosted.org/packages/28/51/913ed4312b63b0a1b6cad5a761b2c163eb20e353c7a3f19f08e04e8675e5/aiofiles-0.3.1.tar.gz"
    sha256 "6c4936cea65175277183553dbc27d08b286a24ae5bd86f44fbe485dfcf77a14a"
  end

  resource "awscli" do
    url "https://files.pythonhosted.org/packages/91/31/9b420c49cbbc4316bdec5596b659adba934b9209a647bf0a780dc4b11a3b/awscli-1.11.123.tar.gz"
    sha256 "74808159d67c31ce00f6ef1ea7a7f15794cc9cc16d23e25689bf18c30de24c48"
  end

  resource "botocore" do
    url "https://files.pythonhosted.org/packages/d5/0e/b3c9eebe95c3cbbaabd72edde5aed9e16d2da6dff4a0aaf5dff3c4e072f9/botocore-1.5.86.tar.gz"
    sha256 "e0c8020c9b33c37b4ae09e1e9cd5b172aa1b0e331cf08d53d65ba932c56759d7"
  end

  resource "bundle-placement" do
    url "https://files.pythonhosted.org/packages/7f/f3/635ef95ac9afb049e721774acbbda39a1a9d2963b10c08cded15bf09ae43/bundle-placement-0.0.2.tar.gz"
    sha256 "3ee288c0d5b889d1a9e04d1c09c9527b471b57a7df1f4898cebb990a6a967b05"
  end

  resource "charmhelpers" do
    url "https://files.pythonhosted.org/packages/30/4d/b65532ca36a8a68271d4950c70fb43b90fbdab56be3f9b0e3497a6d481ec/charmhelpers-0.18.1.tar.gz"
    sha256 "15dbae866550b724fb81ce501e118386b28a554110bd45f8ce3f62139411cf9f"
  end

  resource "colorama" do
    url "https://files.pythonhosted.org/packages/f0/d0/21c6449df0ca9da74859edc40208b3a57df9aca7323118c913e58d442030/colorama-0.3.7.tar.gz"
    sha256 "e043c8d32527607223652021ff648fbb394d5e19cba9f1a698670b338c9d782b"
  end

  resource "contextlib2" do
    url "https://files.pythonhosted.org/packages/6e/db/41233498c210b03ab8b072c8ee49b1cd63b3b0c76f8ea0a0e5d02df06898/contextlib2-0.5.5.tar.gz"
    sha256 "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
  end

  resource "docutils" do
    url "https://files.pythonhosted.org/packages/84/f4/5771e41fdf52aabebbadecc9381d11dea0fa34e4759b4071244fa094804c/docutils-0.14.tar.gz"
    sha256 "51e64ef2ebfb29cae1faa133b3710143496eca21c530f3f71424d77687764274"
  end

  resource "env" do
    url "https://github.com/battlemidget/env/archive/1.0.0.tar.gz"
    sha256 "a26b5c973df792ecfc1fc6b18cf696ccaf4c02c918b2878e81c6d495debaa340"
  end

  resource "Jinja2" do
    url "https://files.pythonhosted.org/packages/90/61/f820ff0076a2599dd39406dcb858ecb239438c02ce706c8e91131ab9c7f1/Jinja2-2.9.6.tar.gz"
    sha256 "ddaa01a212cd6d641401cb01b605f4a4d9f37bfc93043d7f760ec70fb99ff9ff"
  end

  resource "jmespath" do
    url "https://files.pythonhosted.org/packages/e5/21/795b7549397735e911b032f255cff5fb0de58f96da794274660bca4f58ef/jmespath-0.9.3.tar.gz"
    sha256 "6a81d4c9aa62caf061cb517b4d9ad1dd300374cd4706997aff9cd6aedd61fc64"
  end

  resource "juju" do
    url "https://files.pythonhosted.org/packages/c7/88/13a748d442b2dbcb02852edbeed358f500ee089d1921f1538ba903b8b351/juju-0.6.0.tar.gz"
    sha256 "aa0be18059318cde7c819cffd59dac1a96e9f84aa49fdaf32ce1cdadd7e6b042"
  end

  resource "juju-wait" do
    url "https://files.pythonhosted.org/packages/3d/c2/8cce9ec8386be418a76566fcd2e7dcbaa7138a92b0b9b463306d9191cfd7/juju-wait-2.6.2.tar.gz"
    sha256 "86622804896e80f26a3ed15dff979584952ba484ccb5258d8bab6589e26dd46d"
  end

  resource "jujubundlelib" do
    url "https://files.pythonhosted.org/packages/f5/79/862a0f62f725ed537e298e04942742a6c0110d2da4404040d77ca3e0d8d5/jujubundlelib-0.5.5.tar.gz"
    sha256 "125383aee2f60af66bb909682aa0757d8e0be083e3f8125473e18a9f3f2d4f3d"
  end

  resource "MarkupSafe" do
    url "https://files.pythonhosted.org/packages/4d/de/32d741db316d8fdb7680822dd37001ef7a448255de9699ab4bfcbdf4172b/MarkupSafe-1.0.tar.gz"
    sha256 "a6be69091dac236ea9c6bc7d012beab42010fa914c459791d627dad4910eb665"
  end

  resource "netaddr" do
    url "https://files.pythonhosted.org/packages/0c/13/7cbb180b52201c07c796243eeff4c256b053656da5cfe3916c3f5b57b3a0/netaddr-0.7.19.tar.gz"
    sha256 "38aeec7cdd035081d3a4c306394b19d677623bf76fa0913f6695127c7753aefd"
  end

  resource "oauthlib" do
    url "https://files.pythonhosted.org/packages/8d/f6/73febc3edf774239b18231d8b17cf2c3319dd128f7fe2f55f3fdf96477b4/oauthlib-2.0.3.tar.gz"
    sha256 "f36c6631d072a2acb8b3b99f94e5e314f1fb4ed996696b18b2723769391c071b"
  end

  resource "PrettyTable" do
    url "https://files.pythonhosted.org/packages/ef/30/4b0746848746ed5941f052479e7c23d2b56d174b82f4fd34a25e389831f5/prettytable-0.7.2.tar.bz2"
    sha256 "853c116513625c738dc3ce1aee148b5b5757a86727e67eff6502c7ca59d43c36"
  end

  resource "progressbar2" do
    url "https://files.pythonhosted.org/packages/ab/d1/44d8235bac6fca2480f256a47630aa759638f3d6ad4d3ebe8ec0ae38409d/progressbar2-3.20.0.tar.gz"
    sha256 "a16d34da27bfa9800605f1de3342138e102797a4b8198864c8822e94caa0e5f7"
  end

  resource "psutil" do
    url "https://files.pythonhosted.org/packages/57/93/47a2e3befaf194ccc3d05ffbcba2cdcdd22a231100ef7e4cf63f085c900b/psutil-5.2.2.tar.gz"
    sha256 "44746540c0fab5b95401520d29eb9ffe84b3b4a235bd1d1971cbe36e1f38dd13"
  end

  resource "pyasn1" do
    url "https://files.pythonhosted.org/packages/1a/37/7ac6910d872fdac778ad58c82018dce4af59279a79b17403bbabbe2a866e/pyasn1-0.3.4.tar.gz"
    sha256 "3946ff0ab406652240697013a89d76e388344866033864ef2b097228d1f0101a"
  end

  resource "python-dateutil" do
    url "https://files.pythonhosted.org/packages/54/bb/f1db86504f7a49e1d9b9301531181b00a1c7325dc85a29160ee3eaa73a54/python-dateutil-2.6.1.tar.gz"
    sha256 "891c38b2a02f5bb1be3e4793866c8df49c7d19baabf9c1bad62547e0b4866aca"
  end

  resource "python-utils" do
    url "https://files.pythonhosted.org/packages/19/f2/2c4c8c2a92325d0c70ef21647583179058ae64d07429e30ab2476624e40b/python-utils-2.2.0.tar.gz"
    sha256 "d9b8ab1f2a7c8f26ed16a47505f589a5d51c0d1e55869ab40c20e1c4b42af2c0"
  end

  resource "pyvmomi" do
    url "https://files.pythonhosted.org/packages/95/82/40f8c37a4c5264a2d581c24eb5f191cbdfe7f574d4013180edc84bbbf401/pyvmomi-6.5.0.2017.5-1.tar.gz"
    sha256 "c28292594281901e894c39a0c06b4126a9c019b3d804c47fb116472299dbb42d"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/4a/85/db5a2df477072b2902b0eb892feb37d88ac635d36245a72a6a69b23b383a/PyYAML-3.12.tar.gz"
    sha256 "592766c6303207a20efc445587778322d7f73b161bd994f227adaa341ba212ab"
  end

  resource "raven" do
    url "https://files.pythonhosted.org/packages/ee/82/9a85650c174920f5bd260b8138a1db7190156e55193b0a1d03d2fa7a2811/raven-6.1.0.tar.gz"
    sha256 "02cabffb173b99d860a95d4908e8b1864aad1b8452146e13fd7e212aa576a884"
  end

  resource "requests" do
    url "https://files.pythonhosted.org/packages/72/46/4abc3f5aaf7bf16a52206bb0c68677a26c216c1e6625c78c5aef695b5359/requests-2.14.2.tar.gz"
    sha256 "a274abba399a23e8713ffd2b5706535ae280ebe2b8069ee6a941cb089440d153"
  end

  resource "requests-oauthlib" do
    url "https://files.pythonhosted.org/packages/80/14/ad120c720f86c547ba8988010d5186102030591f71f7099f23921ca47fe5/requests-oauthlib-0.8.0.tar.gz"
    sha256 "883ac416757eada6d3d07054ec7092ac21c7f35cb1d2cf82faf205637081f468"
  end

  resource "rsa" do
    url "https://files.pythonhosted.org/packages/14/89/adf8b72371e37f3ca69c6cb8ab6319d009c4a24b04a31399e5bd77d9bb57/rsa-3.4.2.tar.gz"
    sha256 "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
  end

  resource "s3transfer" do
    url "https://files.pythonhosted.org/packages/a8/58/d264e95e1b19a811fc52ff41c95dafd9c70cc7457b658bc04d87dfad31de/s3transfer-0.1.11.tar.gz"
    sha256 "76f1f58f4a47e2c8afa135e2c76958806a3abbc42b721d87fd9d11409c75d979"
  end

  resource "sh" do
    url "https://files.pythonhosted.org/packages/d8/97/39aa189a8392522cc24f14f392955cbeac48e2818d776241c37eb6d0eb3c/sh-1.12.13.tar.gz"
    sha256 "979928ca113cade663bb1a0ff710e3eb9147596cf28a7ee4c04f9d85804f7b9f"
  end

  resource "six" do
    url "https://files.pythonhosted.org/packages/b3/b2/238e2590826bfdd113244a40d9d3eb26918bd798fc187e2360a8367068db/six-1.10.0.tar.gz"
    sha256 "105f8d68616f8248e24bf0e9372ef04d3cc10104f1980f54d57b2ce73a5ad56a"
  end

  resource "Tempita" do
    url "https://files.pythonhosted.org/packages/56/c8/8ed6eee83dbddf7b0fc64dd5d4454bc05e6ccaafff47991f73f2894d9ff4/Tempita-0.5.2.tar.gz"
    sha256 "cacecf0baa674d356641f1d406b8bff1d756d739c46b869a54de515d08e6fc9c"
  end

  resource "termcolor" do
    url "https://files.pythonhosted.org/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz"
    sha256 "1d6d69ce66211143803fbc56652b41d73b4a400a2891d7bf7a1cdf4c02de613b"
  end

  resource "theblues" do
    url "https://files.pythonhosted.org/packages/ab/09/21a4718cb6f06573153de35af742e4c251ca9b628c9001d06f6ed4b2cae5/theblues-0.3.8.tar.gz"
    sha256 "649f4013d3b9024f7990a7e0b42aed2196daea64a7c8501dde4f1f57ab8aa031"
  end

  resource "ubuntui" do
    url "https://files.pythonhosted.org/packages/2c/b0/a94f39f078e1471c19466f6d600d4b606cee00873015c5e40e3e2bf0ec85/ubuntui-0.1.7.tar.gz"
    sha256 "c9eebf1ef0461ce3b058fc25e7c77248331588573f8f30d5038f7fe3d24f03f6"
  end

  resource "urwid" do
    url "https://files.pythonhosted.org/packages/85/5d/9317d75b7488c335b86bd9559ca03a2a023ed3413d0e8bfe18bea76f24be/urwid-1.3.1.tar.gz"
    sha256 "cfcec03e36de25a1073e2e35c2c7b0cc6969b85745715c3a025a31d9786896a1"
  end

  resource "websockets" do
    url "https://files.pythonhosted.org/packages/4a/e8/acf36f117deeb18c0b6679624fa11b57b0876044f0ce3f34024c3a7b2d95/websockets-3.4.tar.gz"
    sha256 "43e5b9f51dd0000a4c6f646e2ade0c886bd14a784ffac08b9e079bd17a63bcc5"
  end

  resource "ws4py" do
    url "https://files.pythonhosted.org/packages/aa/60/5d135c8161a2a67d7c227d57bb599fad967d818dbcdca08daa2d60eb87b9/ws4py-0.3.4.tar.gz"
    sha256 "85d5c01bb0d031e151a32fad56094caf54e20c2ddb51cf25b5709421ff92d007"
  end

  def install
    virtualenv_install_with_resources
  end

  test do
    assert_match "No spells found, syncing from registry, please wait", shell_output("#{bin}/conjure-up openstack-base metal --show-env")
    File.exist? "#{testpath}/.cache/conjure-up-spells/spells-index.yaml"
  end
end
