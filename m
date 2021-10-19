From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Tue, 19 Oct 2021 09:03:59 +0100
Subject: [PATCH v3 00/23] Fix some issues at documentation
Message-ID: <cover.1634630485.git.mchehab+huawei@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Jon,

This series is against today's next (next-20211019) and addresses missing
links to Documentation/*.

The best would be to have the patches applied directly to the trees that
contain the patches that moved/renamed files, and then apply the
remaining ones either later during the merge window or just afterwards,
whatever works best for you.

Regards,
Mauro

Mauro Carvalho Chehab (23):
  visorbus: fix a copyright symbol that was bad encoded
  libbpf: update index.rst reference
  docs: accounting: update delay-accounting.rst reference
  MAINTAINERS: update arm,vic.yaml reference
  MAINTAINERS: update aspeed,i2c.yaml reference
  MAINTAINERS: update faraday,ftrtc010.yaml reference
  MAINTAINERS: update ti,sci.yaml reference
  MAINTAINERS: update intel,ixp46x-rng.yaml reference
  MAINTAINERS: update nxp,imx8-jpeg.yaml reference
  MAINTAINERS: update gemini.yaml reference
  MAINTAINERS: update brcm,unimac-mdio.yaml reference
  MAINTAINERS: update mtd-physmap.yaml reference
  Documentation: update vcpu-requests.rst reference
  bpftool: update bpftool-cgroup.rst reference
  docs: translations: zn_CN: irq-affinity.rst: add a missing extension
  docs: translations: zh_CN: memory-hotplug.rst: fix a typo
  docs: fs: locks.rst: update comment about mandatory file locking
  fs: remove a comment pointing to the removed mandatory-locking file
  Documentation/process: fix a cross reference
  dt-bindings: mfd: update x-powers,axp152.yaml reference
  regulator: dt-bindings: update samsung,s2mpa01.yaml reference
  regulator: dt-bindings: update samsung,s5m8767.yaml reference
  dt-bindings: reserved-memory: ramoops: update ramoops.yaml references

 Documentation/admin-guide/ramoops.rst         |  2 +-
 Documentation/admin-guide/sysctl/kernel.rst   |  2 +-
 Documentation/bpf/index.rst                   |  2 +-
 .../devicetree/bindings/gpio/gpio-axp209.txt  |  2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml   |  2 +-
 .../bindings/regulator/samsung,s5m8767.yaml   |  2 +-
 Documentation/filesystems/locks.rst           | 17 +++++-----------
 Documentation/process/submitting-patches.rst  |  4 ++--
 .../zh_CN/core-api/irq/irq-affinity.rst       |  2 +-
 .../zh_CN/core-api/memory-hotplug.rst         |  2 +-
 MAINTAINERS                                   | 20 +++++++++----------
 arch/riscv/kvm/vcpu.c                         |  2 +-
 drivers/visorbus/visorbus_main.c              |  2 +-
 fs/locks.c                                    |  1 -
 .../selftests/bpf/test_bpftool_synctypes.py   |  2 +-
 15 files changed, 28 insertions(+), 36 deletions(-)

-- 
2.31.1



